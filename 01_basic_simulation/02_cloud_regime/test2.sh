#!/bin/bash/
vars="Q T CLDLIQ CLDICE RAINQM CLD RH"
regions="ITCZ North_Atlantic North_Pacific Southern_Hemisphere California Peru Peru_trade Australia Namibian"
#chkpts="RAD IONDRAG ACRADRVT DYNEND DRYADJ DEEPCU BCRADADD CLUBB CUDET CLDMIC MACDIAG AERWETRM"
FigDir=https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/03_Sc_Cu/multiple_plots/regional/
file="06_diurnal_cycle.md"
for region in $regions; do
  echo "### $region" >> $file
  for var in $vars;do
    FigName=Diurnal_cycle_of_${var}_chkpt_in_one_page
    echo "=== \"${var}\" " >> $file
    echo "    ![${region}_$var](${FigDir}${FigName}_${region}.png)" >> $file
    echo " " >> $file
  done
  echo " " >> $file
done

