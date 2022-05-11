#!/bin/bash
#filedir=/compyfs/www/kima320/pictures/cosp_compy_FC5AV1C-L_ne30_maint-1.0_cnd_diag1.1/
cases=mac6mic6
#casename=rad_test_3h_compy_FC5AV1C-L_ne30_gmd_2020_330_with_forcing_method
casename=rad_${cases}_compy_FC5AV1C-L_ne30_gmd_2020_330_with_forcing_method
filedir=/compyfs/www/kima320/pictures/$casename/
#filedir=/compyfs/www/kima320/pictures/$casename/multiple_plot/
#filedir=/compyfs/www/kima320/Budget_Analysis/With_forcing_method/Difference/
#filedir=/compyfs/www/kima320/Budget_Analysis/Cloud_regime/
#filedir=/compyfs/www/kima320/pictures/q_budget_rad_compy_FC5AV1C-L_ne30_maint-1.0_cnd_diag1.1/
filename="Cloud_regimes(using_Annual_mean_mac6mic6-ctrl)_CLD_n_PREC_U"
#filename=Vertical_profiles_by_region_and_chkpt_in_one_page
#savedir=/compyfs/www/kima320/png_plot/Budget_Analysis/03_Sc_Cu/noclubbrad/
savedir=/compyfs/www/kima320/png_plot/Budget_Analysis/03_Sc_Cu/${cases}/
#savedir=/compyfs/www/kima320/png_plot/Budget_Analysis/02_zm_rad_modification/${cases}/
#savedir=/qfs/people/kima320/git_work/budgetanal/docs/02_cloud_regime/img/
mkdir $savedir

convert -rotate 270 -density 800 ${filedir}${filename}.pdf -resize 25% ${savedir}${filename}.png
#convert -density 800 ${filedir}${filename}.pdf -resize 25% ${savedir}${filename}.png
nfiles=`find ${savedir}${filename}*.png |wc -l`
ifile=0
echo number of files are $nfiles
if [[ $nfiles -lt 2 ]]
then
    changefile=${savedir}${filename}.png
    convert ${changefile} -flatten -fuzz 1% -trim +repage ${changefile}
else
  while [ $ifile -lt $nfiles ]
  do
    changefile=${savedir}${filename}-${ifile}.png
    convert ${changefile} -flatten -fuzz 1% -trim +repage ${changefile} 
  ((ifile++))
  done
fi
#convert -density 800 $filename.pdf -resize 25% $filename.png
