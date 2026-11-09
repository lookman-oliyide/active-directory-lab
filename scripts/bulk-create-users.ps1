# Create the remaining test users and add them to their groups
Import-Module ActiveDirectory

$password = Read-Host "Temporary password for new users" -AsSecureString
$base = "OU=Users,OU=DojoCorp,DC=dojocorp,DC=lab"

$users = @(
    @{First="Daniel"; Last="Reid";   Sam="daniel.reid";   OU="Sales"; Group="GG-Sales"},
    @{First="Dev";    Last="Patel";  Sam="dev.patel";  OU="IT";    Group="GG-IT"},
    @{First="Elena";  Last="Rossi";  Sam="elena.rossi";  OU="IT";    Group="GG-IT"},
    @{First="Sam";    Last="Walker"; Sam="sam.walker"; OU="IT";    Group="GG-IT"},
    @{First="Fatima"; Last="Khan";   Sam="fatima.khan";   OU="HR";    Group="GG-HR"},
    @{First="George"; Last="Hill";   Sam="george.hill";   OU="HR";    Group="GG-HR"},
    @{First="Hannah"; Last="Lee";    Sam="hannah.lee";    OU="HR";    Group="GG-HR"}
)

foreach ($u in $users) {
    if (Get-ADUser -Filter "SamAccountName -eq '$($u.Sam)'") {
        Write-Host "Skipping $($u.Sam), already exists"
        continue
    }
    New-ADUser `
        -Name "$($u.First) $($u.Last)" `
        -GivenName $u.First `
        -Surname $u.Last `
        -SamAccountName $u.Sam `
        -UserPrincipalName "$($u.Sam)@dojocorp.lab" `
        -Path "OU=$($u.OU),$base" `
        -AccountPassword $password `
        -Enabled $true `
        -ChangePasswordAtLogon $true
    Add-ADGroupMember -Identity $u.Group -Members $u.Sam
    Write-Host "Created $($u.Sam) in $($u.OU)"
}