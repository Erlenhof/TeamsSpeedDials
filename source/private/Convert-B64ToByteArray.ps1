function Convert-B64ToByteArray {
    <#
    .SYNOPSIS
    Convert a URL-safe Base64 string to a byte array.

    .DESCRIPTION
    Decodes a Base64 (URL-safe) string into a byte array. Handles URL-safe characters and padding.

    .PARAMETER InputObject
    The Base64 (possibly URL-safe) encoded string to decode.

    .EXAMPLE
    "SGVsbG8=" | Convert-B64ToByteArray

    .NOTES
    Tested with PowerShell 5.1
    #>
    [CmdletBinding()]
    [OutputType([byte[]])]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string]$InputObject
    )

    process {
        $B64 = $InputObject.Replace("_", "/").Replace("-", "+").TrimEnd(0x00, "=")

        # Fill the header with padding for Base 64 decoding
        while ($B64.Length % 4) {
            $B64 += "="
        }

        [System.Convert]::FromBase64String($B64)
    }
}
