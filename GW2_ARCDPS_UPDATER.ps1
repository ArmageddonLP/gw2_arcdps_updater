$folder = [string](Get-Location)+"\"
$urlArcDps = "https://www.deltaconnected.com/arcdps/x64/d3d11.dll"
$pathArcDps = $folder + "d3d11.dll"
$urlKillProof = "https://github.com/knoxfighter/arcdps-killproof.me-plugin/releases/latest/download/d3d9_arcdps_killproof_me.dll"
$pathKillProof = $folder + "bin64\d3d9_arcdps_killproof_me.dll"
$urlMechanic = "https://github.com/knoxfighter/GW2-ArcDPS-Mechanics-Log/releases/latest/download/d3d9_arcdps_mechanics.dll"
$pathMechanic = $folder + "bin64\d3d9_arcdps_mechanics.dll"
$urlBoonTable = "https://github.com/knoxfighter/GW2-ArcDPS-Boon-Table/releases/latest/download/d3d9_arcdps_table.dll"
$pathBoonTable = $folder + "bin64\d3d9_arcdps_table.dll"
$urlHealing = "https://github.com/Krappa322/arcdps_healing_stats/releases/latest/download/arcdps_healing_stats.dll"
$pathHealing = $folder + "bin64\arcdps_healing_stats.dll"
$urlClears = "https://github.com/gw2scratch/arcdps-clears/releases/latest/download/arcdps_clears.dll"
$pathClears = $folder + "bin64\arcdps_clears.dll"
$urlExtras = "https://github.com/Krappa322/arcdps_unofficial_extras_releases/releases/latest/download/arcdps_unofficial_extras.dll"
$pathExtras = $folder + "bin64\arcdps_unofficial_extras.dll"

$mode = Read-Host -Prompt "(u)pdate or (d)eactivate? "
if ($mode -eq "D" -or $mode -eq "d") {
    Write-Host -ForegroundColor blue "started deactivation`n"
    Remove-Item -Path $pathArcDps
    Write-Host -ForegroundColor green "started deactivation`n"
}
else {
    Write-Host -ForegroundColor blue "started update`n"
    #define addons to be installed
    $dlls = @($urlArcDps, $pathArcDps),
        @($urlKillProof, $pathKillProof),
        @($urlMechanic, $pathMechanic),
        @($urlBoonTable, $pathBoonTable),
        @($urlHealing, $pathHealing),
        @($urlClears, $pathClears),
        @($urlExtras, $pathExtras)
    #loop through all selected addons and download/install them
    foreach ($dll in $dlls) {
        $infoText = $dll[0] + "`n" + $dll[1] + "`n`n"
        Write-Host $infoText
        Invoke-WebRequest -URI $dll[0] -OutFile $dll[1]
    }
    Write-Host -ForegroundColor green "finished update`n"
}