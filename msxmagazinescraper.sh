#!/bin/bash
# Program : msxmagazinescraper.sh
# Version : 1.3
# Use : 
# Get the whole archive from www.msxcomputermagazine.nl/archief without a mouse-click
# How to run :
# Make the program executable, dubbleclick and choose open in terminal.
# Or run it from the terminal with : ./msxmagazinescraper.sh
# Author : Folkert van der Meulen
# Date   : 28/06/2019 (rewritten,reprogrammed)
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

websitearchief=www.msxcomputermagazine.nl/archief
maplist='
bladen/ 
disks/art-gallery/ 
disks/extra/ 
disks/lb/ 
disks/mccm/ 
disks/mcm/ 
diskzips/ 
lb/ 
listings/mcmd02.di1/
listings/mcmd03.di1/
listings/mcmd04.di1/
listings/mcmd05.di1/
listings/mcmd06.di1/
listings/mcmd07.di1/
listings/mcmd08.di1/
listings/mcmd09.di1/
listings/mcmd10.di1/
listings/mcmd11.di1/
listings/mcmd12.di1/
listings/mcmd13.di1/
listings/mcmd14.di1/
listings/mcmd15.di1/
listings/mcmd16.di1/
listings/mcmd17.di1/
listings/mcmd18.di1/
listings/mcmd19.di1/
listings/mcmd20.di1/
listings/mcmd21.di1/
listings/mcmd22.di1/
listings/mcmd23.di1/
listings/mcmd24.di1/
listings/mcmd25.di1/
listings/mcmd26.di1/
listings/mcmd27.di1/
listings/mcmd28.di1/
listings/mcmd29.di1/
listings/mcmd30.di1/
listings/mcmd31.di1/
listings/mcmd32.di1/
listings/mcmd33.di1/
listings/mcmd34.di1/
listings/mcmd35.di1/
listings/mcmd36.di1/
listings/mcmd37.di1/
listings/mcmd38.di1/
listings/mcmd39.di1/
listings/mcmd40.di1/
listings/mcmd41.di1/
listings/mcmd42.di1/
listings/mcmd43.di1/
listings/mcmd44.di1/
listings/mcmd45.di1/
listings/mcmd46.di1/
listings/mcmd47.di1/
listings/mcmd48.di1/
listings/mcmd49.di1/
listings/mcmd50.di1/
listings/mcmd51.di1/
listings/mcmd52.di1/
listings/mcmd53.di1/
listings/mcmd55.di2/
listings/mcmd56.di1/'

startworkdir=$(pwd)

for map in $maplist
do
echo "create directory\'s $startworkdir/$websitearchief/$map"
mkdir -p "$startworkdir/$websitearchief/$map"
done

for map in $maplist
do

cd "$startworkdir/$websitearchief/$map"
echo "Write files in map $startworkdir/$websitearchief/$map"
curl -g -s -o "-" "https://$websitearchief/$map" | while read LINE

do
case "$LINE" in
  *li*)
  MAPORFILE=$(echo $LINE| cut -d'"' -f 2)
  # do stuff if not conains a / (you can add more options by add this to line (ignore \ also) -->) || [[ "$MAPORFILE" != *\\* ]]
  if [[ "$MAPORFILE" != *\/* ]] 
  then
  echo curl -g -O https://$websitearchief/$map$MAPORFILE
  curl -g -O https://$websitearchief/$map$MAPORFILE
  #echo $MAPORFILE
  fi 
esac
done

done

cd "$startworkdir"

