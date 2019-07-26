#!/bin/bash
# Program : magpiscraper.sh
# Version : 1.3
# Use : 
# Get the whole Magpi archive from https://www.raspberrypi.org
# How to run :
# Make the program executable, dubbleclick and choose open in terminal.
# Or run it from the terminal with : ./magpiscraper.sh
# Author : Folkert van der Meulen
# Date   : 26/07/2019 (rewritten,reprogrammed)
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

websitearchief=www.raspberrypi.org
maplist='magpi-issues/'

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
  MAPORFILE=$(echo $LINE| cut -d'"' -f 8)
  # do stuff if not conains a / (you can add more options by add this to line (ignore \ also) -->) && [[ "$MAPORFILE" != *\\* ]]
  if [[ "$MAPORFILE" != \/ ]] && [[ "$MAPORFILE" != \?* ]]
  then
  echo curl -g -O https://$websitearchief/$map$MAPORFILE
  curl -g -O https://$websitearchief/$map$MAPORFILE
  #echo $MAPORFILE
  fi 
esac
done

done

cd "$startworkdir"

