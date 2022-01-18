# By checkpoints

## RAD

* changes are mostly due to cloud longwave cooling
* {==at 850 hPa==}: subtropical low-level cloud
    - cooling from stratocumulus cloud top are the strongest.
    - cooling also comes from storm track cloud top, but the effect is smaller than stratocumulus regions  
![regional_T_inc](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/RAD_T_regional.png)


=== "Vertical Integration"
    ![vert int](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_vertical_integral_by_variable_and_add_substeps-0.png)
=== "Zonal mean"
    ![zonal](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_zonal_by_variable_and_add_substeps-0.png)

## PACEND

* increments are minor

=== "Vertical Integration"
    ![vert int](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_vertical_integral_by_variable_and_add_substeps-1.png)
=== "Zonal mean"
    ![zonal](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_zonal_by_variable_and_add_substeps-1.png)


## DYNEND

* changes are mostly due to transport (momentum & coriolis)
   * vertical / horizontal transport are not yet separated
* Hadley circulation affects cooling in the Equator and warming at the stratocumulus cloud top
* transportation of hydrometeor & water vapor occurs near the surface.
* {==source of surface cooling==}: 
     1. horizontal cold advection 
     2. vertical motion due to 
         - upward motion in storm track 
     3. humidity
         - dT/dt is eventually a function of humidity in dynamics
         - see [Equation 95 & 102 in CAM5 Scientific Guide Section 4.3.1](https://ncar.github.io/CAM/doc/build/html/cam5_scientific_guide/dynamics.html#generalized-terrain-following-vertical-coordinates)
![95](https://ncar.github.io/CAM/doc/build/html/_images/math/6d401281fd19c33d9ebb0d8db7a55091f1794bf3.png)
![102](https://ncar.github.io/CAM/doc/build/html/_images/math/ea2cdabba9252f4b71ae20e26cc8f11759eecc21.png)


|   | source | sink |
|---|--------|------|
| T | - 850 hPa 30S~EQ: accumulation of descending air at the stratocumulus cloud top   | - near surface 40S~EQ: horizontal cold advection near stratocumulus regions <br>- near surface NH:<br>   1. due to upward motion of air (?) <br>   2. due to buoyancy caused by strong surface latent heat flux |
| |![zonal avg](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/DYNEND_omega_zonal.png) |![temp adv](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/DYNEND_/temp_adv.png)|
| | |![T inc seasonal](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/DYNEND_T_increment_seasonal.png)|
| | |![LHFLX](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/DYNEND_LHFLX.png)

=== "Vertical Integration"
    ![vert int](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_vertical_integral_by_variable_and_add_substeps-2.png)
=== "Zonal mean"
    ![zonal](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_zonal_by_variable_and_add_substeps-2.png)

## DRYADJ

* minor changes

=== "Vertical Integration"
    ![vert int](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_vertical_integral_by_variable_and_add_substeps-3.png)
=== "Zonal mean"
    ![zonal](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_zonal_by_variable_and_add_substeps-3.png)

## DEEPCU

* convective tracer transport & momentum transport is calculated in this process.
* sensitive to vertical horizontal resolution
    - affect temperature and moisture gradient leading to more variation in layer stability, relative humidity, and buoyancy.
    - higher vertical resolution near surface may cause drier free troposhere due to the absence of processes that mix water vapor to higher latitudes.
* water vapor decreases due to condensation of convective hydrometeors (not shown)
* temperature changes are mostly due to convective heat transportation & condensation
* ice thermodynamics are generally neglected (Rasch et al., 2019)
    - when liquid condensate is detrained from the updraft it is partitioned into liquid and ice over a (tunable) temperature range, and the energy associated with a phase change is applied locally to the temperature tendency to conserve energy.
    - also may cause the {==source of 600 hPa heating==}: see temperature dependent snow melting process in `zm_conv.F90`
    - in ITCZ, temperature at 600 hPa is near 0ºC
``` F90
! Melt snow falling into layer, if necessary. 
          if (t(i,k) > tmelt) then
             flxsntm(i) = 0._r8
             snowmlt(i) = flxsnow(i,k) * gravit/ pdel(i,k)
          else
             flxsntm(i) = flxsnow(i,k)
             snowmlt(i) = 0._r8
          end if

```
![DEEPCU_600hPa](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/DEEPCU_600hPa.png)

* {==Q sink in 850 hPa 60S~30S==}: ??


=== "Vertical Integration"
    ![vert int](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_vertical_integral_by_variable_and_add_substeps-4.png)
=== "Zonal Mean"
    ![zonal](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_zonal_by_variable_and_add_substeps-4.png)

## CLUBB

* CLUBB = Cloud Layers Unified By Binormals
* shallow convection & cloud macrophysics
* near surface circulations are slown down due to the friction caused by this process

| variable | Source & sink |
|----------|---------------|
| wind |- Boundary layer turbulence slow down the wind speed within the PBL <br>(see PBL height and wind increment) <br>(normalized wind speed increments are almost the same all over the globe) |
|      |-  surface friction causes decrease in wind speed (opposite to the wind direction)|
| |![U](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/CLUBB_U.png)|
|condensate<br>(rain&snow) | only work as tracers in this process|
| Cloud water| mostly condensation near storm track|
| Q    | - transport due to shallow convection |
|      | - surface evaporation |
|      | - condensation above land due to cooling |
| Temp | - surface: latent & sensible heat flux |
|      | - 850-400 hPa: 30S~30N condensation |
|      | - 850 hPa: entrainment due to cloud top mixing | 

=== "Vertical Integration"
    ![vert int](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_vertical_integral_by_variable_and_add_substeps-5.png)
=== "Zonal Mean"
    ![zonal](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_zonal_by_variable_and_add_substeps-5.png)

## CUDET
=== "Vertical Integration"
    ![vert int](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_vertical_integral_by_variable_and_add_substeps-6.png)
=== "Zonal Mean"
    ![zonal](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_zonal_by_variable_and_add_substeps-6.png)

## CLDMIC

* vigorous condensation: cloud water & cloud ice & Q precipitate to rain or snow
* some rain/snow turns into snow/rain
* some water deposite on ice
* rain evaporates near surface or lower atmosphere
* some snow melts 
* {===formation of rain near surface===} -> haze&fog??? (maybe tapering needed??


=== "Vertical Integration"
    ![vert int](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_vertical_integral_by_variable_and_add_substeps-7.png)
=== "Zonal Mean"
    ![zonal](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_zonal_by_variable_and_add_substeps-7.png)

## AERWETRM
=== "Vertical Integration"
    ![vert int](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_vertical_integral_by_variable_and_add_substeps-8.png)
=== "Zonal Mean"
    ![zonal](https://compy-dtn.pnl.gov/kima320/png_plot/Budget_Analysis/01_global/All_zonal_by_variable_and_add_substeps-8.png)


