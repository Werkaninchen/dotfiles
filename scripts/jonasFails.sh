#!/bin/sh
awk -F, '{$2=$2+1}1' OFS=, $HOME/JonasFails.txt >tmp.txt & mv -f tmp.txt $HOME/JonasFails.txt 
