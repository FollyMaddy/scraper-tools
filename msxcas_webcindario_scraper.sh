#!/bin/bash

#!/bin/bash
# Program : 00_msxcas_webcindario_scraper.sh
# Version : 1
# Use : 
# Get all msx cas files from https://msxcas.webcindario.com/
# How to run :
# Make the program executable, dubbleclick and choose open in terminal.
# Or run it from the terminal with : ./00_msxcas_webcindario_scraper.sh
# Author : Folkert van der Meulen
# Date   : 29/10/2019 
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


#example for simple scraping
#LINE=$(cat source_website | grep zip | cut -d'"' -f 2)

# example for filtering on multiple "words" with sed and grep only the lines containing zip and cas
# "0" , "100%" and "right" are optional for the future to get also the rom lines, but for now only cas files are downloaded
#LINE=$(sed 's/\"0\"//g;s/\"-1\"//g;s/\"100\%\"//g;s/\"right\"//g' 00_source_website | grep zip | grep cas | cut -d'"' -f 2)

#load index directly from website and filter out all cas files that are zipped
LINE=$(curl -g https://msxcas.webcindario.com/index.html | sed 's/\"0\"//g;s/\"-1\"//g;s/\"100\%\"//g' | grep zip | grep cas | cut -d'"' -f 2)

for file in $LINE
  do
  curl -g -O http://msxcas.webcindario.com/$file
  done

