# Build Log

Step-by-step log of the Active Directory home lab. Each stage links to a deeper write-up in `docs/` and to the evidence in `screenshots/`.

## Stage 1: DC01 build

* Created DC01 VM in VirtualBox (2 CPU, 4 GB, 50 GB)
* Installed Windows Server 2022 Standard (Desktop Experience)
* Renamed to DC01, set static IP 192.168.10.10
* Network and naming plan: see [docs/01-planning.md](docs/01-planning.md)
* [Screenshots](screenshots)
* Snapshot taken before AD promotion

## Stage 2: Domain setup

* Installed the Active Directory Domain Services role on DC01
* Promoted DC01 to a domain controller in a new forest, `dojocorp.lab` (DNS server and Global Catalog enabled)
* Set a DSRM password and stored it outside the repo
* DC01 restarted and I logged in as `DOJOCORP\Administrator`
* Verified with `Get-ADDomain`, `Get-ADForest`, `dcdiag`, Active Directory Users and Computers and DNS Manager
* I did not capture screenshots during the install and promotion, so the evidence shows the finished result
* Full steps and screenshots: see [docs/02-domain-setup.md](docs/02-domain-setup.md)
* Snapshot taken: "DC01 domain controller promoted"

## Stage 3: OUs, users and groups

* Built the OU structure: `DojoCorp` with `Users` (HR, IT, Sales), `Computers`, `Groups` and `Disabled Users`
* Created 10 test users: 3 by hand in Active Directory Users and Computers to learn the process, 7 with a PowerShell script
* Created 3 global security groups (`GG-Sales`, `GG-IT`, `GG-HR`) and added users to match their department
* All accounts use a temporary password and must change it at first logon
* Verified with `Get-ADUser` and `Get-ADGroupMember`
* Script: [scripts/bulk-create-users.ps1](scripts/bulk-create-users.ps1)
* Full steps and screenshots: see [docs/03-ou-groups.md](docs/03-ou-groups.md)
* Snapshot taken: "DC01 OUs users groups built"
