# makefile

TOPDIR = .

include $(TOPDIR)/../../install/etc/defs.mk

REPORTFLAGS += --cwmpindex=..
REPORTFLAGS += --nofontstyles
REPORTFLAGS += --nowarnreport
REPORTFLAGS += --quiet

REPORTINDEXFLAGS += --report=htmlbbf
REPORTINDEXFLAGS += --configfile=$(TOPDIR)/OD-148.txt
REPORTINDEXFLAGS += --cwmppath=''
REPORTINDEXFLAGS += --option \
	htmlbbf_deprecatedmodels="InternetGatewayDevice:1 Device:1"
REPORTINDEXFLAGS += --option \
	htmlbbf_deprecatedpattern="^tr-157-.*\.xml$$"
REPORTINDEXFLAGS += --option \
        htmlbbf_omitpattern="-(\d+-\d+-(biblio|types)|common)\.xml$$"
REPORTINDEXFLAGS += --option htmlbbf_createfragment=true
REPORTINDEXFLAGS += --option htmlbbf_onlyfullxml=true

# XXX these remove many warnings and errors; a good idea?
REPORTINDEXFLAGS += --autobase
REPORTINDEXFLAGS += --automodel
REPORTINDEXFLAGS += --loglevel=error

# disable default CWMP stuff
# XXX shouldn't be using reportincludes (it's lower case so internal)
CWMPXSD =
TRXSD =
DMXML =
reportincludes =
INSTALLCWMP =
PUBLISHCWMP =

# CWMPDIR contains all the source files
SRCXSD = $(subst $(CWMPDIR),,$(wildcard $(CWMPDIR)*.xsd))
SRCXML = $(subst $(CWMPDIR),,$(wildcard $(CWMPDIR)*.xml))

# filter out USP XSD files
# XXX there aren't any
SRCXSD_ = $(filter-out %-usp.xsd, $(SRCXSD))

# filter out USP XML files
SRCXML_ = $(filter-out %-usp.xml, $(SRCXML))

# candidate model XML (new major version)
srcxml0 = $(subst $(CWMPDIR),,$(wildcard $(CWMPDIR)tr-???-?-0*.xml))
SRCXML0 = $(filter-out tr-098-1-0-0.xml tr-181-1-0-0.xml, $(srcxml0))

# component and dev+igd model XML
dualxml = tr-143-1-0-2.xml \
	  tr-157-1-0-0.xml tr-157-1-1-0.xml tr-157-1-2-0.xml tr-157-1-3-0.xml
DUALXML = $(filter $(dualxml), $(SRCXML_))

# component XML (includes the above)
compxml = tr-143-1-1-0.xml \
	  tr-157-1-4-0.xml tr-157-1-5-0.xml tr-157-1-6-0.xml \
	  tr-157-1-7-0.xml tr-157-1-8-0.xml tr-157-1-9-0.xml \
	  tr-157-1-10-0.xml \
	  tr-262-1-0-0.xml
COMPXML = $(filter $(dualxml) $(compxml), $(SRCXML_))

# latest model XML
# XXX if this is wrong, it won't be detected... could easily warn?
# XXX since flattening, need to include all versions, which causes some
#     report tool warnings and errors
latestxml = tr-098-1-8-0.xml \
	    tr-104-1-1-0.xml \
	    tr-104-2-0-1-cwmp.xml \
	    tr-135-1-3-0.xml \
	    tr-135-1-4-1-cwmp.xml \
	    tr-140-1-2-0.xml \
	    tr-140-1-3-1-cwmp.xml \
	    tr-181-1-7-0.xml \
	    tr-181-2-11-0.xml \
	    tr-181-2-12-0-cwmp.xml \
	    tr-181-2-13-0-cwmp.xml \
	    tr-196-1-1-1.xml \
	    tr-196-2-0-3.xml \
	    tr-196-2-1-1-cwmp.xml
LATESTXML = $(filter $(latestxml), $(SRCXML_))

# support XML
BIBLIOXML = $(filter tr-069%-biblio.xml, $(SRCXML_))
TYPESXML = $(filter tr-106%-types.xml, $(SRCXML_))
EXTRAXML = $(filter catalog%.xml, $(SRCXML_))
SUPPORTXML = $(BIBLIOXML) $(TYPESXML) $(EXTRAXML)

# model XML (excluding and including dev+igd)
modelxml = $(filter-out $(SUPPORTXML) $(COMPXML), $(SRCXML_))
MODELXML = $(filter-out $(SUPPORTXML) $(compxml), $(SRCXML_))

# model XML (new major version and excluding dev+igd)
modelxml0 = $(filter $(modelxml), $(SRCXML0))

# model XML (not new major version and excluding dev+igd)
modelxml1 = $(filter-out $(modelxml0), $(modelxml))

ifneq "$(sort $(SRCXML_))" "$(sort $(SUPPORTXML) $(COMPXML) $(MODELXML))"
  $(info target XML doesn't include all the source XML:)
  $(info $(sort $(filter-out $(SUPPORTXML) $(COMPXML) $(MODELXML), $(SRCXML_))))
endif

# all XML (source and generated)
XML = $(SUPPORTXML) $(COMPXML) $(MODELXML) $(MODELXML:%.xml=%-full.xml)

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
INDEXHTML = _index.html

# all HTML
HTML = $(SUPPORTHTML) $(DIFFSMODELHTML) $(FULLMODELHTML) \
       $(DEVMODELHTML) $(IGDMODELHTML) $(COMPHTML) $(INDEXHTML)

# overrides
$(BIBLIOHTML): REPORTFLAGS += --allbibrefs
$(COMPHTML): REPORTFLAGS += --nomodels --automodel

TARGETS = $(SRCXSD_) $(XML) $(HTML)

# build in the local directory
# XXX not be a good idea, because it mixes source and targets, but it's not
#     trivial to change it
TARGETDIR =

include $(TOPDIR)/../../install/etc/rules.mk

$(SRCXSD_) $(SRCXML_): %: $(CWMPDIR)%
	$(INSTALLCMD) $< $@

# XXX these dependencies are incomplete (need proper dependencies)
$(INDEXHTML): $(SRCXSD_) $(LATESTXML)
	$(REPORT) $(REPORTFLAGS) $(REPORTINDEXFLAGS) --outfile=$@ $^
