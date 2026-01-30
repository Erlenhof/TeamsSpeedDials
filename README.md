# TeamsSpeedDials
Powershell module used to add speed dials to a microsoft teams user account.

## Getting Started

Prerequisites:

- PowerShell 5.1 or later
- A Microsoft account and credentials for the user whose Teams account you want to manage
- Internet access to reach Microsoft authentication endpoints and Teams APIs

To load the module locally, run (from the repository root):

```powershell
Import-Module .\TeamsSpeedDials.psd1
```

Or import the module file directly:

```powershell
Import-Module .\TeamsSpeedDials.psm1
```

## Usage

Common workflow:

1. Get credentials and request a bearer token:

```powershell
$cred = Get-Credential -Message "Enter your Microsoft Teams credentials"
$token = Get-BearerToken -Credentials $cred
```

2. List existing speed dials (favorites):

```powershell
Get-SpeedDial -Token $token
```

3. Add a speed dial (example):

```powershell
Add-SpeedDial -Token $token -MRI '<contact-mri>' -DisplayName 'Alice'
```

Notes:

- The module performs per-user operations and therefore requires a valid user bearer token.
- Tested with PowerShell 5.1.
