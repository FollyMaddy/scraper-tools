#!/bin/bash
# Program : Philips_P2000_documents.sh
# Version : 1
# Use : 
# Get Philips_P2000_documents
# How to run :
# Make the program executable, dubbleclick and choose open in terminal.
# Or run it from the terminal with : ./Philips_P2000_documents.sh
# Author : Folkert van der Meulen
# Date   : 26/08/2020 (v1)
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

#get desired files (pdf,zip) with continue (-c) recursive (-r) with recursive-depth (1 directory deep) (-l 1) and manually create a directory (-P) and do not automatically create directory's (-nd).
wget -c -r -l 1 https://www.retrocomputing.nl/p2000-basic-cartridge -P www.retrocomputing.nl/p2000-basic-cartridge -A pdf,zip -nd
wget -c -r -l 1 https://www.retrocomputing.nl/p2000-documentation -P www.retrocomputing.nl/p2000-documentation -A pdf,zip -nd
wget -c -r -l 1 http://www.vintagecomputer.net/fjkraan/comp/p2000c/doc -P www.vintagecomputer.net/p2000c -A pdf,jpg,txt -nd

