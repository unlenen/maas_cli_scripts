# Maas Cli Scripts

## Introduction
- MAAS is an open-source tool that lets you create a data centre from bare-metal servers. You can discover, commission, deploy, and dynamically reconfigure a large network of individual units. MAAS converts your hardware investment into a cohesive, flexible, distributed data centre, with a minimum of time and effort.

 
## Cli Scripts

### Add Single Baremetal

- Usage
```
./addBaremetal.sh MAAS_PROFILE MAAS_URL MAAS_API_KEY VM_NAME VM_ARCH VM_PXE_INF_MAC IPMI_IP IPMI_USER IPMI_PASSWORD
```
- Example

```
cd vm
./addBaremetal.sh unlenen http://maas.unlenen.com:5240/MAAS MY_API_KEY VM1 amd64 "98:F2:B3:E8:2A:2A" baremetal1.unlenen.com root MY_PASSWORD 
```

### Import VMs From Proxmox

- Usage
```
./addFromProxmox.sh MAAS_PROFILE MAAS_URL MAAS_API_KEY PROXMOX_HOST PROXMOX_USER PROXMOX_PASSWORD
```
- Example

```
cd vm
./addFromProxmox.sh unlenen http://maas.unlenen.com:5240/MAAS MY_API_KEY proxmox.unlenen.com root@pam MY_PASSWORD
```


### Commision All Machines

- Usage
```
./commisionAll.sh MAAS_PROFILE MAAS_URL MAAS_API_KEY
```
- Example

```
cd commision
./commisionAll.sh unlenen http://maas.unlenen.com:5240/MAAS MY_API_KEY
```

### Set IP Address Of Single Machine

- Usage
```
./setIp.sh MAAS_PROFILE MAAS_URL MAAS_API_KEY MACHINE_NAME MACHINE_IP MACHINE_INTERFACE_NAME MAAS_FABRIC_NAME MAAS_IP_SUBNET
```
- Example

```
cd network
./setIp.sh unlenen http://maas.unlenen.com:5240/MAAS MY_API_KEY VM1 192.168.2.3 eno1 fabric-0 "192.168.2.0/24"
```


### Deploy All Machines

- Usage
```
./deployAll.sh MAAS_PROFILE MAAS_URL MAAS_API_KEY
```
- Example

```
cd deploy
./deployAll.sh unlenen http://maas.unlenen.com:5240/MAAS MY_API_KEY
```
