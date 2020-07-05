#!/bin/bash
# Program : archive.sh
# Version : 1.3a
# Use : 
# Educational script on how we can get files from https://www.archive.org
#
# How to run :
# Make the program executable, dubbleclick and choose open in terminal.
# Or run it from the terminal with : ./archive.sh
# Author : Folkert van der Meulen
# Date   : 03/02/2020
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

websitearchief=archive.org

#make your own or see these (--crypted--) examples (think, and you know what to do !!!)
#maplist='--download/tosecdcus20190822--'
#maplist='--download/GamecubeCollectionByGhostware--'

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
curl -g -s -o "-" "https://$websitearchief/$map/" | while read LINE

do
case "$LINE" in
  *zip* | *iso*)
  MAPORFILE=$(echo $LINE| cut -d'"' -f 2)
  # do stuff if not conains a / (you can add more options by add this to line (ignore \ also) -->) && [[ "$MAPORFILE" != *\\* ]]
  #if [[ "$MAPORFILE" != \/ ]] && [[ "$MAPORFILE" != \?* ]]
  #then
  echo wget https://$websitearchief/$map/$MAPORFILE
  wget  -T3 -t0 -c -w1 https://$websitearchief/$map/$MAPORFILE
  #echo $MAPORFILE
  #fi 
esac
done

done

#if zipped than extract all files
for z in *.zip; do unzip "$z" -d "$z.extract"; done

cd "$startworkdir"

