The Broadband Forum defines several data models for use with the CPE WAN Management Protocol. These data models contain objects and parameters that describe the many different service elements that can be exposed via CWMP Endpoints.

CWMP data models are divided into two types: Root and Service.

* The root data model, Device, is used to describe the major functions of network aware devices, including interfaces, software/firmware, diagnostics, components common to CWMP and other services, and the basic Endpoint information necessary to the operation of CWMP.

* Service data models describe modular functionality that allow the extension of the root data model on a device (under Device.Services.) to provide particular services, such as a voice service, set top box service, network attached storage, smart home objects, etc.

Each data model is defined by a Name:Version syntax. The objects and parameters that a particular Endpoint supports from its implementation of the data model define what is reported to the ACS via the SupportedDataModel object.
