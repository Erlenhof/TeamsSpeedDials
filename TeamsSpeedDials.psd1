@{

    # The script or binary module file associated with this manifest.
    RootModule           = 'TeamsSpeedDials.psm1'

    # The version number of this module
    ModuleVersion        = '0.0.1'

    # Compatible PSEditions
    # CompatiblePSEditions = @()

    # GUID that uniquely identifies this module
    GUID                 = 'b7d4ad6a-e5b8-4b34-b86a-161825a46e0c'

    # Author of this module
    Author               = 'Erlenhof'

    # Company or vendor of this module
    CompanyName          = 'Blumer Lehmann AG'

    # Copyright statement for this module
    Copyright            = '(c) 2026 Blumer Lehmann AG (Erlenhof). Distributed under MIT license.'

    # Description of the functionality provided by this module
    Description          = 'Powershell module used to add speed dials to a microsoft teams user account.'

    # Minimum version of Windows PowerShell required by this module
    PowerShellVersion    = '5.1'

    # Name of the Windows PowerShell host required by this module
    # PowerShellHostName = ''

    # Minimum version of the Windows PowerShell host required by this module
    # PowerShellHostVersion = ''

    # Minimum version of the Microsoft .NET Framework required by this module (Desktop edition only)
    # DotNetFrameworkVersion = ''

    # Minimum version of the CLR (Common Language Runtime) required by this module (Desktop edition only)
    # CLRVersion = ''

    # Processor architecture required by this module (None, X86, Amd64)
    # ProcessorArchitecture = ''

    # Modules that must be imported before importing this module
    # RequiredModules = @()

    # Assemblies that must be loaded before importing this module
    # RequiredAssemblies = @()

    # Script files (.ps1) that are run in the caller's environment prior to importing this module
    # ScriptsToProcess = @()

    # Type files (.ps1xml) to load when importing this module
    # TypesToProcess = @()

    # Format files (.ps1xml) to load when importing this module
    # FormatsToProcess = @()

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    # NestedModules = @()

    # Functions to export from this module. For best performance, avoid wildcards and do not remove this entry. Use an empty array if there are no functions to export.
    FunctionsToExport    = @(
        'Get-BearerToken', 'Add-SpeedDial', 'Get-SpeedDial'
    )

    # Cmdlets to export from this module. For best performance, avoid wildcards and do not remove this entry. Use an empty array if there are no cmdlets to export.
    CmdletsToExport      = @()

    # Variables to export from this module
    # VariablesToExport = @()

    # Aliases to export from this module. For best performance, avoid wildcards and do not remove this entry. Use an empty array if there are no aliases to export.
    AliasesToExport      = @()

    # DSC resources to export from this module
    # DscResourcesToExport = @()

    # List of all modules in this module package
    # ModuleList = @()

    # List of all files in this module package
    # FileList = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This can also be a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData          = @{

        PSData = @{

            # Tags applied to the module to assist discovery in online galleries.
            Tags       = @('MicrosoftTeams', 'Teams')

            # A URL for the license for this module.
            LicenseUri = 'https://raw.githubusercontent.com/Erlenhof/TeamsSpeedDials/refs/heads/main/README.md'

            # A URL for the main web site for this project.
            ProjectUri = 'https://github.com/Erlenhof/TeamsSpeedDials'

            # A URL to an icon representing this module.
            IconUri    = 'https://www.blumer-lehmann.com/bl-ico-touch-icon.png'

            # Release notes for the module
            # ReleaseNotes = ''

        } # End of PSData hashtable

    } # End of PrivateData hashtable

    # HelpInfo URI for this module
    # HelpInfoURI = ''

    # Default prefix for commands exported from this module. The default prefix can be overridden with "Import-Module -Prefix".
    DefaultCommandPrefix = 'BL'

}
