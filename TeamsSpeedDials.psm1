$param = @{
    Path        = "$PSScriptRoot\source"
    Filter      = "*.ps1"
    Recurse     = $true
    ErrorAction = "SilentlyContinue"
}

# Dot source the files
foreach ($function in (Get-ChildItem @param )) {
    try {
        . $function.fullname
    }
    catch {
        Write-Error -Message "Failed to import function $($function.fullname): $_"
    }
}
