<!-- do not edit! this file was created from PROJECT.yaml by project-parser.py -->

# CWMP Data Models Change Log

The latest CPE WAN Management Protocol ([CWMP]) data models
can be found at <https://cwmp-data-models.broadband-forum.org>.

[CWMP]: https://www.broadband-forum.org/technical/download/TR-069.pdf

## 2024-09-04: TR-181 Issue 2 Amendment 18 Corrigendum 1

*Tags: [v1.6.10] (data models), 
       [v2.18.1][TR-181-v2.18.1] (TR-181), 
       [v1.14.0][TR-106-v1.14.0] (TR-106 didn't change)*

## 2024-07-23: [TR-106 Amendment 14] and [TR-181 Issue 2 Amendment 18]

*Tags: [v1.6.9] (data models), 
       [v2.18.0][TR-181-v2.18.0] (TR-181), 
       [v1.14.0][TR-106-v1.14.0] (TR-106)*

### TR-181
* Added more counter types to IoT
* Improved MoCA network state parameter descriptions
* Added new parameter to support VLAN priority
* Added new parameter to indicate the used Ethernet duplex mode
* Improved example Ethernet PHY types by using more commonly used types
* Added new parameter to control the sending of ARP messages on an Ethernet link
* Corrected access type of multiple parameters
* Added new parameters for IP based access control in HTTP access
* Added new parameter to configure the MTU on an Ethernet link
* Added new parameter to link a USPService to an ExecutionUnit providing it
* Extended size of various QoS parameter types from 32 bits to 64 bits types
* Added new parameter to control filtering of ICMPv6 packets
* Changed one more missed parameter from hidden to secured
* Added new parameters to control DHCP retransmission/retry behavior
* Removed some dmr:fixedObject attributes from non-fixed objects
* Added Device.Schedules. mechanism to define time-based schedules for services to use
* Added new parameters indicate the reason for a device reboot
* Added new parameters to configure and check the Ethernet MDIX mode
* Deprecated a decent number of MultiAP commands and parameters due to being supported in DataElements
* Refactored many Interface and Link objects, parameters and commands into components for deduplication
* Refactored and improved the description of the NetworkConfig object
* Replaced outdated DHCPv6 bibref by latest RFC
* Added Reset() command to various interface stats objects
* Promoted some readOnly parameters to readWrite
* Added source and dest port ranges to more firewall objects
* Added success and failure counters to IEEE802.1x supplicant stats
* Added 3GPP-NAS auto configuration type to various enumerations
* Added RemainingLeastTime to port-mapping objects
* Demoted a few readWrite objects to readOnly since they were never meant to be the former
* Added histogram mode to PeriodicSampling mechanism
* Added more informational parameters and ShutdownDelay as well as user configuration to SMM DUs
* Added system capabilities configuration to Users
* Changed parameter type of some Wi-Fi timestamps from string to datetime
* Clarified the credentials allowed usages
* Added UUID, Version, and ExecEnvRef as output arguments to the InstallDU() command
* Adjusted indentation to fix rendering issues
* Added missing Alias keys throughout the data model
* Removed some inappropriate dmr:noUniqueKeys annotations

## 2024-01-18: [TR-106 Amendment 13] and [TR-181 Issue 2 Amendment 17]

*Tags: [v1.6.8] (data models), 
       [v2.17.0][TR-181-v2.17.0] (TR-181), 
       [v1.13.0][TR-106-v1.13.0] (TR-106)*

### TR-181
* Added new parameters for Multi-flow and Multi-server testing
  capability as defined in TR-471 Issue 4
* Updated MoCA data model with MoCA Alliance 2.5 specification
* Added Device.DNS.SD.Advertise object to to allow the configuration of
  DNS-SD services that need to be advertised by the device
* Added RDNSS and DNSSL options to the Device.RouterAdvertisement.InterfaceSetting.{i}. object
* Added missing parameters from the Data Elements R2.1 specification
* Added the Zone file concept to the Device.DNS. object
* Added DNS caching configurability to the Device.DNS.Relay. object, allowing for control
  over the cache settings, added a mechanism to allow the specification of the ingress (LAN side) interface(s)
  to be used by the DNS forwarders
* Added new InterfaceSetting object to Device.Firewall.
* Added ModuleVersion parameter to InstallDU() and Update() commands
* Added Origin parameter to PinHole, PortMapping and AccessControl
* Added PhysAddressMask parameter to AccessControl
* Added LeaseDuration and RemainLeaseTime parameters to the DMZ and Pinhole objects
* Added Device.Firewall.ConnectionTracking. object tree to configure ALGs
* Added missing DSL xTU-C and xTU-R parameters to DSL objects
* Added Device.Syslog. object tree to configure a syslog service
* Added Support for password authentication in xPON
* Added MaxNumberOfPortMappings and MaxNumberOfPortTriggers parameters to indicate system limits
* Fixed the access of some UserInterface parameters and objects: Demoted Session and User to read-only, promoted Protocol to read-write
* Fixed the access of a SSH parameter: Promoted AutoDisableDuration to read-write
* Fixed the access of a USPServices parameter: Demoted Protocol to read-only
* Added UDSAgent:1 and UDSController:1 profiles
* Added Device.DeviceInfo.LogRotate.{i}. to setup a log rotation mechanism
* Clarified descriptions of parameters in Device.SoftwareModules.ExecutionUnit.{i}.AutoRestart.
* Added initial support for the 802.11be Wi-Fi 7 standard/mode in various places
* Added OnBoardingComplete parameter to Device.LocalAgent.Controller.{i}.
* Clarified suggested implementation of Device.PeriodicStatistics. concept
* Added support for passing environment variables to software modules
* Removed reference to an incorrect default port requirement from TR-471
* Added EEEStatus parameter to Device.Ethernet.Interface.{i}.
* Extended the key of Device.LocalAgent.Monitor.{i}.OnChange! ChangeSet.{i}.Parameter.{i}. output argument to include ChangeTime
* Added objects and parameters to align with the work-in-progress DataElements R3 specification
* Refactored scheduling related parameters into component for easier reuse and added Active and TimeLeft parameters
* Added Device.SoftwareModules.ExecutionUnit.{i}.NetworkConfig. object and parameters
* Added MaxSupportedDataDownlinkRate, MaxSupportedDataUplinkRate, SNR, and MaxSupportedBandwidth parameters to Device.WiFi.AccessPoint.{i}.AssociatedDevice.{i}.
* Replaced custom coded Order parameter type and descriptions with the new Order datatype and text template
* Changed the default WebSocket port from 5683 to 8443
* Added support for checksum reporting to TransferComplete! event

## 2023-06-14: [TR-106 Amendment 12] and [TR-181 Issue 2 Amendment 16]

*Tags: [v1.6.7] (data models), 
       [v2.16.0][TR-181-v2.16.0] (TR-181), 
       [v1.12.0][TR-106-v1.12.0] (TR-106)*

### TR-181
* Added Device.LocalAgent.Subscription.{i}.TriggerAction parameter to
  control the notification behavior
* Added SecuredRoles concept to the USP-specific ControllerTrust
* Turned a number of "hidden" parameters into "secured" parameters to
  allow USP Controllers with a secure role to read parameter values
* Added a few parameters to Device.Bridging.Bridge. and sub-objects to
  allow better control over bridges and STP behavior
* Made unique key type (functional vs non-functional) explicit rather
  than defaulting, and fixed incorrect choices
* Added ability to configure exclusions from BulkData reports
* Added Device.DeviceInfo.HostName parameter
* Unified description of Interface parameters
* Updated status according to our deprecation policy
* Extended some incorrect type restrictions
* Fixed/unified some units and their use in the description
* Added SupportedLinkModes parameter to ethernet interfaces
* Clarified the Device.Firewall. object and added support for
  firewall features DMZ, Services, Pinholing and Policies. Also added
  support for additional classifiers
* Introduced Device.GatewayInfo. into USP
* Extended the type of a few counters from unsignedInt to StatsCounter64
* Added new IPLayerCapacityDiagnostic parameters/arguments from the
  TR-471i3 document
* Added UDS (Unix Domain Socket) MTP and Device.UnixDomainSockets. objects
  for internal services
* Added Device.Logical. sub-tree to allow for definition of logical network
  interfaces
* Added Device.NAT.PortTrigger.
* Added USP notification mechanism to Device.PeriodicStatistics.
* Improved PPP LCPEcho description and added LCPEchoAdaptive parameter
* Vastly extended Device.QoS. features by adding Queues, Shapers and Schedulers
* Added new parameters to Device.Routing. and sub-objects to add more routing
  features
* Vastly extended SMM (Software Module Management) capabilities with support for
  ApplicationData, HostObject, ExecEnvClass and AutoRestart
* Added Device.SSH. to configure an SSH service
* Extended Device.Time. with support for NTP client and server configuration
* Added Device.UserInterface.HTTPAccess. to allow for local UI access control
* Added USP-specific Device.LocalAgent.Monitor. object to allow for efficient
  tracking of parameter value changes
* Added support for Device.USPServices. to manage internal services via USP
* Added Device.XPON. to model xPON interfaces
* Applied cleanup for Wi-Fi objects/parameters to line up with Wi-Fi Alliance
  documents
* Removed activeNotify="canDeny" attributes from some parameters
* Added PeriodicStatsAdv:2 and MQTTController:2 profiles
* Added USPServiceRef parameters to MTP referencing a service using it
* Disambiguated NTP vs. SNTP protocols
* Expanded/unified descriptions of parameters used for retries

## 2022-07-19: TR-196 Issue 2 Amendment 1 Corrigendum 2

*Tags: [v1.6.6] (data models), 
       [v2.15.1][TR-181-v2.15.1] (TR-181 didn't change), 
       [v1.11.0][TR-106-v1.11.0] (TR-106 didn't change)*

### TR-196
* Deprecated Blacklisted parameters and replaced with Blocklisted
  parameters

## 2022-04-06: TR-181 Issue 2 Amendment 15 Corrigendum 1

*Tags: [v1.6.5] (data models), 
       [v2.15.1][TR-181-v2.15.1] (TR-181), 
       [v1.11.0][TR-106-v1.11.0] (TR-106 didn't change)*

### TR-181
* Removed items that were erroneously added to the User:1 profile and
  instead added them to a new User:2 profile
* Fixed the BulkData Profile Parameter reference; it's a string, not a
  formal path reference
* Fixed the InstallDU() command's ExecutionEnvRef argument; it
  references an execution environment, not an execution unit
* Fixed the VendorConfigFile description's CWMP/USP-specific text

## 2022-01-27: [TR-106 Amendment 11] and [TR-181 Issue 2 Amendment 15]

*Tags: [v1.6.4] (data models), 
       [v2.15.0][TR-181-v2.15.0] (TR-181), 
       [v1.11.0][TR-106-v1.11.0] (TR-106)*

### TR-106
* Allowed the *version* attribute in component references
* Allowed *minEntries* and *maxEntries* in command and event
  argument objects
* Allowed *status* attribute in profile command/event arguments
* Added *secured* attribute

### TR-181
* Split the XML into multiple smaller files (this is just
  housekeeping; it doesn't affect how the model is used)
* Added Device.USPAgent to the CWMP model to allow a CWMP ACS
  to configure a device for USP communications
* Added Device.Routing.Babel for the RFC 8966 Babel routing
  protocol
* Added Device.DOCSIS for modeling DOCSIS 3.0 and 3.1 interfaces
* Added Device.Users.Group, Device.Users.Role and
  Device.Users.SupportedShell tables for modeling system users
* Improved the Wi-Fi data model by adding Data Elements R2
  parameters, commands and events, moving MultiAP parameters and
  commands into the Data Elements structure, and by deprecating
  AIFSN, ECWMin, ECWMax and TxOpMax
* Clarified the LockoutPeriod and Retries ControllerTrust
  parameters that impact how the RequestChallenge() and
  ChallengeResponse() data model commands handle failed attempts
* Clarified bulk data profile, threshold and periodic statistics USP
  Controller permissions: only the USP Controller that created the
  profile will receive the corresponding events
* Added support for a new bulk data collection mechanism that
  utilizes MQTT as the transport protocol
* Clarified that Device.Optical is intended for generic optical
  interfaces and is not intended to model anything specific to
  IEEE or ITU-T PON technologies (objects specific to such
  technologies may be added in future versions of the data model)
* Clarified the meaning and usage of the Device.Ethernet.Interface
  and Device.Ethernet.Link objects (also allowed the Ethernet
  Link MACAddress parameter to be written)
* Improved (and made more consistent) the marking of (and
  explanation of) deprecated items, and how such items should
  progress from being deprecated to obsoleted to deleted
* Added a Baseline:4 profile that doesn't include
  Device.LANConfigSecurity (it relates to the now-deprecated
  TR-064 LAN management protocol)
* Many minor improvements to object and parameter descriptions
* Replaced the non-standard dmr:version attribute with the version
  attribute (which supports three levels of version)
* Switched to DMR (data model report) schema v1.0, which supports
  multi-line paragraphs, and wrapped all lines to 80 characters
  maximum

## 2020-11-17: TR-181 Issue 2 Amendment 14 Corrigendum 1

*Tags: [v1.6.3] (data models), 
       [v2.14.1][TR-181-v2.14.1] (TR-181), 
       [v1.10.0][TR-106-v1.10.0] (TR-106 didn't change)*

### TR-181
* Removed duplicate remarks about CWMP BOOTSTRAP from descriptions
* Fixed typos

## 2020-11-05: [TR-106 Amendment 10] and [TR-181 Issue 2 Amendment 14]

*Tags: [v1.6.2] (data models), 
       [v2.14.0][TR-181-v2.14.0] (TR-181), 
       [v1.10.0][TR-106-v1.10.0] (TR-106)*

### TR-106
* Allowed command attributes, e.g. mandatory, in component
  definitions

### TR-181
* Added WWC (5G Wireline Wireless Convergence), PDU (Protocol Data
  Unit) and FWE (5G Wireline wireless Encapsulation) top-level objects
* Updated Cellular object to be applicable to 5G Residential Gateways
* Extended support for TR-471 IP-layer metrics, including new IP-layer
  capacity test
* Supported LAN device time-based access-control
* Various Wi-Fi improvements

## 2020-04-06: v1.6.1

*Tags: [v1.6.1] (data models), 
       [v2.13.0][TR-181-v2.13.0] (TR-181 didn't change), 
       [v1.7.0+][TR-106-v1.7.0+] (TR-106 didn't change)*

Regenerated HTML using new [report.pl#425](https://github.com/BroadbandForum/cwmp-xml-tools/releases/tag/report.pl%23425)
version of the BBF report tool

## 2020-01-17: TR-104 Issue 2 Corrigendum 2

*Tags: [v1.6.0c1] (data models), 
       [v2.13.0][TR-181-v2.13.0] (TR-181 didn't change), 
       [v1.7.0+][TR-106-v1.7.0+] (TR-106 didn't change)*

### TR-104
* Clarified meaning of SessionID and added new SIPSessionID

## 2019-09-05: [TR-181 Issue 2 Amendment 13], TR-104 Issue 2 Corrigendum 1, TR-135 Amendment 4 Corrigendum 1, TR-140 Amendment 3 Corrigendum 1 and TR-196 Issue 2 Amendment 1 Corrigendum 1

*Tags: [v1.6.0+] (data models), 
       [v2.13.0][TR-181-v2.13.0] (TR-181), 
       [v1.7.0+][TR-106-v1.7.0+] (TR-106 didn't change)*

### TR-181
* Added support for WFA Data Elements
* Added support for Multi AP
* Added support for WPA3 and 802.11ax
* Added support for MQTT 5.0
* Added support for Packet capture diagnostics
* Updates for TR-369 MQTT support
* Added support for IoT Data model

## 2018-03-18: [TR-181 Issue 2 Amendment 12]

*Tags: [v1.6.0] (data models), 
       [v2.12.0][TR-181-v2.12.0] (TR-181), 
       [v1.7.0+][TR-106-v1.7.0+] (TR-106)*

### TR-181
* Added TR-069a6 support
* Added Firmware Image support
* Added Ethernet Link Aggregation Group
* Added additional Wi-Fi and WAN statistics
* Added support for Two-Way Active Measurement Protocol (TWAMP)
  reflector
* Added support for Layer Two Tunneling Protocol version 3 (L2TPv3)
* Added support for Virtual eXtensible Local Area Network (VXLAN)
  tunnels
* Added support for Broadband Access Service Attributes and
  Performance Metrics measurement test framework (BASAPM)
* Added support for Large-Scale Measurement of Broadband Performance
  (LMAP)

## Previous releases are available at <https://cwmp-data-models.broadband-forum.org>

[TR-106 Amendment 10]: https://www.broadband-forum.org/download/TR-106_Amendment-10.pdf
[TR-106 Amendment 11]: https://www.broadband-forum.org/download/TR-106_Amendment-11.pdf
[TR-106 Amendment 12]: https://www.broadband-forum.org/download/TR-106_Amendment-12.pdf
[TR-106 Amendment 13]: https://www.broadband-forum.org/download/TR-106_Amendment-13.pdf
[TR-106 Amendment 14]: https://www.broadband-forum.org/download/TR-106_Amendment-14.pdf
[TR-106-v1.7.0+]: https://github.com/BroadbandForum/data-model-template/releases/tag/v1.7.0+
[TR-106-v1.10.0]: https://github.com/BroadbandForum/data-model-template/releases/tag/v1.10.0
[TR-106-v1.11.0]: https://github.com/BroadbandForum/data-model-template/releases/tag/v1.11.0
[TR-106-v1.12.0]: https://github.com/BroadbandForum/data-model-template/releases/tag/v1.12.0
[TR-106-v1.13.0]: https://github.com/BroadbandForum/data-model-template/releases/tag/v1.13.0
[TR-106-v1.14.0]: https://github.com/BroadbandForum/data-model-template/releases/tag/v1.14.0
[TR-181 Issue 2 Amendment 12]: https://www.broadband-forum.org/download/TR-181_Issue-2_Amendment-12.pdf
[TR-181 Issue 2 Amendment 13]: https://www.broadband-forum.org/download/TR-181_Issue-2_Amendment-13.pdf
[TR-181 Issue 2 Amendment 14]: https://www.broadband-forum.org/download/TR-181_Issue-2_Amendment-14.pdf
[TR-181 Issue 2 Amendment 15]: https://www.broadband-forum.org/download/TR-181_Issue-2_Amendment-15.pdf
[TR-181 Issue 2 Amendment 16]: https://www.broadband-forum.org/download/TR-181_Issue-2_Amendment-16.pdf
[TR-181 Issue 2 Amendment 17]: https://www.broadband-forum.org/download/TR-181_Issue-2_Amendment-17.pdf
[TR-181 Issue 2 Amendment 18]: https://www.broadband-forum.org/download/TR-181_Issue-2_Amendment-18.pdf
[TR-181-v2.12.0]: https://github.com/BroadbandForum/device-data-model/releases/tag/v2.12.0
[TR-181-v2.13.0]: https://github.com/BroadbandForum/device-data-model/releases/tag/v2.13.0
[TR-181-v2.14.0]: https://github.com/BroadbandForum/device-data-model/releases/tag/v2.14.0
[TR-181-v2.14.1]: https://github.com/BroadbandForum/device-data-model/releases/tag/v2.14.1
[TR-181-v2.15.0]: https://github.com/BroadbandForum/device-data-model/releases/tag/v2.15.0
[TR-181-v2.15.1]: https://github.com/BroadbandForum/device-data-model/releases/tag/v2.15.1
[TR-181-v2.16.0]: https://github.com/BroadbandForum/device-data-model/releases/tag/v2.16.0
[TR-181-v2.17.0]: https://github.com/BroadbandForum/device-data-model/releases/tag/v2.17.0
[TR-181-v2.18.0]: https://github.com/BroadbandForum/device-data-model/releases/tag/v2.18.0
[TR-181-v2.18.1]: https://github.com/BroadbandForum/device-data-model/releases/tag/v2.18.1
[v1.6.0]: https://github.com/BroadbandForum/cwmp-data-models/releases/tag/v1.6.0
[v1.6.0+]: https://github.com/BroadbandForum/cwmp-data-models/releases/tag/v1.6.0+
[v1.6.0c1]: https://github.com/BroadbandForum/cwmp-data-models/releases/tag/v1.6.0c1
[v1.6.1]: https://github.com/BroadbandForum/cwmp-data-models/releases/tag/v1.6.1
[v1.6.10]: https://github.com/BroadbandForum/cwmp-data-models/releases/tag/v1.6.10
[v1.6.2]: https://github.com/BroadbandForum/cwmp-data-models/releases/tag/v1.6.2
[v1.6.3]: https://github.com/BroadbandForum/cwmp-data-models/releases/tag/v1.6.3
[v1.6.4]: https://github.com/BroadbandForum/cwmp-data-models/releases/tag/v1.6.4
[v1.6.5]: https://github.com/BroadbandForum/cwmp-data-models/releases/tag/v1.6.5
[v1.6.6]: https://github.com/BroadbandForum/cwmp-data-models/releases/tag/v1.6.6
[v1.6.7]: https://github.com/BroadbandForum/cwmp-data-models/releases/tag/v1.6.7
[v1.6.8]: https://github.com/BroadbandForum/cwmp-data-models/releases/tag/v1.6.8
[v1.6.9]: https://github.com/BroadbandForum/cwmp-data-models/releases/tag/v1.6.9
