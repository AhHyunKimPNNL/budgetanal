#!/bin/bash
filedir=/compyfs/www/kima320/Budget_Analysis/Cloud_regime/
filename=Seasonal_changes_of_vertical_integrals_by_chkpt
#filename=Vertical_profiles_by_region_and_chkpt_in_one_page
savedir=/compyfs/www/kima320/png_plot/Budget_Analysis/02_cloud_regime/
#filedir=/compyfs/www/kima320/pictures/q_budget_rad_compy_FC5AV1C-L_ne30_maint-1.0_cnd_diag1.1/
#savedir=/qfs/people/kima320/git_work/budgetanal/docs/02_cloud_regime/img/
#filename=seasonal_changes_Precipitation
#filename=All_zonal_by_variable_and_add_substeps
#filename=All_vertical_integral_by_variable_and_add_substeps
#filename=All_global_mean
#filename=All_vertical_integral_by_chkpt_and_add_substeps
#filename=All_zonal_by_chkpt_and_add_substeps
#filename=All_profiles

convert -density 800 ${filedir}${filename}.pdf -resize 25% ${savedir}${filename}.png
nfiles=`find ${savedir}${filename}*.png |wc -l`
ifile=0
echo number of files are $nfiles

while [ $ifile -lt $nfiles ]
do
  changefile=${savedir}${filename}-${ifile}.png
  convert ${changefile} -flatten -fuzz 1% -trim +repage ${changefile} 
  ((ifile++))
done
#convert -density 800 $filename.pdf -resize 25% $filename.png
