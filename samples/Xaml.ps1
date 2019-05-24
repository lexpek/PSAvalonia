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

$window = [Avalonia.Markup.Xaml.AvaloniaXamlLoader]::new().Load(@'
<Window xmlns="https://github.com/avaloniaui"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        mc:Ignorable="d" d:DesignWidth="800" d:DesignHeight="450"
        Title="AvaloniaApplication1">
    <Window.Styles>
        <StyleInclude Source="avares://Avalonia.Themes.Default/DefaultTheme.xaml"/>
        <StyleInclude Source="avares://Avalonia.Themes.Default/Accents/BaseLight.xaml"/>
    </Window.Styles>
    <DockPanel>
        <Button DockPanel.Dock="Bottom">Add an item</Button>
        <StackPanel>
          <CheckBox Margin="4">Walk the dog</CheckBox>
          <CheckBox Margin="4">Buy some milk</CheckBox>
        </StackPanel>
    </DockPanel>
</Window>
'@)
$app.Run($window)