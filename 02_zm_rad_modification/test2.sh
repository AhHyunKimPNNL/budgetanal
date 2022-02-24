#!/bin/bash/
vars="Q T CLDLIQ CLDICE CLD"
chkpts="RAD IONDRAG ACRADRVT DYNEND DRYADJ DEEPCU BCRADADD CLUBB CUDET CLDMIC MACDIAG AERWETRM"
FigDir=https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_zm_rad_modification/global/
FigName=Diff_vertical_integral_add_substeps
file="01_global.md"
for var in $vars; do
  echo "### $var" >> $file
  for chkpt in $chkpts;do
    echo "=== \"${chkpt}\" " >> $file
    echo "    ![${var}_$chkpt](${FigDir}${FigName}${region}_${var}_${chkpt}.png)" >> $file
    echo " " >> $file
  done
  echo " " >> $file
done

