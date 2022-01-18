# By variables

Pairing Processes

| Variable | Source | Sink |
|----------|--------|------|
| Specific Humidity (Q) | - lower: CLUBB<br> - upper: DYNEND | - lower: DYNEND & DEEPCU<br> - upper: CLUBB |
| Temperature (T) | DEEPCU (lower: CLUBB) | RAD (lower: DYNEND) |
| Cloud water (CLDLIQ) | CLUBB | CLDMIC |
| Cloud ice (CLDICE) | CLUBB & DYNEND & CUDET | CLDMIC & CLUBB |
| Rain (RAINQM) | CLUBB | CLDMIC |
| Snow (SNOWQM) | CLUBB | CLDMIC |
| Wind (U & V) | DYNEND | CLUBB |

- lower=lower part of the atmosphere
- upper=upper part of the atmosphere


## Q

=== "Vertical Profile"
    ![vertical profile Q](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_profiles-0.png)

=== "Global Mean"
    ![global mean Q](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_global_mean-0.png)

=== "Zonal Mean"
    ![zonal Q](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_zonal_by_chkpt_and_add_substeps-0.png)

=== "Vertical integration"
    ![vert int Q](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_vertical_integral_by_chkpt_and_add_substeps-0.png)


|![vertical profile Q](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_profiles-0.png)|![global mean Q](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_global_mean-0.png)|
|---|---|
|![zonal Q](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_zonal_by_chkpt_and_add_substeps-0.png)|![vert int Q](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_vertical_integral_by_chkpt_and_add_substeps-0.png)|


## T 
|![vertical profile T](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_profiles-1.png)|![global mean T](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_global_mean-1.png)|
|---|---|
|![zonal T](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_zonal_by_chkpt_and_add_substeps-1.png)|![vert int T](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_vertical_integral_by_chkpt_and_add_substeps-1.png)|

## CLDLIQ
* Liquid water content

|![vertical profile CLDLIQ](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_profiles-2.png)|![global mean CLDLIQ](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_global_mean-2.png)|
|---|---|
|![zonal CLDLIQ](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_zonal_by_chkpt_and_add_substeps-2.png)|![vert int CLDLIQ](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_vertical_integral_by_chkpt_and_add_substeps-2.png)|

## CLDICE
* Ice water content

|![vertical profile CLDICE](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_profiles-3.png)|![global mean CLDICE](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_global_mean-333ng)|
|---|---|
|![zonal CLDICE](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_zonal_by_chkpt_and_add_substeps-3.png)|![vert int CLDICE](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_vertical_integral_by_chkpt_and_add_substeps-3.png)|

## RAINQM
* Precipitable water (only large-scale precpitation)

|![vertical profile Rain](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_profiles-4.png)|![global mean Rain](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_global_mean-4.png)|
|---|---|
|![zonal Rain](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_zonal_by_chkpt_and_add_substeps-4.png)|![vert int Rain](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_vertical_integral_by_chkpt_and_add_substeps-4.png)|

## SNOWQM 
* Precipitable ice (only large-scale precpitation)

|![vertical profile Snow](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_profiles-5.png)|![global mean Snow](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_global_mean-5.png)|
|---|---|
|![zonal Snow](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_zonal_by_chkpt_and_add_substeps-5.png)|![vert int Snow](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_vertical_integral_by_chkpt_and_add_substeps-5.png)|

## U
* Zonal wind

|![vertical profile U](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_profiles-6.png)|![global mean U](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_global_mean-6.png)|
|---|---|
|![zonal U](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_zonal_by_chkpt_and_add_substeps-6.png)|![vert int U](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_vertical_integral_by_chkpt_and_add_substeps-6.png)|


## V
* Meridional wind

|![vertical profile V](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_profiles-7.png)|![global mean V](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_global_mean-7.png)|
|---|---|
|![zonal V](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_zonal_by_chkpt_and_add_substeps-7.png)|![vert int V](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_vertical_integral_by_chkpt_and_add_substeps-7.png)|




