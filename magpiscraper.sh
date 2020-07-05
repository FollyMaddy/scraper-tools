#!/bin/bash
# Program : magpiscraper.sh
# Version : 1.4
# Use : 
# Get the whole Magpi archive from https://www.raspberrypi.org
# How to run :
# Make the program executable, dubbleclick and choose open in terminal.
# Or run it from the terminal with : ./magpiscraper.sh
# Author : Folkert van der Meulen
# Date   : 26/07/2019 (v1.3)(rewritten,reprogrammed)
# Date   : 05/07/2020 (v1.4)(added new MagPi issue location and wget and continue option for old and new location)

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

#old location (still works with magpi-issues until 86 and old beginners/code/project books)
maplist='magpi-issues/'

startworkdir=$(pwd)

echo "create directory\'s $startworkdir/$websitearchief/$maplist"
mkdir -p "$startworkdir/$websitearchief/$maplist"
cd "$startworkdir/$websitearchief/$maplist"
echo "Write files in map $startworkdir/$websitearchief/$maplist"
curl -g -s -o "-" "https://$websitearchief/$maplist" | while read LINE

do
case "$LINE" in
  *li*)
  MAPORFILE=$(echo $LINE| cut -d'"' -f 8)
  # do stuff if not conains a / (you can add more options by add this to line (ignore \ also) -->) && [[ "$MAPORFILE" != *\\* ]]
  if [[ "$MAPORFILE" != \/ ]] && [[ "$MAPORFILE" != \?* ]]
  then
  #echo curl -g -O https://$websitearchief/$maplist$MAPORFILE
  #curl -g -O https://$websitearchief/$maplist$MAPORFILE
  wget -c https://$websitearchief/$maplist$MAPORFILE
  #echo $MAPORFILE
  fi 
esac
done

cd "$startworkdir"


#new location
maplist='issues/' #until the latest MagPi issues, no beginners/code/project books

startworkdir=$(pwd)

echo "create directory\'s $startworkdir/$websitearchief/$maplist"
mkdir -p "$startworkdir/$websitearchief/$maplist"
cd "$startworkdir/$websitearchief/$maplist"

echo "Write files in map $startworkdir/$websitearchief/$maplist"

#begin with first MagPi
MagPi=1
issue=1

while [[ -n "$issue" ]]; do
issue=$(curl https://magpi.raspberrypi.org/issues/$MagPi/pdf | grep -o -P '(?<=href=").*(?=">click)')
echo wget -c $issue
MagPi=$[$MagPi + 1]
done

cd "$startworkdir"

