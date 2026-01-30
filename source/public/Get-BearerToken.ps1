function Get-BearerToken {
    <#
    .SYNOPSIS
    Request an access token for a user with the given credentials.

    .DESCRIPTION
    Requests an access token for Microsoft Teams for the specified user and returns the access token as a string.

    .PARAMETER Credentials
    A PSCredential object used to authenticate the user.

    .PARAMETER Tenant
    [Optional] The tenant (e.g., 'common' or tenant id) to which the user belongs.

    .PARAMETER Resource
    [Optional] The resource for which the token is requested.

    .PARAMETER ClientId
    [Optional] The client/application ID used when requesting the token.

    .EXAMPLE
    Get-BearerToken -Credentials $(Get-Credential -Message "Enter your Microsoft Teams Credentials")

    .NOTES
    Tested with PowerShell Version 5.1
    #>
    [CmdletBinding()]
    [OutputType([string])]
    param (
        [Parameter(Mandatory = $true)]
        [System.Management.Automation.PSCredential]
        $Credentials,

        [Parameter(Mandatory = $false, DontShow = $true)]
        [string]
        $Tenant = "common",

        [Parameter(Mandatory = $false, DontShow = $true)]
        [string]
        $Resource = "https://api.spaces.skype.com",

        [Parameter(Mandatory = $false, DontShow = $true)]
        [string]
        $ClientId = "1fec8e78-bce4-4aaf-ab1b-5451cc387264"
    )

    process {
        $body = @{
            "resource"   = "https://graph.windows.net"
            "client_id"  = $ClientId
            "grant_type" = "password"
            "username"   = $Credentials.UserName
            "password"   = $Credentials.GetNetworkCredential().Password
            "scope"      = "openid"
        }

        $headers = @{
            "Content-Type" = "application/x-www-form-urlencoded"
            "User-Agent"   = "Mozilla/5.0 (Windows NT 10.0; Win64; x64)"
        }

        $params = @{
            UseBasicParsing = $true
            Uri             = "https://login.microsoftonline.com/$Tenant/oauth2/token"
            Method          = "POST"
            Body            = $body
            Headers         = $headers
        }

        $response = $null
        try {
            $response = Invoke-RestMethod @params
        }
        catch {
            throw $_
        }

        if ([string]::IsNullOrEmpty($response.access_token)) {
            throw "Could not get Access Token!"
        }
        $refreshToken = $response.refresh_token
        $parsedToken = $response.access_token | Convert-AccessToken
        $tenant_id = $parsedToken.tid

        if (($parsedToken.appid -ne $ClientId) -or ($parsedToken.aud -ne $Resource)) {
            $body = @{
                "resource"      = $Resource
                "client_id"     = $ClientId
                "grant_type"    = "refresh_token"
                "refresh_token" = $RefreshToken
                "scope"         = "openid"
            }

            $params = @{
                UseBasicParsing = $true
                Uri             = "https://login.microsoftonline.com/$tenant_id/oauth2/token"
                ContentType     = "application/x-www-form-urlencoded"
                Method          = "POST"
                Body            = $body
            }

            try {
                $response = Invoke-RestMethod @params
            }
            catch {
                throw $_
            }
        }

        $response.access_token
    }
}
