# Variable Increments by Checkpoint: Global view

* need to check 
   * [ ] chkpt RAD: source of at 850 hPa cooling
   * [ ] chkpt DYNEND: source of surface cooling
   * [ ] chkpt DEEPCU: source of 500 hPa heating

## By checkpoints

### RAD

* changes are mostly due to cloud longwave cooling
* at 850 hPa: subtropical low-level cloud
    - need to check if the cooling is coming from stratocumulus or storm track  

![vert int](img/01_global/All_vertical_integral_by_variable_and_add_substeps-0.png)
![zonal](img/01_global/All_zonal_by_variable_and_add_substeps-0.png)

### PACEND

* increments are minor

![vert int](img/01_global/All_vertical_integral_by_variable_and_add_substeps-1.png)
![zonal](img/01_global/All_zonal_by_variable_and_add_substeps-1.png)

### DYNEND

* changes are mostly due to transport (momentum & coriolis)
   * vertical / horizontal transport are not yet separated
* Hadley circulation affects cooling in the Equator and warming at the stratocumulus cloud top
* transportation of hydrometeor & water vapor occurs near the surface.
* need to check the source of cooling near the surface

![vert int](img/01_global/All_vertical_integral_by_variable_and_add_substeps-2.png)
![zonal](img/01_global/All_zonal_by_variable_and_add_substeps-2.png)

### DRYADJ

* minor changes

![vert int](img/01_global/All_vertical_integral_by_variable_and_add_substeps-3.png)
![zonal](img/01_global/All_zonal_by_variable_and_add_substeps-3.png)

### DEEPCU

* convective tracer transport & momentum transport is calculated in this process.
* water vapor decreases due to condensation of convective hydrometeors (not shown)
* temperature changes are mostly due to convective heat transportation & condensation
* need to check the source of 500 hPa heating
   * possibly due to detrainment (turbulence?)
* need to check the source of 60S~30S signal
   * is it from tropical cyclone or storm track? why?


![vert int](img/01_global/All_vertical_integral_by_variable_and_add_substeps-4.png)
![zonal](img/01_global/All_zonal_by_variable_and_add_substeps-4.png)

### CLUBB

* shallow convection & 
* near surface circulations are slown down due to the friction caused by this process
* why concentrated near surface??
* U&V
    * Boundary layer turbulence
    * surface friction causes decrease in wind speed (opposite to the wind direction)
* rain&snow: only work as tracers in this process
* Cloud water: mostly condensation near storm track
* Q
    * transport due to shallow convection
    * surface evaporation
    * condensation above land due to cooling
* Temperature
    * surface: latent & sensible heat flux
    * 850-400 hPa: 30S~30N condensation
    * 850 hPa: entrainment due to cloud top mixing 

![vert int](img/01_global/All_vertical_integral_by_variable_and_add_substeps-5.png)
![zonal](img/01_global/All_zonal_by_variable_and_add_substeps-5.png)

### CUDET
![vert int](img/01_global/All_vertical_integral_by_variable_and_add_substeps-6.png)
![zonal](img/01_global/All_zonal_by_variable_and_add_substeps-6.png)

### CLDMIC
![vert int](img/01_global/All_vertical_integral_by_variable_and_add_substeps-7.png)
![zonal](img/01_global/All_zonal_by_variable_and_add_substeps-7.png)

### AERWETRM
![vert int](img/01_global/All_vertical_integral_by_variable_and_add_substeps-8.png)
![zonal](img/01_global/All_zonal_by_variable_and_add_substeps-8.png)


## By variables

### Q

|![vertical profile Q](img/01_global/All_profiles-0.png)|![global mean Q](img/01_global/All_global_mean-0.png)|
|---|---|
|![zonal Q](img/01_global/All_zonal_by_chkpt_and_add_substeps-0.png)|![vert int Q](img/01_global/All_vertical_integral_by_chkpt_and_add_substeps-0.png)|


### T 
|![vertical profile T](img/01_global/All_profiles-1.png)|![global mean T](img/01_global/All_global_mean-1.png)|
|---|---|
|![zonal T](img/01_global/All_zonal_by_chkpt_and_add_substeps-1.png)|![vert int T](img/01_global/All_vertical_integral_by_chkpt_and_add_substeps-1.png)|

### CLDLIQ
* Liquid water content

|![vertical profile CLDLIQ](img/01_global/All_profiles-2.png)|![global mean CLDLIQ](img/01_global/All_global_mean-2.png)|
|---|---|
|![zonal CLDLIQ](img/01_global/All_zonal_by_chkpt_and_add_substeps-2.png)|![vert int CLDLIQ](img/01_global/All_vertical_integral_by_chkpt_and_add_substeps-2.png)|

### CLDICE
* Ice water content

|![vertical profile CLDICE](img/01_global/All_profiles-3.png)|![global mean CLDICE](img/01_global/All_global_mean-333ng)|
|---|---|
|![zonal CLDICE](img/01_global/All_zonal_by_chkpt_and_add_substeps-3.png)|![vert int CLDICE](img/01_global/All_vertical_integral_by_chkpt_and_add_substeps-3.png)|

### RAINQM
* Precipitable water (only large-scale precpitation)

|![vertical profile Rain](img/01_global/All_profiles-4.png)|![global mean Rain](img/01_global/All_global_mean-4.png)|
|---|---|
|![zonal Rain](img/01_global/All_zonal_by_chkpt_and_add_substeps-4.png)|![vert int Rain](img/01_global/All_vertical_integral_by_chkpt_and_add_substeps-4.png)|

### SNOWQM 
* Precipitable ice (only large-scale precpitation)

|![vertical profile Snow](img/01_global/All_profiles-5.png)|![global mean Snow](img/01_global/All_global_mean-5.png)|
|---|---|
|![zonal Snow](img/01_global/All_zonal_by_chkpt_and_add_substeps-5.png)|![vert int Snow](img/01_global/All_vertical_integral_by_chkpt_and_add_substeps-5.png)|

### U
* Zonal wind

|![vertical profile U](img/01_global/All_profiles-6.png)|![global mean U](img/01_global/All_global_mean-6.png)|
|---|---|
|![zonal U](img/01_global/All_zonal_by_chkpt_and_add_substeps-6.png)|![vert int U](img/01_global/All_vertical_integral_by_chkpt_and_add_substeps-6.png)|


### V
* Meridional wind

|![vertical profile V](img/01_global/All_profiles-7.png)|![global mean V](img/01_global/All_global_mean-7.png)|
|---|---|
|![zonal V](img/01_global/All_zonal_by_chkpt_and_add_substeps-7.png)|![vert int V](img/01_global/All_vertical_integral_by_chkpt_and_add_substeps-7.png)|




