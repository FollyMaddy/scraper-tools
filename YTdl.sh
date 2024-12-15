#!/bin/bash
# Program : YTdl.sh
# Version : 1.3
# Use : 
# Script is not working OOB !
# Find out for your self how this script works and get the program used by this script !
# Part of the script purpose, is to get usefull filenames
# Additional info :
# This script is created for educational purposes only
# We dissaprove illegal usage
# How to run :
# Make the program executable, dubbleclick and choose open in terminal.
# Or run it from the terminal with : ./YTdl.sh
# Date   : 15/12/2024
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

# while examples see >> https://www.cyberciti.biz/faq/bash-while-loop/
while :
do
    # if examples see >> https://ryanstutorials.net/bash-scripting-tutorial/bash-if-statements.php
    # -z STRING	(The lengh of STRING is zero (ie it is empty)
    # use a space between the square brackets 
    # OR examples see >> https://unix.stackexchange.com/questions/47584/in-a-bash-script-using-the-conditional-or-in-an-if-statement
    # did not work >> if [ $playlist = 'y' ] || [ -z $playlist ]
    
    # Ask the user for playlist or non-playlist mode  
    echo Start in playlist mode ?
    read -p '(enter or y/n)> ' playlist
    if [ -z $playlist ] || [ $playlist = 'y' ]
    then
	# tip >> playlistmode = "--yes-playlist" << does not work because of spaces around the "=" !
	# should also work >> playlistmode=""
        playlistmode="--yes-playlist"
    else
        playlistmode="--no-playlist"
    fi

    # Ask the user for YT webadres or press enter to quit
    echo Make sure you do not enter a webadres with dead links.
    echo Enter a YT-webadres to download or press enter to quit.
    read -p '> ' webadres
    
    if [ -z $webadres ]
    then
        exit
    else
        echo playlistmode = $playlistmode
        # for placing files in a separate directory from within the script directory >> 
        /usr/bin/yt-dlp -f 140 $playlistmode -c -o "%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" $webadres
        
        # command output to string examples see >> https://stackoverflow.com/questions/6316822/put-command-output-into-string      
        # use pwd for directory you are in. see >>https://www.ostricher.com/2014/10/the-right-way-to-get-the-directory-of-a-bash-script/
        privateworkdir=$(pwd)
        # ls list examples see >> https://stackoverflow.com/questions/15691359/how-can-i-list-ls-the-5-last-modified-files-in-a-directory
        uselatestmap=$(ls -1t | head -1)

        # write webadres to file. If file already exists, append webadres. (usefull in no-playlist directory file)
        # use ">" for one line (if file exists it will overwrite).
        # use ">>" to append more lines (if file exists it will add/append information).
        echo $webadres >> "$privateworkdir/$uselatestmap/00 - $uselatestmap"
    fi
done

