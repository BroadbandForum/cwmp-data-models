The Broadband Forum defines several data models for use with the User Services Platform ([USP](https://www.broadband-forum.org/technical/download/TR-369.pdf)). These data models contain objects, parameters, commands, and events that describe the many different service elements that can be exposed via USP Agents.

USP data models are divided into two types: `Root` and `Service`. The root data model, `Device`, is used to describe the major functions of network aware devices, including interfaces, software/firmware, diagnostics, components common to USP and other services, and the basic Agent information necessary to the operation of USP.

Service data models describe modular functionality that allow the extension of the root data model on a device (under `Device.Services.`) to provide particular services, such as a voice service, set top box service, network attached storage, smart home objects, etc.

Each data model is defined by a `Name:Version` syntax. The objects, parameters, commands, and events that a particular Agent supports from its implementation of the data model define what is reported to Controllers via the `GetSupportedDM` message.
