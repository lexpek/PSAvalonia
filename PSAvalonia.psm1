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


Export-ModuleMember -Function *