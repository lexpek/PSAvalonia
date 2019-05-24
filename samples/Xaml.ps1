$window = ConvertTo-AvaloniaWindow -Xaml @'
<Window xmlns="https://github.com/avaloniaui"
        Width="800"
        Height="50"
        Title="SampleXaml">
    <Window.Styles>
        <StyleInclude Source="avares://Avalonia.Themes.Default/DefaultTheme.xaml"/>
        <StyleInclude Source="avares://Avalonia.Themes.Default/Accents/BaseLight.xaml"/>
    </Window.Styles>
    <StackPanel>
        <Grid ColumnDefinitions="100,200,100,*">
            <TextBlock Name="lbl"  Grid.Column="0" Margin="5">Enter text</TextBlock>
            <TextBox   Name="txt"  Grid.Column="1" Margin="5"></TextBox>
            <Button    Name="btn"  Grid.Column="2" Margin="5">Submit</Button>
            <TextBlock Name="rslt" Grid.Column="3" Margin="5"></TextBlock>
        </Grid>
    </StackPanel>
</Window>
'@

$txt  = Find-AvaloniaControl -Window $window -Name txt
$rslt = Find-AvaloniaControl -Window $window -Name rslt
$btn  = Find-AvaloniaControl -Window $window -Name btn

$btn.add_Click({
    $rslt.Text = $txt.Text + " => OK"
})

Show-AvaloniaWindow -Window $window
