# Importing virtual machines

The students need to import two virtual machines for docker labs

1. `docker-student.ova`
2. `docker-ctf.ova`

> **NOTE**: In case of `VBOX_E_FILE_ERROR (0x80BB0004)` error during VM import, ensure you are importing a VM with file extension `.ova`.


## Download VM

| VM Name | Source URL |
|---------|------------|
| docker-student.ova | http://www.mediafire.com/file/3x1tgszet5blaz9/docker-student.ova.zip/file |
| docker-ctf.ova | http://www.mediafire.com/file/39e1w5wt7tmxr43/docker-ctf.ova/file |

The `checksums` are available at `http://www.mediafire.com/file/6xp3c7voy60zn1e/checksum.txt/file`

## Student Machine (docker-student.ova)

### VirtualBox

* Open VirtualBox, and select `File` -> `Import Appliance` from the top menu

![Importing student ova](images/import-ova.png)

* Select `docker-student.ova` file from the `workshop-content` folder

![selecting student ova](images/select-student-ova.png)

* Check the "Reintialize the MAC address of all network cards" checkbox, and click on Next to import the ova file

![student ova settings](images/student-ova-settings.png)

* Now we can see that ova file is importing

![processing](images/processing.png)

### VMWare

* Follow the above instructions with slight modifications. This has only been tested on VMWare Fusion 11.5.

* Upon import, you receive a warning "this ovf doesn't meet standards." Click "retry".

* With VMWare you can't force recreate a random MAC addr, so first boot machine.
Then turn off and [remove the following lines](https://kabri.uk/2008/07/16/force-vmware-to-generate-a-new-mac-address/) for each machine vmx file. On a Mac, this is located at`~/Virtual\ Machines.localized/docker-student.vmwarevm/docker-student.vmx`

```bash

ethernet0.addressType
uuid.location =
uuid.bios =
ethernet0.generatedAddress =
ethernet0.generatedAddressOffset =
```

* Modify /etc/rc.local dhclient line. Virtualbox uses `enp0s8` as a default NIC. You probably want `ens33`
for VMWare Fusion. Check for network devices which are down (you want these ones) using
`ip link show`. Then run something like the following
`
sudo sed -i 's|enp0s8|ens33|' /etc/update-motd.d/98-reboot-required
sudo dhclient ens33
`

* Check connectivity from the VMWare machine with `ping 8.8.8.8`.

* Reboot the machine

* Repeat for `~/Virtual\ Machines.localized/docker-ctf.vmwarevm/docker-ctf.vmx`

### Logging In

* You may want to start by adding the following to your /etc/hosts (adjusting ips)

```
ctf 192.168.64.128
student 192.168.64.129
```

* Use following credentials for `student` VM login

```bash
username: student
password: Docker@321
```

![student vm login](images/student-vm-login.png)

* Your IP address may differ from what is visible in the screenshot. Please note down this IP address for later use

## CTF Machine (docker-ctf.ova)


* Open VirtualBox, and select `File` -> `Import Appliance` from the top menu

![Importing ctf ova](images/import-ova.png)

* Select `docker-ctf.ova` file from the `workshop-content` folder

![selecting ctf ova](images/select-ctf-ova.png)

* Check the "Reintialize the MAC address of all network cards" checkbox, and click on Next to import the ova file

![ctf ova settings](images/ctf-ova-settings.png)

* Use following credentials for `ctf` VM login

```bash
username: ctf
password: Dockerctf@321
```

![ctf vm login](images/ctf-vm-login.png)

* Your IP address may differ from what is visible in the screenshot. Please note down this IP address for later use

## Test Setup

### Ensure Networking within VM

> Ensure you are able to `ping` one VM from the other.

![VM Networking](images/vm-networking.png)

### Ensure SSH Access from Host

> Ensure you are able to SSH into both `Student` and `CTF` VM from your host using an SSH client.

![VM Host SSH](images/vm-host-ssh.png)
