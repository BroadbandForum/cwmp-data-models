# CWMP Data Models Change Log

*The latest [CPE WAN Management Protocol (CWMP)](https://www.broadband-forum.org/technical/download/TR-069.pdf) data models can be found at <https://cwmp-data-models.broadband-forum.org>.*

## 2022-04-06: [TR-181 Issue 2 Amendment 15 Corrigendum 1](https://cwmp-data-models.broadband-forum.org/#Device:2.15)

*Tag: [v1.6.5](https://github.com/BroadbandForum/cwmp-data-models/releases/tag/v1.6.5)*

TR-181

* Removed items that were erroneously added to the User:1 profile and instead
  added them to a new User:2 profile
* Fixed the BulkData Profile Parameter reference; it's a string, not a formal
  path reference
* Fixed the VendorConfigFile description's CWMP/USP-specific text

## 2022-01-27: [TR-106 Amendment 11](https://data-model-template.broadband-forum.org) and [TR-181 Issue 2 Amendment 15](https://cwmp-data-models.broadband-forum.org/#Device:2.15)

*Tag: [v1.6.4](https://github.com/BroadbandForum/cwmp-data-models/releases/tag/v1.6.4)*

TR-106

* Allowed the version attribute in component references
* Allowed minEntries and maxEntries in command and event argument objects
* Allowed status attribute in profile command/event arguments
* Added secured attribute

TR-181

* Split the XML into multiple smaller files (this is just housekeeping; it
  doesn't affect how the model is used)
* Added Device.USPAgent to the CWMP model to allow a CWMP ACS to configure a
  device for USP communications
* Added Device.Routing.Babel for the RFC 8966 Babel routing protocol
* Added Device.DOCSIS for modeling DOCSIS 3.0 and 3.1 interfaces
* Added Device.Users.Group, Device.Users.Role and Device.Users.SupportedShell
  tables for modeling system users
* Improved the Wi-Fi data model by adding Data Elements R2 parameters, moving
  MultiAP parameters into the Data Elements structure, and by deprecating
  AIFSN, ECWMin, ECWMax and TxOpMax
* Clarified that Device.Optical is intended for generic optical interfaces and
  is not intended to model anything specific to IEEE or ITU-T PON technologies
  (objects specific to such technologies may be added in future versions of
  the data model)
* Clarified the meaning and usage of the Device.Ethernet.Interface and
  Device.Ethernet.Link objects (also allowed the Ethernet Link MACAddress
  parameter to be written)
* Improved (and made more consistent) the marking of (and explanation of)
  deprecated items, and how such items should progress from being deprecated
  to obsoleted to deleted
* Added a Baseline:4 profile that doesn't include Device.LANConfigSecurity (it
  relates to the now-deprecated TR-064 LAN management protocol)
* Many minor improvements to object and parameter descriptions
* Replaced the non-standard dmr:version attribute with the version attribute
  (which supports three levels of version)
* Switched to DMR (data model report) schema v1.0, which supports multi-line
  paragraphs, and wrapped all lines to 80 characters maximum

## 2020-11-17: [TR-181 Issue 2 Amendment 14 Corrigendum 1](https://cwmp-data-models.broadband-forum.org/#Device:2.14)

*Tag: [v1.6.3](https://github.com/BroadbandForum/cwmp-data-models/releases/tag/v1.6.3)*

TR-181

* Removed duplicate remarks about CWMP BOOTSTRAP from descriptions
* Fixed typos

## 2020-11-05: [TR-106 Amendment 10](https://data-model-template.broadband-forum.org) and [TR-181 Issue 2 Amendment 14](https://usp-data-models.broadband-forum.org/#Device:2.14)

*Tag: [v1.6.2](https://github.com/BroadbandForum/cwmp-data-models/releases/tag/v1.6.2)*

TR-106

* Converted document to markdown
* Various editorial improvements

TR-181

* Added WWC (5G Wireline Wireless Convergence), PDU (Protocol Data Unit) and FWE (5G Wireline wireless Encapsulation) top-level objects
* Updated Cellular object to be applicable to 5G Residential Gateways
* Extended support for TR-471 IP-layer metrics, including new IP-layer capacity test
* Supported LAN device time-based access-control
* Various Wi-Fi improvements

## 2020-04-06: [TR-069 Amendment 6 Corrigendum 1](https://www.broadband-forum.org/technical/download/TR-069.pdf)

*Tag: [v1.6.1](https://github.com/BroadbandForum/cwmp-data-models/releases/tag/v1.6.1)*

* Regenerated HTML using new [report.pl#425](https://github.com/BroadbandForum/cwmp-xml-tools/releases/tag/report.pl%23425) version of the BBF report tool

## 2020-01-17: [TR-104 Issue 2 Corrigendum 2](https://cwmp-data-models.broadband-forum.org/#VoiceService:2)

*Tag: [v1.6.0c1](https://github.com/BroadbandForum/cwmp-data-models/releases/tag/v1.6.0c1)*

TR-104

* Clarified meaning of SessionID and added new SIPSessionID

## 2019-09-05: [TR-181 Issue 2 Amendment 13](https://cwmp-data-models.broadband-forum.org/#Device:2.13)

*Tag: [v1.6.0+](https://github.com/BroadbandForum/cwmp-data-models/releases/tag/v1.6.0+)*

TR-181

* Added support for WFA Data Elements
* Added support for Multi AP
* Added support for WPA3 and 802.11ax
* Added support for MQTT 5.0
* Added support for Package capture diagnostics

## 2018-04-17: [TR-181 Issue 2 Amendment 12](https://cwmp-data-models.broadband-forum.org/#Device:2.12)

*Tag: [v1.6.0](https://github.com/BroadbandForum/cwmp-data-models/releases/tag/v1.6.0)*

TR-181

* Added TR-069a6 support
* Added Firmware Image support
* Added Ethernet Link Aggregation Group
* Added additional Wi-Fi and WAN statistics
* Added support for Two-Way Active Measurement Protocol (TWAMP) reflector
* Added support for Layer Two Tunneling Protocol version 3 (L2TPv3)
* Added support for Virtual eXtensible Local Area Network (VXLAN) tunnels
* Added support for Broadband Access Service Attributes and Performance Metrics measurement test framework (BASAPM)
* Added support for Large-Scale Measurement of Broadband Performance (LMAP)

## Previous releases are available at <https://cwmp-data-models.broadband-forum.org>
