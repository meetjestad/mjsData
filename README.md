# Meetjestad Data Processing

This is the entry point for the MeetJeStad Data group information. Scripts, graphs and pages can be added to this repository or a link can be added to reference to another location.

## Github markdown format specification

https://guides.github.com/features/mastering-markdown/


## Meetjestad website links

MeetJeStad - [Meten en observeren](https://meetjestad.net/nl/Meten_en_observeren) - [Resultaten](https://meetjestad.net/nl/Resultaten)


## Meetjestad data processing in R

http://meetjestad.net/downloads/datahandleiding.pdf

http://meetjestad.net/data/handleiding.r

http://ladylein.nl/R/index.html


      ### aanpassing http://meetjestad.net/downloads/datahandleiding.pdf: 
      pagina 9:  Haal de data op van de server van Meet je Stad
          > data<-read.table(paste("http://meetjestad.net/data?
            type=sensors&ids=",id,"&format=csv", sep=""), sep="\t",
            header=T)
      geeft: Error in scan(file = file, what = what, sep = sep, quote = quote, dec = dec,  : 
            line 1 did not have 26 elements

          verander in:
              data<-read.table(paste("https://meetjestad.net/data/?type=sensors&ids=",id,"&format=csv&limit=10", sep=""), sep="\t", fill = TRUE, header=T)

## Meetjestad data processing in Python


## KNMI data

[Data ophalen vanuit een script](https://www.knmi.nl/kennis-en-datacentrum/achtergrond/data-ophalen-vanuit-een-script)

https://www.knmi.nl/nederland-nu/klimatologie  
https://www.knmi.nl/nederland-nu/klimatologie/uurgegevens  
http://projects.knmi.nl/klimatologie/uurgegevens/selectie.cgi  




