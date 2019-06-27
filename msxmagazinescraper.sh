#!/bin/bash
# Date   : 27/06/2019
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

# Make the program executable, dubbleclick and choose open in terminal.
# Or run it from the terminal with : ./msxmagazinescraper.sh

bladen=https://www.msxcomputermagazine.nl/archief/bladen/
disks_art_gallery=https://www.msxcomputermagazine.nl/archief/disks/art-gallery/
disks_extra=https://www.msxcomputermagazine.nl/archief/disks/extra/
disks_lb=https://www.msxcomputermagazine.nl/archief/disks/lb/
disks_mccm=https://www.msxcomputermagazine.nl/archief/disks/mccm/
disks_mcm=https://www.msxcomputermagazine.nl/archief/disks/mcm/
diskzips=https://www.msxcomputermagazine.nl/archief/diskzips/
lb=https://www.msxcomputermagazine.nl/archief/lb/

# Listings are not implemented !!! 
# Too much work for this quick and dirty program.
# For that i have to make a different program.

startworkdir=$(pwd)

mkdir "$startworkdir/bladen"
mkdir "$startworkdir/disks"
mkdir "$startworkdir/disks/art-gallery"
mkdir "$startworkdir/disks/extra"
mkdir "$startworkdir/disks/lb"
mkdir "$startworkdir/disks/mccm"
mkdir "$startworkdir/disks/mcm"
mkdir "$startworkdir/diskzips"
mkdir "$startworkdir/lb"

cd "$startworkdir/bladen"
curl -g -s -o "-" "$bladen" | while read LINE
do
case "$LINE" in
  *li*)
  MAPORFILE=$(echo $LINE| cut -d'"' -f 2)
  # do stuff if not conains a / (you can add more options by add this to line (ignore \ also) -->) || [[ "$MAPORFILE" != *\\* ]]
  if [[ "$MAPORFILE" != *\/* ]] 
  then
  echo curl -g -O $bladen$MAPORFILE
  curl -g -O $bladen$MAPORFILE
  #echo $MAPORFILE
  fi 
esac
done
cd "$startworkdir"

cd "$startworkdir/disks/art-gallery"
curl -g -s -o "-" "$disks_art_gallery" | while read LINE 
do
case "$LINE" in
  *li*)
  MAPORFILE=$(echo $LINE| cut -d'"' -f 2)
  # do stuff if not conains a / (you can add more options by add this to line (ignore \ also) -->) || [[ "$MAPORFILE" != *\\* ]]
  if [[ "$MAPORFILE" != *\/* ]] 
  then
  echo curl -g -O $disks_art_gallery$MAPORFILE
  curl -g -O $disks_art_gallery$MAPORFILE
  #echo $MAPORFILE
  fi  
esac
done
cd "$startworkdir"

cd "$startworkdir/disks/extra"
curl -g -s -o "-" "$disks_extra" | while read LINE 
do
case "$LINE" in
  *li*)
  MAPORFILE=$(echo $LINE| cut -d'"' -f 2)
  # do stuff if not conains a / (you can add more options by add this to line (ignore \ also) -->) || [[ "$MAPORFILE" != *\\* ]]
  if [[ "$MAPORFILE" != *\/* ]] 
  then
  echo curl -g -O $disks_extra$MAPORFILE
  curl -g -O $disks_extra$MAPORFILE
  #echo $MAPORFILE
  fi  
esac
done
cd "$startworkdir"

cd $startworkdir/disks/lb
curl -g -s -o "-" "$disks_lb" | while read LINE 
do
case "$LINE" in
  *li*)
  MAPORFILE=$(echo $LINE| cut -d'"' -f 2)
  # do stuff if not conains a / (you can add more options by add this to line (ignore \ also) -->) || [[ "$MAPORFILE" != *\\* ]]
  if [[ "$MAPORFILE" != *\/* ]] 
  then
  echo curl -g -O $disks_lb$MAPORFILE
  curl -g -O $disks_lb$MAPORFILE
  #echo $MAPORFILE
  fi  
esac
done
cd "$startworkdir"

cd "$startworkdir/disks/mccm"
curl -g -s -o "-" "$disks_mccm" | while read LINE 
do
case "$LINE" in
  *li*)
  MAPORFILE=$(echo $LINE| cut -d'"' -f 2)
  # do stuff if not conains a / (you can add more options by add this to line (ignore \ also) -->) || [[ "$MAPORFILE" != *\\* ]]
  if [[ "$MAPORFILE" != *\/* ]] 
  then
  echo curl -g -O $disks_mccm$MAPORFILE
  curl -g -O $disks_mccm$MAPORFILE
  #echo $MAPORFILE
  fi  
esac
done
cd "$startworkdir"

cd "$startworkdir/disks/mcm"
curl -g -s -o "-" "$disks_mccm" | while read LINE 
do
case "$LINE" in
  *li*)
  MAPORFILE=$(echo $LINE| cut -d'"' -f 2)
  # do stuff if not conains a / (you can add more options by add this to line (ignore \ also) -->) || [[ "$MAPORFILE" != *\\* ]]
  if [[ "$MAPORFILE" != *\/* ]] 
  then
  echo curl -g -O $disks_mccm$MAPORFILE
  curl -g -O $disks_mccm$MAPORFILE
  #echo $MAPORFILE
  fi  
esac
done
cd "$startworkdir"

cd "$startworkdir/diskzips"
curl -g -s -o "-" "$diskzips" | while read LINE 
do
case "$LINE" in
  *li*)
  MAPORFILE=$(echo $LINE| cut -d'"' -f 2)
  # do stuff if not conains a / (you can add more options by add this to line (ignore \ also) -->) || [[ "$MAPORFILE" != *\\* ]]
  if [[ "$MAPORFILE" != *\/* ]] 
  then
  echo curl -g -O $diskzips$MAPORFILE
  curl -g -O $diskzips$MAPORFILE
  #echo $MAPORFILE
  fi  
esac
done
cd "$startworkdir"

cd "$startworkdir/lb"
curl -g -s -o "-" "$lb" | while read LINE
do
case "$LINE" in
  *li*)
  MAPORFILE=$(echo $LINE| cut -d'"' -f 2)
  # do stuff if not conains a / (you can add more options by add this to line (ignore \ also) -->) || [[ "$MAPORFILE" != *\\* ]]
  if [[ "$MAPORFILE" != *\/* ]] 
  then
  echo curl -g -O $lb$MAPORFILE
  curl -g -O $lb$MAPORFILE
  #echo $MAPORFILE
  fi 
esac
done
cd "$startworkdir"
