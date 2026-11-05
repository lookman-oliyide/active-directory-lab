# 01 - Planning

## Goals
- Build an isolated Windows Server 2022 domain
- Join a Windows 11 client to the domain
- Practise user onboarding, offboarding and password resets
- Enforce settings with Group Policy

## Network plan
| Item | Value |
|------|-------|
| Network | 192.168.10.0/24 (VirtualBox Internal Network "ADLAB") |
| DC01 | 192.168.10.10 (static), DNS 192.168.10.10 |
| WIN11-01 | 192.168.10.20 (static), DNS 192.168.10.10 |
| Domain | dojocorp.lab (NetBIOS: DOJOCORP) |

## Virtual machines
| VM | Meaning | OS | CPU | RAM | Disk |
|----|----|----|-----|-----|------|
| DC01 | Domain Controller 01 | Windows Server 2022 Standard (Desktop Experience) | 2 | 4 GB | 50 GB |
| WIN11-01 | Windows 11 client 01 | Windows 11 Enterprise (evaluation) | 2 | 4 GB | 60 GB |

## Why an internal network
The lab is isolated from my home network so test accounts and policies cannot affect real devices.
