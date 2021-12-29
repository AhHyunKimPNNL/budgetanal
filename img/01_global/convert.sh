#!/bin/bash
filename=All_zonal_by_variable_and_add_substeps
#filename=All_vertical_integral_by_variable_and_add_substeps
#filename=All_global_mean
#filename=All_vertical_integral_by_chkpt_and_add_substeps
#filename=All_zonal_by_chkpt_and_add_substeps
#filename=All_profiles

convert -density 800 ./${filename}.pdf -resize 25% ${filename}.png
nfiles=`find ${filename}*.png |wc -l`
ifile=0
echo number of files are $nfiles

while [ $ifile -lt $nfiles ]
do
  changefile=${filename}-${ifile}.png
  convert ${changefile} -flatten -fuzz 1% -trim +repage ${changefile} 
  ((ifile++))
done
#convert -density 800 $filename.pdf -resize 25% $filename.png
