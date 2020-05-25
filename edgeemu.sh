#!/bin/bash
# Program : edgeemu.sh
# Version : 1

# Use : 
# Educational script on how we can get files from https://www.edgeemu.net
#
# How to run :
# Make the program executable, dubbleclick and choose open in terminal.
# Or run it from the terminal with : ./edgeemu.sh
#
# Author : Folkert van der Meulen
# Date   : 25/04/2020
#
# Additional info :
# Script is not working OOB !
# This script is created for educational purposes
# We dissaprove illegal usage

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

website=edgeemu.net
startworkdir=$(pwd)


#make your own or see these (--crypted) examples (think, and you know what to do !!!)
#(uncomment only one maplist)
#maplist='--cpc'; file_type=7z; RP_map_structure=roms/amstradcpc; #test ok; #(lr-caprice32 => extract files and rename .cpr to .dsk =>can be compressed again)
#maplist='--2600'; file_type=7z; RP_map_structure=roms/atari2600; #test ok
#maplist='--5200'; file_type=7z;RP_map_structure=roms/atari5200; #test ok
#maplist='--7800'; file_type=7z;RP_map_structure=roms/atari7800; #test ok
#maplist='--jaguar'; file_type=7z; RP_map_structure=roms/atarijaguar; #test ok
#maplist='--lynx'; file_type=7z; RP_map_structure=roms/atarilynx; #test ok
#maplist='--c64'; file_type=7z; RP_map_structure=roms/c64; #test ok
#maplist='--amiga'; file_type=7z; RP_map_structure=roms/amiga; #test ok (lr-puae => extract files and add capsimg.so in BIOS directory (https://github.com/rsn8887/capsimg/releases/tag/1.0))
#maplist='--wsx'; file_type=7z; RP_map_structure=roms/wonderswancolor; #test ok
#maplist='--mame'; file_type=zip; RP_map_structure=roms/mame-libretro/216_versions; #test not ok; #(issue: filenames are not correct); #(issue: files containing a ":" for now resolved with "sed")
#maplist='--msx'; file_type=7z; RP_map_structure=roms/msx; #test ok; #(there are files with the same name but different filenumber, only the first filenumber is used)
#maplist='--pce'; file_type=7z; RP_map_structure=roms/pcengine/pce; #test ok
#maplist='--pcecd'; file_type=chd; RP_map_structure=roms/pcengine/pcecd; #test ok
#maplist='--n64'; file_type=7z; RP_map_structure=roms/n64; #test ok; #(extract files)
#maplist='--nds'; file_type=7z; RP_map_structure=roms/nds
#maplist='--nes'; file_type=7z; RP_map_structure=roms/nes; #test ok
#maplist='--gba'; file_type=7z; RP_map_structure=roms/gba; #test ok
#maplist='--gbc'; file_type=7z; RP_map_structure=roms/gbc; #test ok; #(gb also)
#maplist='--gc'; file_type=7z; RP_map_structure=roms/gc; #(x86 only)
#maplist='--snes'; file_type=7z; RP_map_structure=roms/snes; #test ok
#maplist='--vb'; file_type=7z; RP_map_structure=roms/virtualboy; #test ok
#maplist='--3do'; file_type=7z; RP_map_structure=roms/3do; #test ok
#maplist='--cdi'; file_type=chd; RP_map_structure=roms/arcadia/Philips_CD-I/cdimono1; #(using my own map structure for now)
#maplist='--32x'; file_type=7z; RP_map_structure=roms/sega32x; #test ok
#maplist='--segacd'; file_type=chd; RP_map_structure=roms/segacd; #test ok; #(lr-genesis-plus-gx: ok; #lr-picodrive: extract files to cue/bin)
#maplist='--dc'; file_type=chd; RP_map_structure=roms/dreamcast
#maplist='--gg'; file_type=7z; RP_map_structure=roms/gamegear; #test ok
#maplist='--md'; file_type=7z; RP_map_structure=roms/megadrive; #test ok; #(genesis also)
#maplist='--sms'; file_type=7z; RP_map_structure=roms/mastersystem; #test ok
#maplist='--ngpc'; file_type=7z; RP_map_structure=roms/ngpc; #test ok
#maplist='--ngcd'; file_type=chd; RP_map_structure=roms/neogeo/ngcd; #test ok

echo "create directory\'s $startworkdir/$RP_map_structure/$website"
mkdir -p "$startworkdir/$RP_map_structure/$website"
cd "$startworkdir/$RP_map_structure/$website"

SOURCE=$(for i in {num,{A..Z}}; do curl https://$website/browse-$maplist-$i.htm; done)
#sed is used to break out the lines want with a newline (containing *down.php*) and set delimiters around the info we want(NUMBER and FILENAMES)
echo $SOURCE | sed s/href/\\nhref/g | sed s/\=/\"/g | sed s/\>/\"/g | sed s/\</\"/g | while read LINE
do
case "$LINE" in
  *down.php*)
  if [[ "$LINE" == *down.php* ]]
  then
  NUMBER=$(echo $LINE | cut -d'"' -f 4)
  #get rid of ampersand (amp;) with sed
  #not tested but --restrict-file-names=nocontrol in the wget 
  FILENAME=$(echo $LINE | cut -d'"' -f 6 | sed s/amp\;//g)
  echo downloading: $NUMBER "'$FILENAME.$file_type'"
  #remove limit-rate if you don't have trouble with losing connection
  #script can be repeated until all files are 100%,-c is used to continue the download if parts already exist
  #echo wget --limit-rate=4000000 -T2 -t0 -c -w1 https://edgeemu.net/down.php?id=$NUMBER -O "$FILENAME.$file_type"
  #this did not work => --restrict-file-names=nocontrol should get rid of ampersand => used sed instead
  wget  -T2 -t0 -c -w1 https://edgeemu.net/down.php?id=$NUMBER -O "$FILENAME.$file_type"
  fi 
esac
done

cd "$startworkdir"