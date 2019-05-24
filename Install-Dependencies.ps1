$pckgParams = @{
    Destination      = Join-Path $PSScriptRoot 'lib'
    ProviderName     = 'NuGet'
    Source           = 'https://www.nuget.org/api/v2'
    SkipDependencies = $true
    ExcludeVersion   = $true
    Force            = $true
}

$pckgList = [ordered]@{
    'Avalonia'                      = '0.8.0'
    'Avalonia.Native'               = '0.8.0'
    'Avalonia.Desktop'              = '0.8.0'
    'Avalonia.X11'                  = '0.8.0'
    'Avalonia.Win32'                = '0.8.0'
    'Avalonia.Skia'                 = '0.8.0'
    'SkiaSharp'                     = '1.68.0'
    'Avalonia.Skia.Linux.Natives'   = '1.68.0.2'
    'Avalonia.Direct2D1'            = '0.8.0'
    'Avalonia.ReactiveUI'           = '0.8.0'
    'System.Reactive'               = '4.0.0'
    'ReactiveUI'                    = '9.9.5'
    'Serilog'                       = '2.8.0'
    'Serilog.Sinks.Debug'           = '1.0.0'
    'Serilog.Sinks.Trace'           = '2.1.0'
}

if ( -not ( Test-Path $pckgParams.Destination ) ) {
    New-Item -ItemType Directory -Path $pckgParams.Destination > $null
}

foreach ( $pckg in $pckgList.GetEnumerator() ) {
    Install-Package @pckgParams -Name $pckg.Key -RequiredVersion $pckg.Value
}

$skiaSharpDestination = Join-Path $pckgParams.Destination "SkiaSharp/lib/netstandard1.3"
Copy-Item ( Join-Path $pckgParams.Destination "SkiaSharp/runtimes/osx/native/libSkiaSharp.dylib")                      -Destination $skiaSharpDestination
Copy-Item ( Join-Path $pckgParams.Destination "SkiaSharp/runtimes/win-x64/native/libSkiaSharp.dll")                    -Destination $skiaSharpDestination
Copy-Item ( Join-Path $pckgParams.Destination "Avalonia.Skia.Linux.Natives/runtimes/linux-x64/native/libSkiaSharp.so") -Destination $skiaSharpDestination
