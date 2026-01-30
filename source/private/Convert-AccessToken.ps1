function Convert-AccessToken {
    <#
    .SYNOPSIS
    Extract details from the given access token.

    .DESCRIPTION
    Extracts claims and other details from a JWT access token and returns them as a PowerShell object.

    .PARAMETER AccessToken
    The JWT access token string to parse.
    #>
    [cmdletbinding()]
    [OutputType([System.Management.Automation.PSCustomObject])]
    Param(
        [Parameter(Mandatory = $True, ValueFromPipeline = $true)]
        [String]$AccessToken
    )

    process {
        if ([string]::IsNullOrEmpty($AccessToken)) {
            Write-Warning "Unable to read access token (null or empty)"
            return $null
        }
        # Token sections
        $sections = $AccessToken.Split(".")

        # Check if this is JWE
        if ($sections.Count -eq 5) {
            Write-Warning "JWE token, expected JWS. Unable to parse."
            return $null
        }
        $payload = $sections[1]

        # Convert the token to string and json
        $payloadString = $payload | Convert-B64ToText
        $payloadObj = $payloadString | ConvertFrom-Json

        # Return
        $payloadObj
    }
}
