#!/bin/bash/

vars="RAD IONDRAG ACRADRVT DYNEND DRYADJ DEEPCU BCRADADD CLUBB CUDET CLDMIC MACDIAG AERWETRM"
FigDir=https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_zm_rad_modification/global/
FigName=Diff_Zonal_mean_by_variable_and_add_substep
file="01_global.md"
for var in $vars; do
  echo "=== $var" >> $file
  echo "    ![$var](${FigDir}${FigName}${region}_${var}-0.png)!["$var"]("${FigDir}${FigName}${region}_${var}"-1.png)!["$var"]("${FigDir}${FigName}${region}_${var}"-2.png) !["$var"]("${FigDir}${FigName}${region}_${var}"-3.png)" >> $file
  echo " " >> $file
done

