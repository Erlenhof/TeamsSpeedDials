function Convert-B64ToText {
    <#
    .SYNOPSIS
    Convert a Base64 string to a UTF8 text string.

    .DESCRIPTION
    Decodes a Base64 (URL-safe) string into a UTF8 string using Convert-B64ToByteArray.

    .PARAMETER InputObject
    The Base64 encoded string to decode.

    .EXAMPLE
    "eyJmb28iOiJiYXIifQ==" | Convert-B64ToText

    .NOTES
    Tested with PowerShell 5.1
    #>
    [CmdletBinding()]
    [OutputType([string])]
    param(
        [Parameter(Mandatory = $true, ValueFromPipeline = $true)]
        [string]$InputObject
    )

    process {
        $bytes = $InputObject | Convert-B64ToByteArray

        [System.Text.Encoding]::UTF8.GetString($bytes)
    }
}
