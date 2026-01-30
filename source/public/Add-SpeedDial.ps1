function Add-SpeedDial {
    <#
    .SYNOPSIS
    Add a speed dial in Teams for the specified user.

    .DESCRIPTION
    Adds a speed dial (favorite contact) to a Teams user account. This action is performed per-user and therefore requires a valid user bearer token.

    .PARAMETER Token
    The user's bearer token used for authentication.

    .PARAMETER MRI
    The contact's MRI (Microsoft Resource Identifier) string.

    .PARAMETER DisplayName
    The display name for the speed dial contact.

    .EXAMPLE
    Add-SpeedDial -Token $Token -MRI $contact.mri -DisplayName $contact.displayName

    .EXAMPLE
    Add-SpeedDial $Token -MRI $contact.mri -DisplayName $contact.displayName

    .NOTES
    Tested with PowerShell Version 5.1
    #>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$Token,

        [Parameter(Mandatory = $true)]
        [string]$MRI,

        [Parameter(Mandatory = $true)]
        [string]$DisplayName,

        [Parameter(Mandatory = $false)]
        [switch]$PassThru
    )

    process {
        # URL.
        $URL = "https://teams.microsoft.com/api/mt/emea/beta/contactsv3/"
        # Create the payload for the API call.
        $payload = [System.Text.Encoding]::UTF8.GetString("{`"mri`":`"${MRI}`",`"names`":[{`"displayName`":`"${DisplayName}`",`"first`":`"${DisplayName}`"}],`"systemTags`":[{`"displayName`":`"Favorites`"}]}".ToCharArray())
        # Parameters
        $params = @{
            UseBasicParsing = $true
            Uri             = $URL
            Body            = $payload
            Method          = "POST"
            Headers         = @{ "authorization" = "Bearer $Token" }
            ContentType     = "application/json;charset=UTF-8"
        }
        # Set the new Speed Dial contact.
        try {
            $response = Invoke-RestMethod @params
        }
        catch {
            throw $_
        }

        if ($PassThru) {
            $response
        }
    }
}
