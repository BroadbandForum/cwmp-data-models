The Broadband Forum defines several data models for use with the CPE WAN Management Protocol ([TR-069 Amendment 6](https://www.broadband-forum.org/technical/download/TR-069_Amendment-6.pdf)).  These data models contain objects and parameters that describe the many different functions and capabilities available to devices and services that are manageable via CWMP.

CWMP data models are divided into two types: `Root` and `Service`.  The root data model, `Device`, is used to describe the major functions of a network aware device, including interfaces, software/firmware, diagnostics, components common to CWMP and other services, and the basic device information necessary to CWMP.

Service data models describe modular functionality that allow the extension of the root data model on a device (under `Device.Services.`) to provide particular services, such as a voice service, set top box service, network attached storage, etc.

Each data model is defined by a `Name:Version` syntax. A device defines its data model by defining a *device type*, an XML document that maps to (imports) BBF official data model objects and/or vendor specific objects. A full explanation of how to develop compliant CWMP data models can be found in [TR-154](https://www.broadband-forum.org/technical/download/TR-154.pdf).
