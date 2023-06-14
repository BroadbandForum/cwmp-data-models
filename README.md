<!-- do not edit! this file was created from PROJECT.yaml by project-parser.py -->

# Broadband Forum CPE WAN Management Protocol (CWMP) Data Models

The latest CPE WAN Management Protocol ([CWMP]) data models
can be found at <https://cwmp-data-models.broadband-forum.org>.

[CWMP]: https://www.broadband-forum.org/technical/download/TR-069.pdf

The Broadband Forum defines several data models for use with the CPE WAN
Management Protocol ([TR-069 Amendment 6][TR-069]). These data models contain
objects and parameters that describe the many different functions and
capabilities available to devices and services that are manageable via CWMP.

CWMP data models are divided into two types: *Root* and *Service*.
The root data model, *Device*[^1], is used to describe the major functions
of a network aware device, including interfaces, software/firmware,
diagnostics, components common to CWMP and other services, and the
basic device information necessary to CWMP.

Service data models describe modular functionality that allow the
extension of the root data model on a device (under *Device.Services.*)
to provide particular services, such as a voice service, set top box
service, network attached storage, etc.

Each data model is defined by a *Name:Version* syntax. A device
defines its data model by defining a *device type*, an XML document
that maps to (imports) BBF official data model objects and/or vendor
specific objects. A full explanation of how to develop compliant CWMP
data models can be found in [TR-154].

Note: All the files below are directly reachable via:
<https://www.broadband-forum.org/cwmp/<filename>>.

[^1]: Early versions of the CWMP data model defined two root data models,
*InternetGatewayDevice* and *Device*. Version 2 of the *Device* root data
model (*Device:2*) deprecates *InternetGatewayDevice* and *Device:1* in favor
of a single root data model.

## How do I use these? 

Use the CWMP data model files to define and implement what exists in your
solution's *Supported Data Model*. This will help the ACS to learn what your
CPE is capable of. The data models will also describe how your CPE's
*Instantiated Data Model* will behave during operation.

* View the HTML files on this page for a human-readable look at the data
  model documentation.
* Use the XML files in this repository when generating code and performing
  data validation.

These data models are the basis for the Broadband Forum's [data models for
the User Services Platform (USP)][usp-data-models].

The source files used to build the complete CWMP data model can be found on
[GitHub].

A ZIP file containing all the latest data models can be downloaded from
[here][ZIP].

[TR-069]: https://www.broadband-forum.org/download/TR-069.pdf
[TR-154]: https://www.broadband-forum.org/download/TR-154.pdf

[usp-data-models]: https://usp-data-models.broadband-forum.org
[GitHub]: https://github.com/BroadbandForum/cwmp-data-models

[ZIP]: https://github.com/BroadbandForum/cwmp-data-models/archive/master.zip
