#!/bin/bash/

#regions="North_Pacific"
regions="Australia California ITCZ Nambian North_Atlantic North_Pacific Peru Peru_trade Southern_Hemisphere"
#files=$(find ./ -name "*.md" | sort)
vars="Q T CLDLIQ CLDICE CLD CAPE"
FigDir=https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_zm_rad_modification/differences/by_regions/dribbleZM/
FigName=Compare_dribbleZM_n_ctrl_

for region in $regions; do
  file=$(find ./ -name "*${region}.md")
  echo $file
  echo " " >> $file
  echo "## dribble DEEPCU vs. CTRL" >> $file
  echo " " >> $file
  for var in $vars; do
    echo "### "$var >> $file
    echo "!["$var"]("${FigDir}${FigName}${region}_${var}"-0.png)" >> $file
    echo "!["$var"]("${FigDir}${FigName}${region}_${var}"-1.png)" >> $file
    echo "!["$var"]("${FigDir}${FigName}${region}_${var}"-2.png)" >> $file
    echo "!["$var"]("${FigDir}${FigName}${region}_${var}"-3.png)" >> $file
    echo "!["$var"]("${FigDir}${FigName}${region}_${var}"-4.png)" >> $file
    echo "!["$var"]("${FigDir}${FigName}${region}_${var}"-5.png)" >> $file
    echo "!["$var"]("${FigDir}${FigName}${region}_${var}"-6.png)" >> $file
    echo "!["$var"]("${FigDir}${FigName}${region}_${var}"-7.png)" >> $file
    echo " " >> $file
  done
done

