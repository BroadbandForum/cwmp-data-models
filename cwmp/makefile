# cwmp/makefile

# XXX the 'link' target can't be made until 'all' has been made; this is
#     because it searches for "latest corrigendum" files in the current
#     directory (to fix this, we'd need to be much more careful about
#     deriving all variables only from CWMPDIR)

# XXX will move common parts of cwmp/makefile and usp/makefile to ../defs.mk
#     and ../rules.mk

TOPDIR = ..

include $(TOPDIR)/../../install/etc/defs.mk

REPORTFLAGS += --cwmpindex=../cwmp
REPORTFLAGS += --nofontstyles
REPORTFLAGS += --nowarnreport
REPORTFLAGS += --quiet

REPORTINDEXFLAGS += --report=htmlbbf
REPORTINDEXFLAGS += --configfile=$(TOPDIR)/OD-148.txt
REPORTINDEXFLAGS += --cwmppath=''

# disable default CWMP stuff
# XXX shouldn't be using reportincludes (it's lower case so internal)
DMXML =
reportincludes =
INSTALLCWMP =
PUBLISHCWMP =

# CWMPDIR contains all the source files
SRCXSD = $(subst $(CWMPDIR),,$(wildcard $(CWMPDIR)*.xsd))
# XXX have to manually filter out USP files
SRCXML = $(filter-out tr-181-2-12-0-usp.xml, \
		$(subst $(CWMPDIR),,$(wildcard $(CWMPDIR)*.xml)))

# XXX a script should generate at least some of these hard-coded lists

# candidate model XML (new major version)
SRCXML- = $(subst $(CWMPDIR),,$(wildcard $(CWMPDIR)tr-???-?-0-?.xml))
SRCXML0 = $(filter-out tr-098-1-0-0.xml tr-181-1-0-0.xml, $(SRCXML-))

# component and dev+igd model XML
dualxml = tr-143-1-0-2.xml \
	  tr-157-1-0-0.xml tr-157-1-1-0.xml tr-157-1-2-0.xml tr-157-1-3-0.xml
DUALXML = $(filter $(dualxml), $(SRCXML))

# component XML (includes the above)
compxml = tr-143-1-1-0.xml \
	  tr-157-1-4-0.xml tr-157-1-5-0.xml tr-157-1-6-0.xml \
	  tr-157-1-7-0.xml tr-157-1-8-0.xml tr-157-1-9-0.xml \
	  tr-157-1-10-0.xml \
	  tr-262-1-0-0.xml
COMPXML = $(filter $(dualxml) $(compxml), $(SRCXML))

# latest model XML
# XXX if this is wrong, it won't be detected... could easily warn?
latestxml = tr-098-1-8-0.xml \
	    tr-104-1-1-0.xml tr-104-2-0-0.xml \
	    tr-135-1-4-0.xml \
	    tr-140-1-3-0.xml \
	    tr-181-1-7-0.xml \
	    tr-181-2-12-0-cwmp.xml \
	    tr-196-1-1-1.xml tr-196-2-1-0.xml
LATESTXML = $(filter $(latestxml), $(SRCXML))

# support XML
BIBLIOXML = $(subst $(CWMPDIR),,$(wildcard $(CWMPDIR)tr-*-biblio.xml))
TYPESXML = $(subst $(CWMPDIR),,$(wildcard $(CWMPDIR)tr-*-types.xml))
EXTRAXML = catalog.xml
SUPPORTXML = $(BIBLIOXML) $(TYPESXML) $(EXTRAXML)

# model XML (excluding and including dev+igd)
modelxml = $(filter-out $(SUPPORTXML) $(COMPXML), $(SRCXML))
MODELXML = $(filter-out $(SUPPORTXML) $(compxml), $(SRCXML))

# model XML (new major version and excluding dev+igd)
modelxml0 = $(filter $(modelxml), $(SRCXML0))

# model XML (not new major version and excluding dev+igd)
modelxml1 = $(filter-out $(modelxml0), $(modelxml))

ifneq "$(sort $(SRCXML))" "$(sort $(SUPPORTXML) $(COMPXML) $(MODELXML))"
  $(info target XML doesn't include all the source XML:)
  $(info $(sort $(filter-out $(SUPPORTXML) $(COMPXML) $(MODELXML), $(SRCXML))))
endif

# sed script for generating "no corrigendum" file name
nocsed = -e 's/tr-([0-9]+)-([0-9]+)-([0-9]+)-([0-9]+)/tr-\1-\2-\3/g'

# all XML (source and generated) excluding "no corrigendum" soft links
XML = $(SUPPORTXML) $(COMPXML) $(MODELXML) $(MODELXML:%.xml=%-full.xml)

# all XML (source and generated) "no corrigendum" soft links
XML1 = $(sort $(filter-out $(XML), $(shell echo $(XML) | sed -E $(nocsed))))

# support HTML
BIBLIOHTML = $(BIBLIOXML:%.xml=%.html)
TYPESHTML = $(TYPESXML:%.xml=%.html)
SUPPORTHTML = $(BIBLIOHTML) $(TYPESHTML)

# model HTML (diffs; not new major version and excluding dev+igd)
DIFFSMODELHTML = $(modelxml1:%.xml=%-diffs.html)

# model HTML (full; everything, including dev+igd)
FULLMODELHTML = $(MODELXML:%.xml=%.html)

# dev+igd HTML
DEVMODELHTML = $(DUALXML:%.xml=%-dev-diffs.html) $(DUALXML:%.xml=%-dev.html)
IGDMODELHTML = $(DUALXML:%.xml=%-igd-diffs.html) $(DUALXML:%.xml=%-igd.html)

# component HTML
COMPHTML = $(COMPXML:%.xml=%.html)

# index HTML
INDEXHTML = index.html

# all HTML excluding "no corrigendum" soft links
HTML = $(SUPPORTHTML) $(DIFFSMODELHTML) $(FULLMODELHTML) \
       $(DEVMODELHTML) $(IGDMODELHTML) $(COMPHTML) $(INDEXHTML)

# all HTML "no corrigendum" soft links
HTML1 = $(sort $(filter-out $(HTML), $(shell echo $(HTML) | sed -E $(nocsed))))

# all soft links
LINKS = $(XML1) $(HTML1)

# overrides
$(BIBLIOHTML): REPORTFLAGS += --allbibrefs
$(COMPHTML): REPORTFLAGS += --nomodels --automodel

# XXX what about the "no corrigendum" files? if _do_ create them, use soft
#     links, and probably handle via separate link/unlink targets (because
#     can't use modification dates)
TARGETS = $(SRCXSD) $(XML) $(HTML)

# build in the local directory
# XXX not be a good idea, because it mixes source and targets, but it's not
#     trivial to change it
TARGETDIR =

include $(TOPDIR)/../../install/etc/rules.mk

$(SRCXSD) $(SRCXML): %: $(CWMPDIR)%
	$(INSTALLCMD) $< $@

# XXX these dependencies are incomplete (need proper dependencies)
$(INDEXHTML): $(SRCXSD) $(LATESTXML)
	$(REPORT) $(REPORTFLAGS) $(REPORTINDEXFLAGS) --outfile=$@ $^

# XXX a (better?) alternative would be for it to output to an included (and
#     therefore remade) makefile; I tried this... and failed...
LOGLEVEL = 0
LATEST_PY = $(TOPDIR)/scripts/latest.py
LATEST = $(LATEST_PY) --loglevel $(LOGLEVEL) --format '%s:_%s;_ln_-sf_$$<_$$@'
$(foreach LINE,$(shell $(LATEST) $(LINKS)), \
  $(eval $(subst _, ,$(LINE))) \
)

# XXX need also to link cwmp to . to avoid index.html warnings
link: $(LINKS)

unlink:
	$(RM) $(LINKS)

CLEAN += $(LINKS)

ZIP = zip
# XXX or to include the time, use 'date +%Y%m%d-%H%M%S'
ZIPFILE = cwmp-$(shell date +%Y%m%d).zip
# XXX can do 'make ZIPFLAGS= zip' to suppress symbolic link creation
ZIPFLAGS = --symlinks

# XXX it would be better to use the make product variables to define the ZIP
#     file contents?
zip:
	$(RM) $(ZIPFILE)
	$(ZIP) $(ZIPFLAGS) $(ZIPFILE) index.html catalog.xml cwmp-*.xsd tr-*.*
