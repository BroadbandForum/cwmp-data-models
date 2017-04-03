TOPDIR = .

include $(TOPDIR)/../../install/etc/defs.mk

REPORTFLAGS += --nowarnreport
REPORTFLAGS += --quiet

REPORTINDEXFLAGS += --report=htmlbbf
REPORTINDEXFLAGS += --configfile=OD-148.txt
REPORTINDEXFLAGS += --cwmppath=''

# disable default CWMP stuff
# XXX shouldn't be using reportincludes (it's lower case so internal)
DMXML =
reportincludes =
INSTALLCWMP =
PUBLISHCWMP =

# CWMPDIR contains all the source files
SRCXSD = $(subst $(CWMPDIR),,$(wildcard $(CWMPDIR)*.xsd))
SRCXML = $(subst $(CWMPDIR),,$(wildcard $(CWMPDIR)*.xml))

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
latestxml = tr-098-1-8-0.xml \
	    tr-104-1-1-0.xml tr-104-2-0-0.xml \
	    tr-135-1-4-0.xml \
	    tr-140-1-3-0.xml \
	    tr-181-1-7-0.xml \
	    tr-181-2-12-0.xml \
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

# all XML (source and generated)
XML = $(SUPPORTXML) $(COMPXML) $(MODELXML) \
      $(MODELXML:%.xml=%-full.xml)

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

# all HTML
HTML = $(SUPPORTHTML) $(DIFFSMODELHTML) $(FULLMODELHTML) \
       $(DEVMODELHTML) $(IGDMODELHTML) $(COMPHTML) $(INDEXHTML)

# overrides
$(BIBLIOHTML): REPORTFLAGS += --allbibrefs
$(COMPHTML): REPORTFLAGS += --nomodels --automodel

# XXX what about the "no corrigendum" files? if _do_ create them, use soft
#     links, and probably handle via separate link/unlink targets (because
#     can't use modification dates)
TARGETS = $(SRCXSD) $(XML) $(HTML)

# build in the local directory
TARGETDIR =

include $(TOPDIR)/../../install/etc/rules.mk

$(SRCXSD) $(SRCXML): %: $(CWMPDIR)%
	$(INSTALL) $< $@

# XXX these dependencies are incomplete (need proper dependencies)
$(INDEXHTML): $(SRCXSD) $(LATESTXML)
	$(REPORT) $(REPORTFLAGS) $(REPORTINDEXFLAGS) --outfile=$@ $^
