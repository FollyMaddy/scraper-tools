#!/bin/bash
# Program : archive.sh
# Version : 3
# Use : 
# Get stuff of https://www.archive.org
# Script is not working OOB !
# Find out for your self how this script works, uncomment the desired #-># lines and alter to your needs !
# Additional info :
# This script is created for educational purposes
# We dissaprove illegal usage
# How to run :
# Make the program executable, dubbleclick and choose open in terminal.
# Or run it from the terminal with : ./archive.sh
# Author : Folkert van der Meulen
# Date   : 06/11/2020
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


website=archive.org
websitemap=download
startworkdir=$(pwd)

#make your own or choose one of these (--crypted) examples

#(these use standard map structures)

#maplist='--retropiebiosfilesconfiguredforeverysystem_20190904'; RP_map_structure=BIOS #(most systems are in the pack) unpack and move them to the right place
#maplist='--MESS-0.151.BIOS.ROMs'; RP_map_structure=BIOS # unpack and move them to the right place

#maplist='--tosecdcus20190822'; RP_map_structure=roms/dreamcast
#maplist='--GamecubeCollectionByGhostware--'; RP_map_structure=roms/gc; #(x86 only)
#maplist='--redumpPhilipsCdi'; RP_map_structure=roms/cdimono1; #(this should be the future mapstructure if console is added)
#maplist='--PhilipsCD-i-Preproduction-Non-RedumpSet'; RP_map_structure=roms/cdimono1; #(this should be the future mapstructure if console is added)
#maplist='--Amiga_CDTV_TOSEC_2009_04_18'; RP_map_structure=roms/amiga/CDTV # just one file of 22G and continue seems not to work
#maplist='--RedumpAmigaCD32'; RP_map_structure=roms/amiga/CD32
#maplist='--MSX_MSX_TOSEC_2012_04_23'; RP_map_structure=roms/msx # just one file of 160M
#maplist='--tosec-20161111-commodore-c64'; RP_map_structure=roms/c64 # just one file of 18G
#maplist='--redump.ss'; RP_map_structure=roms/saturn
#maplist='--3ds-cia-eshop'; RP_map_structure=roms/3ds;
#maplist='--1PokemonUltraSunEURMULTi83DSPUSSYCAT/More%203ds%20games/'; RP_map_structure=roms/3ds;
#maplist='--3DSCIA_testitem1'; RP_map_structure=roms/3ds;
#maplist='--SharpX68000RomCollectionByGhostware'; RP_map_structure=roms/x68000;
#maplist='--Neo_Kobe_Sharp_X1_2016-02-25'; RP_map_structure=roms/x1; #just one file
#maplist='--Sharp_X1_TOSEC_2012_04_23'; RP_map_structure=roms/x1; #just one file
#maplist='--redumpPhilipsCdi'; RP_map_structure=roms/cdimono1; 
#maplist='--PhilipsCD-i-Preproduction-Non-RedumpSet'; RP_map_structure=roms/cdimono1;
#maplist='--pc88-rom1900-300docs'; RP_map_structure=roms/pc88; # just one file of 640M # japanese filenames, creates some strange directory's and filenames
#maplist='--Neo_Kobe_NEC_PC-8801_2016-02-25'; RP_map_structure=roms/pc88; # just one file of 2.6G # bios files also included
#maplist='--NeoKobe-NecPc-98012017-11-17'; RP_map_structure=roms/pc98; 
#maplist='--PC98_Games_1813'; RP_map_structure=roms/pc98; # 2 files of about 7G, both files seem to have the same content, rar will not unpack on PI



# add in future : compilation of many consoles download/TOSEC_V2017-04-23


echo "create directory\'s $startworkdir/$RP_map_structure/$website/$maplist"
mkdir -p "$startworkdir/$RP_map_structure/$website/$maplist"
cd "$startworkdir/$RP_map_structure/$website/$maplist"

curl -g -s -o "-" "https://$website/$websitemap/$maplist/" | while read LINE

do
case "$LINE" in
  *cia* |*rar/* |*zip* | *iso* | *lzh*)
  MAPORFILE=$(echo $LINE| cut -d'"' -f 2)
  # do stuff if not conains a / (you can add more options by add this to line (ignore \ also) -->) && [[ "$MAPORFILE" != *\\* ]]
  #if [[ "$MAPORFILE" != \/ ]] && [[ "$MAPORFILE" != \?* ]]
  #remove limit-rate if you don't have trouble with losing connection
  #script can be repeated until all files are 100%,-c is used to continue the download if parts already exist
  
  #redirect error if file does not yet exist with 2>&-
  index=$(cat $startworkdir/$RP_map_structure/$website/$maplist/00index 2>&-)
  #echo $index

  #check the file 00index for files that are already downloaded
  if [[ "$index" != *"$MAPORFILE"* ]];then
  echo Download : $MAPORFILE | sed "s/%20/ /g;s/%21/!/g;s/%23/#/g;s/%24/$/g;s/%26/\&/g;s/%27/'/g;s/%28/(/g;s/%29/)/g"
  #"2>&1 | tee" is added to redirect sterr and stout and tee makes and shows this text file. This is how can check if something is already done.
  #however tee does not seem to refresh the progressbar on 1 line
  #sed did not work for me ! :<=that's why we do a sed command between before tee command, replace text ".s\n" in ".s\r" to show the progressbar again on 1 line like wget normally does.
  #backup line ! is ok
  #time added for good continue -T2 => -T3
  #wget -T3 -t0 -c -w1 https://$website/$websitemap/$maplist/$MAPORFILE 2>&1 | tee $startworkdir/$RP_map_structure/$website/$maplist/00wgetlogs/$MAPORFILE.info
  #if functions with echo and \r to overwrite progressbarr line
  wget -T3 -t0 -c -w1 https://$website/$websitemap/$maplist/$MAPORFILE 2>&1| while read line
  do 
    if [[ $line == *"416 Requested Range Not Satisfiable"* ]] || [[ $line == *"100%"* ]]
    then 
    touch $startworkdir/$RP_map_structure/$website/$maplist/00index
    echo $MAPORFILE >> $startworkdir/$RP_map_structure/$website/$maplist/00index
    #Issue : This if is used for echoing new progress line over old ones and don't echo empty lines,but it does not alway's work as it should.
    #(program works though)
    if [[ $line == *"100%"* ]]
      then
      echo -ne '                                                                                                                        \r'
      echo -ne $line '\r'
      else
      echo $line
      fi
    else 
      if [[ $line == *".........."* ]]
      then
      echo -ne '                                                                                                                        \r'
      echo -ne $line '\r'
      else
      echo $line
      fi
    fi
  done
  echo
  else
  echo Already downloaded : $MAPORFILE | sed "s/%20/ /g;s/%21/!/g;s/%23/#/g;s/%24/$/g;s/%26/\&/g;s/%27/'/g;s/%28/(/g;s/%29/)/g"
  echo
  fi

  #fi 
esac
done

#if zipped than extract all files
#for z in *.zip; do unzip "$z" -d "$z.extract"; done

cd "$startworkdir"