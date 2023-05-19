#!bin/bash
#bash gw2_arcdps_updater.sh

BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
folder=$(pwd)'/'
urlArcDps='https://www.deltaconnected.com/arcdps/x64/d3d11.dll'
pathArcDps=$folder'd3d11.dll'
urlKillProof='https://github.com/knoxfighter/arcdps-killproof.me-plugin/releases/latest/download/d3d9_arcdps_killproof_me.dll'
pathKillProof=$folder'bin64/d3d9_arcdps_killproof_me.dll'
urlMechanic='https://github.com/knoxfighter/GW2-ArcDPS-Mechanics-Log/releases/latest/download/d3d9_arcdps_mechanics.dll'
pathMechanic=$folder'bin64/d3d9_arcdps_mechanics.dll'
urlBoonTable='https://github.com/knoxfighter/GW2-ArcDPS-Boon-Table/releases/latest/download/d3d9_arcdps_table.dll'
pathBoonTable=$folder'bin64/d3d9_arcdps_table.dll'
urlHealing='https://github.com/Krappa322/arcdps_healing_stats/releases/latest/download/arcdps_healing_stats.dll'
pathHealing=$folder'bin64/arcdps_healing_stats.dll'
urlClears='https://github.com/gw2scratch/arcdps-clears/releases/latest/download/arcdps_clears.dll'
pathClears=$folder'bin64/arcdps_clears.dll'
urlExtras='https://github.com/Krappa322/arcdps_unofficial_extras_releases/releases/latest/download/arcdps_unofficial_extras.dll'
pathExtras=$folder'bin64/arcdps_unofficial_extras.dll'

read -p '(u)pdate or (d)eactivate? ' mode
if [ $mode == 'D' ] || [ $mode == 'd' ] ;
then
  printf $BLUE'started deactivation\n'$BLACK
  rm "$pathArcDps"
  printf $GREEN'finished deactivation\n'$BLACK
else
  printf $BLUE'started update\n'$BLACK
  if which curl >/dev/null ;
  then
    #define addons to be installed
    addons=(
    $urlArcDps';'$pathArcDps
    $urlKillProof';'$pathKillProof
    $urlMechanic';'$pathMechanic
    $urlBoonTable';'$pathBoonTable
    $urlHealing';'$pathHealing
    $urlClears';'$pathClears
    $urlExtras';'$pathExtras
    )
    #create bin64 folder if missing
    mkdir -p bin64
    #loop through all selected addons and download/install them
    for addon in ${addons[@]};
    do
      IFS=';' read -r -a a <<< $addon
      printf ${a[0]}'\n'${a[1]}'\n\n'
      curl -o ${a[1]} ${a[0]}
    done
    printf $GREEN'finished update\n'$BLACK
  else
    printf $RED'failed update: missing curl: apt update -y;apt upgrade -y;apt install curl -y\n'$BLACK
  fi
fi
