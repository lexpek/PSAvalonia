using namespace System.Collections.Generic

class PSAvaloniaApp {

    hidden static [Avalonia.Application] $Instance
    hidden static [bool] $AlreadySetup
    
    static [Avalonia.Application] GetInstance() {
        if ( $null -eq [PSAvaloniaApp]::Instance ) {
            [PSAvaloniaApp]::SetInstance()
        }
        return [PSAvaloniaApp]::Instance
    }

    hidden static SetInstance() {
        [PSAvaloniaApp]::Instance = [Avalonia.Application]::new()
        $builder = [Avalonia.AppBuilder]::Configure([PSAvaloniaApp]::Instance)
        $builder = [Avalonia.AppBuilderDesktopExtensions]::UsePlatformDetect($builder)
        if ( [PSAvaloniaApp]::AlreadySetup -eq $false ) {
            $builder = $builder.SetupWithoutStarting()
        }
        [PSAvaloniaApp]::AlreadySetup = $true
    }
    
    static [Avalonia.Controls.Window] LoadWindow([string] $xaml) {
        [PSAvaloniaApp]::SetInstance()
        return [Avalonia.Markup.Xaml.AvaloniaXamlLoader]::new().Load($xaml)
    }

    static Run([Avalonia.Controls.Window] $window) {
        if ( $null -eq [PSAvaloniaApp]::Instance ) {
            [PSAvaloniaApp]::SetInstance()
        }
        [PSAvaloniaApp]::Instance.Run($window)
    }
}


function ConvertTo-AvaloniaWindow {
    [OutputType([Avalonia.Controls.Window])]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]
        $Xaml
    )
    [PSAvaloniaApp]::LoadWindow($Xaml)
}


function Find-AvaloniaControl {
    [OutputType([Avalonia.Controls.IControl])]
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [Avalonia.Controls.Window]
        $Window,
        
        [Parameter(Mandatory)]
        [string]
        $Name
    )
    $Window.Find($Name)
}


function Show-AvaloniaWindow {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [Avalonia.Controls.Window]
        $Window
    )
    [PSAvaloniaApp]::Run($window)
}

function Out-AvaloniaGridView {
    [CmdletBinding(DefaultParameterSetName='PassThru')]
    param(
        [Parameter(ValueFromPipeline=$true)]
        [psobject]
        $InputObject,

        [ValidateNotNullOrEmpty()]
        [string]
        $Title = "Out-AvaloniaGridView Window",

        [Parameter(ParameterSetName='Wait')]
        [switch]
        $Wait,

        [Parameter(ParameterSetName='OutputMode')]
        [ValidateSet('None', 'Single', 'Multiple')]
        [string]
        $OutputMode,

        [Parameter(ParameterSetName='PassThru')]
        [switch]
        $PassThru
    )

    begin {
        $allInputObject = [List[PSObject]]::new()
    }

    process {
        $allInputObject.Add($_)
    }

    end {
        $allInputObject
    }
}

function New-AvaloniaStyle {
    [CmdletBinding()]
    param(
        [string]
        $Theme = "avares://Avalonia.Themes.Default/DefaultTheme.xaml"
    )
    # If StyleInclude had a default (parameterless) constructor, I could write:
    # [Avalonia.Markup.Xaml.Styling.StyleInclude]@{ Source = $theme }
    $iStyle = [Avalonia.Markup.Xaml.Styling.StyleInclude]::new($null)
    $iStyle.Source = $theme
    $iStyle
}

Add-Type -Namespace PSAvalonia -Name "NativeLibraries" -MemberDefinition @'
    [DllImport("kernel32")]public static extern IntPtr LoadLibrary(string path);
    [DllImport("libdl")]public static extern IntPtr dlopen(string path, int flags);
'@

if ($IsLinux -and [System.Runtime.InteropServices.RuntimeInformation]::OSArchitecture -eq [System.Runtime.InteropServices.Architecture]::Arm) {
    [PSAvalonia.NativeLibraries]::dlopen("$PSScriptRoot/lib/Avalonia.Skia.Linux.Natives/runtimes/linux-arm/native/libSkiaSharp.so", 0)
}
elseif ($IsLinux) {
    [PSAvalonia.NativeLibraries]::dlopen("$PSScriptRoot/lib/Avalonia.Skia.Linux.Natives/runtimes/linux-x64/native/libSkiaSharp.so", 0)
}
elseif ($IsMacOS) {
    [PSAvalonia.NativeLibraries]::dlopen("$PSScriptRoot/lib/SkiaSharp/runtimes/osx/native/libSkiaSharp.dylib", 0)
}
elseif ($IsWindows -and [System.Environment]::Is64BitProcess) {
    [PSAvalonia.NativeLibraries]::LoadLibrary("$PSScriptRoot\lib\SkiaSharp\runtimes\win-x64\native\libSkiaSharp.dll")
}
elseif ($IsWindows) {
    [PSAvalonia.NativeLibraries]::LoadLibrary("$PSScriptRoot\lib\SkiaSharp\runtimes\win-x86\native\libSkiaSharp.dll")
}

Export-ModuleMember -Function *