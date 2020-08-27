# scraper-tools

Contains scrapers for :
- msxcomputermagazine 
- Magpi-magazine
- msxcas.webcindario
- archive
- edgeemu
- vintagecomputers Philips P2000 documents


# msxmagazinescraper.sh

How to run :

Run it from the terminal with : bash msxmagazinescraper.sh

or

Make the program executable :

- Dubbleclick and choose open in terminal

- Or run it from the terminal with : ./msxmagazinescraper.sh

Use : 

Get the whole archive from www.msxcomputermagazine.nl/archief 

bladen/ (magazines)

disks/art-gallery/ 

disks/extra/ 

disks/lb/ (listing books on disk)

disks/mccm/ 

disks/mcm/ 

diskzips/ 

lb/ (listing books)

listings/ (listing files)

beware : it is mainly dutch


# Program : magpiscraper.sh

Use : 

Get the whole Magpi archive from https://www.raspberrypi.org

How to run :

Run it from the terminal with : bash magpiscraper.sh

Or

Make the program executable :

- Dubbleclick and choose open in terminal

- Or run it from the terminal with : ./magpiscraper.sh

Extra info :

Tested on 5-7-20 : MagPi has changed stuff !

Old MagPi location still works with magpi-issues until 86 and old beginners/code/project books

New MagPi location is added

wget (with continue option) is used now for getting the files from the old and the new location


# Program : msxcas_webcindario_scraper.sh

Use : 

Get all msx cas files from https://msxcas.webcindario.com/

How to run :

Run it from the terminal with : bash msxcas_webcindario_scraper.sh

Or

Make the program executable :

- Dubbleclick and choose open in terminal

- Or run it from the terminal with : ./msxcas_webcindario_scraper.sh

Extra info :

RetroPie map structure added in Version 2


# Programs : archive-v1.sh, archive-v2.sh and archive-v3.sh

Backups ! use archive.sh


# Program : archive.sh

Use : 

The best functional and educational script on how we can get files from --the archive-- !

How to run :

Run it from the terminal with : bash archive.sh

Or

Make the program executable :

- Dubbleclick and choose open in terminal

- Or run it from the terminal with : ./archive.sh

Extra info :

RetroPie map structure added

Improved check speed for files already processed (00index file that is checked at restart)

Continues with partly processed files

Can be stopped/restated at any time

-Read the script for more info-


# Program : edgeemu.sh

Use : 

Educational script on how we can get files from edgeemu !

How to run :

Run it from the terminal with : bash edgeemu.sh

Or

Make the program executable :

- Dubbleclick and choose open in terminal

- Or run it from the terminal with : ./edgeemu.sh

Extra info :

Read the script


# Program : 00_Philips_P2000_documents.sh

Use : 

Get some Philips P2000C / P2000T / P2000M computer documentation.

These are hard to come by.

Seems not all P2000T / P2000M documents are there.

How to run :

Run it from the terminal with : bash 00_Philips_P2000_documents.sh

Or

Make the program executable :

- Dubbleclick and choose open in terminal

- Or run it from the terminal with : ./00_Philips_P2000_documents.sh

