# By variable

## Paring Processes

| variable |        | GLOBAL | ITCZ| Storm track | stratocumulus | +trade cumulus |
|----------|--------|--------|-----|-------------|---------------|----------------|
| Q        | source | - lower: CLUBB <br>- upper: DYNEND | - lower: CLUBB(+DYNEND) <br>- upper:DYNEND | - lower: CLUBB <br>- upper: DYNEND | CLUBB                                  | CLUBB                                      |
|          | sink   | - lower: DEEPCU+DYNEND <br>- upper: CLUBB | - lower:DEEPCU <br>- upper:         | - lower: DEEPCU+DYNEND <br>- upper: CLUBB| DYNEND                                 | DYNEND+DEEPCU                              |
|          | note   |                                           | - DYNEND response is different   from the global ave <br>- changes are mostly concentrated under 700 hPa | changes above & below 700 hPa are almost equivalant even though the Q   amounts are mostly concentrated below 850 hPa | - no DEEPCU <br>- no changes above 700 hPa |                                            |
| T        | source | CLUBB below 850 hPa (+DEEPCU near 850hPa) | DEEPCU         | CLUBB below 850 hPa (+DEEPCU near 850hPa) | DYNEND(+CLUBB)                         | DEEPCU(+DYNEND & CLUBB)                    |
|          | sink   | RAD (+DYNEND below 850 hPa)               | DYNEND(+RAD)   | RAD (+DYNEND below 850 hPa) | RAD                                    | RAD                                        |
|          | note   |                                           | CLUBB increments are small except   for sfc  |                                                                                                                       | DYNEND > CLUBB (large   subsidence???) |                                            |
| CLDLIQ   | source | CLUBB                                     | CLUBB(+CUDET in the middle) | CLUBB | CLUBB | CLUBB+CUDET |
|          | sink   | CLDMIC                                    | CLDMIC   | CLDMIC | CLDMIC | CLDMIC  |
|          | note   |                                           | - very small value in 700 hPa   (is this correct??) <br>- source in CUDET |  | changes only near 850 hPa | convective detrainment vs just detrainment |
| CLDICE   | source | - lower: CLUBB <br>- upper: DYNEND            | PACEND + CUDET  | CLDMIC(+CLUBB) |  | |
|                | sink   | CLDMIC(+CLUBB)                            | CLDMIC | very small changes |                                        |                                            |
|                | note   | changes are neglegible                    |        | larger amount of cloud ice compared to global ave. | changes are neglegible |   |
| RAINQM         | source | CLUBB | CLDMIC | | | |
|                | sink   | CLDMIC| CLUBB  | | | |
|                | note   | peak at sfc | peak at 700 hPa | peak at sfc. Very small changes | changes are neglegible | |
| SNOWQM         | source | DYNEND| DYNEND | | | |
|                | sink   | CLDMIC| CLDMIC | | | |
|                | note   |      |        | - larger amount of snow compared   to global ave. <br>- very small changes by process | changes are neglegible |                                            |
| WIND           | source | CLUBB | CLUBB  | DYNEND | CLUBB | |
|                | sink   | DYNEND| DYNEND+DEEPCU | CLUBB | DYNEND | |
|                | note   |       | - smaller wind, large   changes <br>- DEEPCU sink!  | - larger wind, relatively large   changes. <br>- (direction is opposite from ITCZ) || |










## Q
* ITCZ: high Q
* Storm track: relatively small Q
* Stratocumulus: 


=== "ITCZ"
    ![itcz](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_cloud_regime/Vertical_profiles_by_region_and_chkpt_in_one_page-0.png)

=== "Storm Track"
    ![ST](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_cloud_regime/Vertical_profiles_by_region_and_chkpt_in_one_page-8.png)

=== "Stratocumulus"
    ![SC](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_cloud_regime/Vertical_profiles_by_region_and_chkpt_in_one_page-16.png)



## T

=== "ITCZ"
    ![itcz](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_cloud_regime/Vertical_profiles_by_region_and_chkpt_in_one_page-1.png)

=== "Storm Track"
    ![ST](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_cloud_regime/Vertical_profiles_by_region_and_chkpt_in_one_page-9.png)

=== "Stratocumulus"
    ![SC](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_cloud_regime/Vertical_profiles_by_region_and_chkpt_in_one_page-17.png)




## Cloud water (CLDLIQ)

=== "ITCZ"
    ![itcz](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_cloud_regime/Vertical_profiles_by_region_and_chkpt_in_one_page-2.png)

=== "Storm Track"
    ![ST](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_cloud_regime/Vertical_profiles_by_region_and_chkpt_in_one_page-10.png)

=== "Stratocumulus"
    ![SC](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_cloud_regime/Vertical_profiles_by_region_and_chkpt_in_one_page-18.png)




## Cloud ice (CLDICE)

=== "ITCZ"
    ![itcz](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_cloud_regime/Vertical_profiles_by_region_and_chkpt_in_one_page-3.png)

=== "Storm Track"
    ![ST](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_cloud_regime/Vertical_profiles_by_region_and_chkpt_in_one_page-11.png)

=== "Stratocumulus"
    ![SC](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_cloud_regime/Vertical_profiles_by_region_and_chkpt_in_one_page-19.png)




## Rain (RAINQM)

=== "ITCZ"
    ![itcz](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_cloud_regime/Vertical_profiles_by_region_and_chkpt_in_one_page-4.png)

=== "Storm Track"
    ![ST](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_cloud_regime/Vertical_profiles_by_region_and_chkpt_in_one_page-12.png)

=== "Stratocumulus"
    ![SC](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_cloud_regime/Vertical_profiles_by_region_and_chkpt_in_one_page-20.png)





## Snow (SNOWQM)

=== "ITCZ"
    ![itcz](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_cloud_regime/Vertical_profiles_by_region_and_chkpt_in_one_page-5.png)

=== "Storm Track"
    ![ST](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_cloud_regime/Vertical_profiles_by_region_and_chkpt_in_one_page-13.png)

=== "Stratocumulus"
    ![SC](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_cloud_regime/Vertical_profiles_by_region_and_chkpt_in_one_page-21.png)





## Wind 

* Zonal
=== "ITCZ"
    ![itcz](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_cloud_regime/Vertical_profiles_by_region_and_chkpt_in_one_page-6.png)

=== "Storm Track"
    ![ST](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_cloud_regime/Vertical_profiles_by_region_and_chkpt_in_one_page-14.png)

=== "Stratocumulus"
    ![SC](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_cloud_regime/Vertical_profiles_by_region_and_chkpt_in_one_page-22.png)


* Meridional
=== "ITCZ"
    ![itcz](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_cloud_regime/Vertical_profiles_by_region_and_chkpt_in_one_page-7.png)

=== "Storm Track"
    ![ST](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_cloud_regime/Vertical_profiles_by_region_and_chkpt_in_one_page-15.png)

=== "Stratocumulus"
    ![SC](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/02_cloud_regime/Vertical_profiles_by_region_and_chkpt_in_one_page-23.png)



