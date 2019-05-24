@{

# Script module or binary module file associated with this manifest.
RootModule = 'PSAvalonia.psm1'

# Version number of this module.
ModuleVersion = '0.0.1'

# Supported PSEditions
# CompatiblePSEditions = @()

# ID used to uniquely identify this module
GUID = '26ed486e-9e2e-42bc-b223-81eac69760eb'

# Author of this module
Author = 'fmichaleczek@gmail.com'

# Company or vendor of this module
CompanyName = 'Lexpec'

# Copyright statement for this module
Copyright = '(c) Lexpec. All rights reserved.'

# Description of the functionality provided by this module
# Description = ''

# Minimum version of the PowerShell engine required by this module
PowerShellVersion = '6.2.0'

# Name of the PowerShell host required by this module
# PowerShellHostName = ''

# Minimum version of the PowerShell host required by this module
# PowerShellHostVersion = ''

# Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# DotNetFrameworkVersion = ''

# Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
# CLRVersion = ''

# Processor architecture (None, X86, Amd64) required by this module
# ProcessorArchitecture = ''

# Modules that must be imported into the global environment prior to importing this module
# RequiredModules = @()

# Assemblies that must be loaded prior to importing this module
RequiredAssemblies = @(
    "./lib/Avalonia/lib/netcoreapp2.0/Avalonia.Animation.dll"
    "./lib/Avalonia/lib/netcoreapp2.0/Avalonia.Base.dll"
    "./lib/Avalonia/lib/netcoreapp2.0/Avalonia.Controls.dll"
    "./lib/Avalonia/lib/netcoreapp2.0/Avalonia.DesignerSupport.dll"
    "./lib/Avalonia/lib/netcoreapp2.0/Avalonia.Diagnostics.dll"
    "./lib/Avalonia/lib/netcoreapp2.0/Avalonia.dll"
    "./lib/Avalonia/lib/netcoreapp2.0/Avalonia.Input.dll"
    "./lib/Avalonia/lib/netcoreapp2.0/Avalonia.Interactivity.dll"
    "./lib/Avalonia/lib/netcoreapp2.0/Avalonia.Layout.dll"
    "./lib/Avalonia/lib/netcoreapp2.0/Avalonia.Logging.Serilog.dll"
    "./lib/Avalonia/lib/netcoreapp2.0/Avalonia.Markup.dll"
    "./lib/Avalonia/lib/netcoreapp2.0/Avalonia.Markup.Xaml.dll"
    "./lib/Avalonia/lib/netcoreapp2.0/Avalonia.OpenGL.dll"
    "./lib/Avalonia/lib/netcoreapp2.0/Avalonia.Styling.dll"
    "./lib/Avalonia/lib/netcoreapp2.0/Avalonia.Themes.Default.dll"
    "./lib/Avalonia/lib/netcoreapp2.0/Avalonia.Visuals.dll"
    "./lib/Avalonia/lib/netcoreapp2.0/Avalonia.DesktopRuntime.dll"
    "./lib/Avalonia.Desktop/lib/netstandard2.0/Avalonia.Desktop.dll"
    "./lib/Avalonia.Skia/lib/netstandard2.0/Avalonia.Skia.dll"
    "./lib/Avalonia.Win32/lib/netstandard2.0/Avalonia.Win32.dll"
    "./lib/Avalonia.ReactiveUI/lib/netstandard2.0/Avalonia.ReactiveUI.dll"
    "./lib/Serilog/lib/netstandard2.0/Serilog.dll"
    "./lib/Serilog.Sinks.Debug/lib/netstandard1.0/Serilog.Sinks.Debug.dll"
    "./lib/Serilog.Sinks.Trace/lib/netstandard1.3/Serilog.Sinks.Trace.dll"
    "./lib/System.Reactive/lib/netstandard2.0/System.Reactive.dll"
    "./lib/SkiaSharp/lib/netstandard1.3/SkiaSharp.dll"
)

# Script files (.ps1) that are run in the caller's environment prior to importing this module.
# ScriptsToProcess = @()

# Type files (.ps1xml) to be loaded when importing this module
# TypesToProcess = @()

# Format files (.ps1xml) to be loaded when importing this module
# FormatsToProcess = @()

# Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
# NestedModules = @()

# Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
FunctionsToExport = @()

# Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
CmdletsToExport = @()

# Variables to export from this module
VariablesToExport = '*'

# Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
AliasesToExport = @()

# DSC resources to export from this module
# DscResourcesToExport = @()

# List of all modules packaged with this module
# ModuleList = @()

# List of all files packaged with this module
# FileList = @()

# Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
PrivateData = @{

    PSData = @{

        # Tags applied to this module. These help with module discovery in online galleries.
        # Tags = @()

        # A URL to the license for this module.
        # LicenseUri = ''

        # A URL to the main website for this project.
        # ProjectUri = ''

        # A URL to an icon representing this module.
        # IconUri = ''

        # ReleaseNotes of this module
        # ReleaseNotes = ''

    } # End of PSData hashtable

} # End of PrivateData hashtable

# HelpInfo URI of this module
# HelpInfoURI = ''

# Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
# DefaultCommandPrefix = ''

}

