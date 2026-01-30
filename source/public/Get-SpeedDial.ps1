function Get-SpeedDial {
    <#
    .SYNOPSIS
    Get a list of speed dials for the given user.

    .DESCRIPTION
    Returns a list of speed dials (favorite contacts) for the user associated with the provided bearer token.

    .PARAMETER Token
    The user's bearer token string.

    .EXAMPLE
    Get-SpeedDial -Token $token

    .EXAMPLE
    Get-SpeedDial $token

    .NOTES
    Tested with PowerShell Version 5.1
    #>
    [CmdletBinding()]
    [OutputType([pscustomobject])]
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$Token
    )

    process {
        $URL = "https://teams.microsoft.com/api/mt/emea/beta/contactsv3/"
        # Parameters
        $params = @{
            UseBasicParsing = $true
            Uri             = $URL
            Method          = "GET"
            Headers         = @{ "authorization" = "Bearer $Token" }
            ContentType     = "application/json;charset=UTF-8"
        }
        try {
            $response = Invoke-RestMethod @params
        }
        catch {
            throw $_
        }
        # Find the favorites in the response.
        $speedDials = $response.value | Where-Object { $_.systemTags.displayName -eq "Favorites" } | ForEach-Object {
            [pscustomobject]@{
                mri         = $_.mri
                displayName = $_.name.displayName
                systemTags  = $_.systemTags.displayName
            }
        }
        # Return the Speed Dials as Object.
        $speedDials
    }
}
