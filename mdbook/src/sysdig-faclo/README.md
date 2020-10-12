# Sysdig Falco

Sysdig Falco is an open source container runtime security. It is a behavioral monitoring software designed to detect anomalous activity. Sysdig Falco works as a intrusion detection system on any Linux host, although it is particularly useful when using Docker since it supports container-specific context like `container.id`, `container.image` or `namespaces` for its rules.

## Sysdig Falco Logging for Containers

* Run the following command in student VM

```bash
sudo falco
```
![start sysdig falco](images/sysdig-falco-start.png)

* Then start another container and perform operations like executing shell, reading shadow file, etc.

```bash
docker exec -it registry sh
cat /etc/passwd
cat /etc/shadow
```
![Running the container and commands](images/container-and-commands.png)

## Falco attack detection based on ruleset

![faclo detection](images/falco-detection.png)

## Play with Sysdig Falco Scenario

![Sysdig Faclo Scenario](images/sysdig-falco-scenario.png)

[Sysdig Falco: Container security monitoring](https://www.katacoda.com/mateobur/scenarios/falco)


## IPV4 Firewall Evasion

"TIL that if you want to evade IPv4 firewall rules or logs you can pad an address with ::ffff: and it’ll be handled by IPv6 sockets; even if your PC only uses IPv4, the victim and intermediaries will treat it as a IPv6 at many critical junctures. plz don’t use this for evil, ok?" - @da5ch0