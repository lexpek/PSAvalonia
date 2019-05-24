$app = [Avalonia.Application]::new()

$builder = [Avalonia.AppBuilder]::Configure($app)
$builder = [Avalonia.AppBuilderDesktopExtensions]::UsePlatformDetect($builder)
try {
    $builder = $builder.SetupWithoutStarting()
}
catch {
    if ( $_.Exception.InnerException -isnot [System.InvalidOperationException] ) {
        throw $_
    }
}

$styles = [Avalonia.Styling.Styles]::new()

$theme = [Avalonia.Markup.Xaml.Styling.StyleInclude]::new($null)
$theme.Source = [uri]"avares://Avalonia.Themes.Default/DefaultTheme.xaml"
$styles.Add($theme)

$accent = [Avalonia.Markup.Xaml.Styling.StyleInclude]::new($null)
$accent.Source = [uri]"avares://Avalonia.Themes.Default/Accents/BaseLight.xaml"
$styles.Add($accent)

$window = [Avalonia.Controls.Window]@{
    Styles        = $styles
    ShowInTaskbar = $false
    CanResize     = $false
    Topmost       = $true
    
    Position      = [Avalonia.PixelPoint]::new(10, 10)
    Width         = 800
    Height        = 450
    Opacity       = 0.8
    
    Title         = "My Window"
    Content       = "Welcome to Avalonia!"
}
$app.Run($window)