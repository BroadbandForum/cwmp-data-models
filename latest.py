#!/usr/bin/env python3

"""Given a path name of the form "DIR/tr-nnn-i-a-label.xxx", find the latest
(highest numeric value of c) "DIR/tr-nnn-i-a-c-label.xxx" ("-label" is
optional)."""

import argparse, glob, logging, os, re, sys

class ParseException(Exception):
    pass

class MatchException(Exception):
    pass

def main(argv=None):
    """Main program."""

    if argv is None:
        argv = sys.argv

    # XXX this could be put into a general arg-parsing utility
    (_, prog) = os.path.split(argv[0])

    format = '%s:%s'
    loglevel = 0
    paths = None
    
    parser = argparse.ArgumentParser(prog=prog, description="TBD")
    parser.add_argument("-f", "--format", type=str, default=format, nargs='?',
                        help="Format substituting supplied and latest paths; "
                        "default: %s" % format)
    parser.add_argument("-l", "--loglevel", type=int,
                        help="Logging level; default: %d" % loglevel)
    parser.add_argument("path", type=str, default=paths, nargs='+',
                        help="Path to file for which to find latest version; "
                        "default: %s" % repr(paths))
    args = parser.parse_args(argv[1:])

    if args.format is not None: format = args.format
    if args.loglevel is not None: loglevel = args.loglevel
    if args.path is not None: paths = args.path

    loglevel_map = {0: logging.WARN, 1: logging.INFO, 2: logging.DEBUG}
    logging.basicConfig(level=loglevel_map[loglevel])

    logging.debug('paths %s' % paths)

    try:
        for path in paths:
            process(format, path)
        return 0
        
    except (ParseException, MatchException) as e:
        sys.stderr.write('%s: %s\n' % (e.__class__.__name__, e))
        return 1

def process(format, path):
    (dir, tr, nnn, i, a, c, label, ext) = parse(path)
    if c:
        lpath = path
    else:
        c = latest(dir, tr, nnn, i, a, label, ext)
        lpath = unparse(dir, tr, nnn, i, a, c, label, ext)

    sys.stdout.write((format + '\n') % (path, lpath))

def parse(path):
    (dir, name) = os.path.split(path)

    # XXX this is more general than is needed, e.g. 
    match = re.match(r"""([^-]+)-     # tr -
                         (\d+)        # nnn
                         (?:-(\d+))?  # - i    (optional)
                         (?:-(\d+))?  # - a    (optional)
                         (?:-(\d+))?  # - c    (optional)
                         (-\D[^\.]*)? # -label (optional)
                         (\..*)?      # .ext   (optional)
                      """,
                     name, re.VERBOSE)
    if match is None or match.lastindex < len(match.groups()):
        raise ParseException('path %s does not match tr-nnn pattern' % path)

    retval = (dir,) + match.groups('')
    logging.debug('parse %s -> %s' % (path, retval))
    return retval

def unparse(dir, tr, nnn, i, a, c, label, ext):
    # unmatched groups default to empty strings; override for i and a
    if i is '': i = '1'
    if a is '': a = '0'

    name = '%s-%s-%s-%s-%s%s%s' % (tr, nnn, i, a, c, label, ext)
    path = os.path.join(dir, name)
    return path

def latest(dir, tr, nnn, i, a, label, ext):
    patt = unparse(dir, tr, nnn, i, a, '*', label, ext)
    paths = glob.glob(patt)
    
    c = None
    for path in paths:
        logging.debug('latest %s -> %s' % (patt, path))
        (dir_, tr_, nnn_, i_, a_, c_, label_, ext_) = parse(path)
        # glob ignores the label so too many files can match; hence check label
        if label_ == label and (c is None or int(c_) > c):
            c = int(c_)

    if c is None:
        raise MatchException('pattern %s has no valid matches' % patt)
    
    return None if c is None else str(c)

if __name__ == "__main__":
    sys.exit(main())
