#!/bin/bash
# Program : archive-handhelds.sh
# Version : 3
# Use : 
# Get stuff of https://www.archive.org
# Script is not working OOB !
# Find out for your self how this script works, uncomment the desired lines and alter to your needs !
# Additional info : 
# This script is created for educational/testing purposes
# The archive site has a special DMCA exemption for the US
# For more info, you can read this : https://www.copyright.gov/legislation/dmca.pdf
# We dissaprove illegal usage
# How to run :
# Make the program executable, dubbleclick and choose open in terminal.
# Or run it from the terminal with : ./archive.sh
# Author : @folly
# Date   : 28/12/2020
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

startworkdir=$(pwd)

all_in1=( "ablmini" "ablpinb" "bittboy" "cybar120" "dgun2573" "dnv200fs" "fapocket" "fcpocket" "fordrace" "gprnrs1" "gprnrs16" "ii32in1" "ii8in1" "intact89" "intg5410" "itvg49" "lexiseal" "lexizeus" "lx_jg7415" "m505neo" "m521neo" "majkon" "mc_105te" "mc_110cb" "mc_138cb" "mc_7x6ss" "mc_89in1" "mc_8x6cb" "mc_8x6ss" "mc_9x6ss" "mc_aa2" "mc_cb280" "mc_dcat8" "mc_dg101" "mc_dgear" "mc_hh210" "mc_sam60" "mc_sp69" "mc_tv200" "megapad" "mgt20in1" "miwi2_7" "mysprtch" "mysprtcp" "mysptqvc" "njp60in1" "oplayer" "pdc100" "pdc150t" "pdc200" "pdc40t" "pdc50" "pjoyn50" "pjoys30" "pjoys60" "ppgc200g" "react" "reactmd" "rminitv" "sarc110" "sudopptv" "sy888b" "sy889" "techni4" "timetp36" "tmntpdc" "unk1682" "vgcaplet" "vgpmini" "vgpocket" "vjpp2" "vsplus" "zdog" "zone7in1" "zudugo" "namcons1" "namcons2" "taitons1" "taitons2" "tak_geig" "namcons1" "namcons2" "taitons1" "taitons2" "tak_geig" "tomcpin" )
classich=( "alnattck" "alnchase" "astrocmd" "bambball" "bankshot" "bbtime" "bcclimbr" "bdoramon" "bfriskyt" "bmboxing" "bmsafari" "bmsoccer" "bpengo" "bultrman" "bzaxxon" "cdkong" "cfrogger" "cgalaxn" "cmspacmn" "cmsport" "cnbaskb" "cnfball" "cnfball2" "cpacman" "cqback" "ebaskb2" "ebball" "ebball2" "ebball3" "edracula" "efball" "egalaxn2" "einvader" "einvader2" "epacman2" "esoccer" "estargte" "eturtles" "flash" "funjacks" "galaxy2" "gckong" "gdigdug" "ghalien" "ginv" "ginv1000" "ginv2000" "gjungler" "h2hbaseb" "h2hbaskb" "h2hfootb" "h2hhockey" "h2hsoccerc" "hccbaskb" "invspace" "kingman" "machiman" "mcompgin" "msthawk" "mwcbaseb" "packmon" "pairmtch" "pbqbert" "phpball" "raisedvl" "rockpin" "splasfgt" "splitsec" "ssfball" "tbaskb" "tbreakup" "tcaveman" "tccombat" "tmpacman" "tmscramb" "tmtennis" "tmtron" "trshutvoy" "trsrescue" "ufombs" "us2pfball" "vinvader" "zackman" )
konamih=( "kbilly" "kblades" "kbucky" "kcontra" "kdribble" "kgarfld" "kgradius" "kloneran" "knfl" "ktmnt" "ktopgun" )
tigerh=( "taddams" "taltbeast" "tapollo13" "tbatfor" "tbatman" "tbatmana" "tbtoads" "tbttf" "tddragon" "tddragon3" "tdennis" "tdummies" "tflash" "tgaiden" "tgaunt" "tgoldeye" "tgoldnaxe" "thalone" "thalone2" "thook" "tinday" "tjdredd" "tjpark" "tkarnov" "tkazaam" "tmchammer" "tmkombat" "tnmarebc" "topaliens" "trobhood" "trobocop2" "trobocop3" "trockteer" "tsddragon" "tsf2010" "tsfight2" "tshadow" "tsharr2" "tsjam" "tskelwarr" "tsonic" "tsonic2" "tspidman" "tstrider" "tswampt" "ttransf2" "tvindictr" "twworld" "txmen" "txmenpx" )

gameandwatch=( "bassmate" "gnw_ball" "gnw_bfight" "gnw_bjack" "gnw_boxing" "gnw_bsweep" "gnw_cgrab" "gnw_chef" "gnw_climber" "gnw_dkhockey" "gnw_dkjr" "gnw_dkjrp" "gnw_dkong" "gnw_dkong2" "gnw_dkong3" "gnw_fire" "gnw_fireatk" "gnw_fires" "gnw_flagman" "gnw_gcliff" "gnw_ghouse" "gnw_helmet" "gnw_judge" "gnw_lboat" "gnw_lion" "gnw_manhole" "gnw_manholeg" "gnw_mario" "gnw_mariocm" "gnw_mariocmt" "gnw_mariotj" "gnw_mbaway" "gnw_mickdon" "gnw_mmouse" "gnw_mmousep" "gnw_octopus" "gnw_opanic" "gnw_pchute" "gnw_pinball" "gnw_popeye" "gnw_popeyep" "gnw_rshower" "gnw_sbuster" "gnw_smb" "gnw_snoopyp" "gnw_squish" "gnw_ssparky" "gnw_stennis" "gnw_tbridge" "gnw_tfish" "gnw_vermin" "gnw_zelda" )
jakks=( "jak_batm" "jak_capc" "jak_care" "jak_dbz" "jak_disf" "jak_disn" "jak_dora" "jak_dorr" "jak_dpr" "jak_dprs" "jak_fan4" "jak_just" "jak_mk" "jak_mpac" "jak_mpacw" "jak_nick" "jak_pooh" "jak_sbfc" "jak_sdoo" "jak_sith" "jak_spdm" "jak_wall" "jak_wof" "jak_wwe" )
tigerrz=( "rzbatfor" "rzindy500" "rztoshden" )

#for game in ${!all_in1[@]} ; do wget -T3 -t0 -c -w1 -P $startworkdir/roms/all_in1 https://archive.org/download/MAME_0.224_ROMs_merged/${all_in1[$game]}.zip;done
#for game in ${!classich[@]} ; do wget -T3 -t0 -c -w1 -P $startworkdir/roms/classich https://archive.org/download/MAME_0.224_ROMs_merged/${classich[$game]}.zip;done
#for game in ${!konamih[@]} ; do wget -T3 -t0 -c -w1 -P $startworkdir/roms/konamih https://archive.org/download/MAME_0.224_ROMs_merged/${konamih[$game]}.zip;done
#for game in ${!tigerh[@]} ; do wget -T3 -t0 -c -w1 -P $startworkdir/roms/tigerh https://archive.org/download/MAME_0.224_ROMs_merged/${tigerh[$game]}.zip;done
#for game in ${!gameandwatch[@]} ; do wget -T3 -t0 -c -w1 -P $startworkdir/roms/gameandwatch https://archive.org/download/MAME_0.224_ROMs_merged/${gameandwatch[$game]}.zip;done
#for game in ${!jakks[@]} ; do wget -T3 -t0 -c -w1 -P $startworkdir/roms/jakks https://archive.org/download/MAME_0.224_ROMs_merged/${jakks[$game]}.zip;done
#for game in ${!tigerrz[@]} ; do wget -T3 -t0 -c -w1 -P $startworkdir/roms/tigerrz https://archive.org/download/MAME_0.224_ROMs_merged/${tigerrz[$game]}.zip;done
