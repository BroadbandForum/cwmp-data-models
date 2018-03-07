The Broadband Forum defines several data models for use with the User Services Platform (USP) and the CPE WAN Management Protocol (CWMP).

USP and CWMP share a single set of data models, but they are used in slightly different ways by the two protocols. For example, only USP supports data model commands and events (CWMP uses objects and parameters to simulate commands and events).

Data models are divided into two types: Root and Service.

* The Root data model, Device, is used to describe the major functions of network aware devices, including interfaces, software/firmware, and diagnostics.

* Service data models describe modular functionality that allow the extension of the root data model on a device (under Device.Services.) to provide particular services, such as a voice service, set top box service, network attached storage, smart home objects, etc.
