# [obsoleted project] foggy
an experimental prototype for fog computing. focus on service-centric networking.
the platform currently focuses on unikernel technology.

Major components:

1. Cache - incorporate different caching logic e.g., LRU, LFU.
2. Broker - incorportate different synchoronisation mechanisms.
3. Service - abstration of services, transparent to differnt virtualisation technologies.

Development plan:

2015.08 - implement the communication channel.
2015.09 - implement the service abstraction.
2015.10 - glue the component together and make the system run.
2015.11 - finlise the coding, and writing up the techreport.
2015.12 - start deployment.

Introduction:

The purpose of this development is to demonstrate how the future service-centric networking should be implemented. The implementation language is OCaml, the reason is to balance the performance and ease of implementation. The underlying virtualisation technology is unikernel. Eventually, the framework should be independent of the underlying virtualisation technology. foggy should focus on network management layer.

One question is what metrics should be used to evaluate foggy system? In some sense, are we going to solve latency problem or connectivity problem???

Contact me at liang.wang[at]cl.cam.ac.uk.


Reference

Unikernel paper.
Fog computing paper.
