# EAMv1 Water Budget Analysis page
* since Dec. 27, 2021.
* URL: https://github.com/AhHyunKimPNNL/budgetanal

## Flowchart for time integration in EAM

![flowchart](img/coupling_diagram_EAMv1.png)

The following documents provide partial descriptions:
  - Section 2.1 in https://doi.org/10.5194/gmd-14-1921-2021

## Main Checkpoints in CondiDiag

* CondiDiag GMD URL: https://gmd.copernicus.org/preprints/gmd-2021-331/


### Dynamical core

| long name                                                   | short name | etc.             |
|-------------------------------------------------------------|------------|------------------|
| Dynamical core and large-scale transport                    | DYNEND     |primitive equations using a continuous Galerkin spectral-element method for horizontal discretization on a cubed-sphere mesh (Dennis et al., 2012; Taylor et al., 2009)|

### Before coupler

| long name                                                   | short name | etc.             | References |
|-------------------------------------------------------------|------------|------------------|------------|
| Mass and energy fixers                                      | PBCINI     |                  |
| Dry adiabatic adjustment                                    | DRYADJ     |                  |
| Deep convection                                             | DEEPCU     |                  |deep convection (Zhang and McFarlane, 1995; Richter and Rasch, 2008; Neale et al., 2008)|
| Shallow convection (EAMv0   only)                           | SHCU       |                  |
| CARMA cloud microphysics                                    | CARMA      |                  |
| Stratiform cloud macrophysics,   sub-step xx                | CLDMACxx   |                  |
| Aerosol activation and mixing,   sub-step xx                | CLDAERxx   |                  |
| Stratiform cloud microphysics,   sub-step xx                | CLDMICxx   |                  |Gettelman and Morrison (2015)|
| Ice saturation adjustment,   sub-step xx                    | ICEMACxx   | “clubb_tend_cam” |
| CLUBB, sub-step xx                                          | CLUBBxx    | “clubb_tend_cam” | (Cloud Layers Unified By Binormals, Golaz et al., 2002; Larson et al., 2002; Larson and Golaz, 2005; Larson, 2017).|
| Convective detrainment,   sub-step xx                       | CUDETxx    | “clubb_tend_cam” |
| Miscellaneous diagnostics,   sub-step xx                    | MACDIAGxx  | “clubb_tend_cam” |
| Stratiform clouds, all   substeps                           | STCLD      |                  |
| Aerosol wet removal and   resuspension                      | AERWETRM   |                  |aerosol life cycle and aerosol–cloud interactions (Liu et al., 2016; Wang et al., 2020)|
| Miscellaneous diagnostics and   output                      | PBCDIAG    |                  |
| Radiative transfer                                          | RAD        | Beginning of timestep | solar and terrestrial radiation (Mlawer et al., 1997; Iacono et al., 2008)|
| Tropopause diagnosis; export   state preparation and output | PBCEND     |                  |

### MCT coupler

| long name                                  | short name | etc. |
|--------------------------------------------|------------|------|
| Couling to surface models                  | MCTCPL     |      |
| Emissions of chemical species              | CHEMEMIS   |      |

### After coupler

| long name                                                                    | short name | etc. |
|------------------------------------------------------------------------------|------------|------|
| Tracer   mass fixers                                                         | PACINI     |      |
| Chemistry and aerosol   microphysics                                         | CHEM       |      |
| Obukov   length and friction velocity;      Application of surface emissions | CFLXAPP    |      |
| Rayleigh friction                                                            | RAYLEIGH   |      |
| Aerosol dry deposition                                                       | AERDRYRM   |      |
| Gravity wave drag                                                            | GWDRAG     |      |
| QBO relaxation and ION drag                                                  | IONDRAG    |      |
| Application of nudging                                                       | NDG        |      |
| Dry-to-wet mixing ratio   conversion                                         | DRYWET     |      |
| Various diagnostics                                                          | PACEND     |      |


<details> <summary> References </summary>
<br> Dennis, J. M., Edwards, J., Evans, K. J., Guba, O., Lauritzen, P. H., Mirin, A. A., St-Cyr, A., Taylor, M. A., and Worley, P. H.: CAM- SE: A scalable spectral element dynamical core for the Commu- nity Atmosphere Model, Int. J. High Perform., 26, 74–89, 2012.
<br> 
<br>Gettelman, A. and Morrison, H.: Advanced two-moment bulk microphysics for global models, Part I: Off-line tests and comparison with other schemes, J. Climate, 28, 1268–1287, https://doi.org/10.1175/JCLI-D-14-00102.1, 2015.
<br>
<br>Golaz, J.-C., Larson, V., and Cotton, W.: A PDF-Based Model for Boundary Layer Clouds. Part I: Method and Model Description, J. Atmos. Sci., 59, 3540–3551, https://doi.org/10.1175/1520- 0469(2002)059<3540:APBMFB>2.0.CO;2, 2002.
<br>
<br>Iacono, M. J., Delamere, J. S., Mlawer, E. J., Shephard, M. W., Clough, S. A., and Collins, W. D.: Radiative forcing by long–lived greenhouse gases: Calculations with the AER ra- diative transfer models, J. Geophys. Res., 113, D13103, https://doi.org/10.1029/2008JD009944, 2008.
<br>
<br>Larson, V. E.: CLUBB-SILHS: A parameterization of subgrid variability in the atmosphere, arXiv preprint arXiv:1711.03675v3, 2017.
<br>
<br>Larson, V. E.: CLUBB-SILHS: A parameterization of subgrid variability in the atmosphere, arXiv preprint arXiv:1711.03675v3, 2017. Larson, V. E. and Golaz, J.-C.: Using Probability Density Functions to Derive Consistent Closure Relationships among Higher-Order Moments, Monthly Weather Review, 133, 1023–1042, https://doi.org/10.1175/MWR2902.1, 2005.
<br>
<br>Larson, V. E., Golaz, J.-C., and Cotton, W. R.: Small-Scale and Mesoscale Variability in Cloudy Boundary Layers: Joint Probability Density Functions, Journal of the Atmospheric Sciences, 59, 3519–3539, https://doi.org/10.1175/1520-0469(2002)059<3519:SSAMVI>2.0.CO;2, 2002.
<br>
<br>Liu, X., Easter, R. C., Ghan, S. J., Zaveri, R., Rasch, P., Shi, X., Lamarque, J.-F., Gettelman, A., Morrison, H., Vitt, F., Conley, A., Park, S., Neale, R., Hannay, C., Ekman, A. M. L., Hess, P., Mahowald, N., Collins, W., Iacono, M. J., Bretherton, C. S., Flanner, M. G., and Mitchell, D.: Toward a minimal representation of aerosols in climate models: description and evaluation in the Community Atmosphere Model CAM5, Geoscientific Model Development, 5, 709–739, https://doi.org/10.5194/gmd-5-709-2012, 2012.
<br>
<br>Mlawer, E. J., Taubman, S. J., Brown, P. D., Iacono, M. J., and Clough, S. A.: Radiative transfer for inhomoge- neous atmospheres: RRTM, a validated correlated?k model for the longwave, J. Geophys. Res., 102, 16663–16682, https://doi.org/10.1029/97JD00237, 1997.
<br>
<br>Neale, R. B., Richter, J. H., and Jochum, M.: The impact of convec- tion on ENSO: From a delayed oscillator to a series of events, J. Climate, 21, 5904–5924, 2008.
<br>
<br>Richter, J. H. and Rasch, P. J.: Effects of Convective Momen- tum Transport on the Atmospheric Circulation in the Commu- nity Atmosphere Model, Version 3, J. Climate, 21, 1487–1499, https://doi.org/10.5194/gmd-10-2221-2017, 2008.
<br>
<br>Taylor, M. A., Cyr, A. S., and Fournier, A.: A Non-oscillatory Advection Operator for the Compatible Spectral Element Method„ International Conference on Computational Science, Springer, Berlin, Heidelberg, https://doi.org/10.1007/978-3-642- 01973-9_31, 2009.
<br>
<br>Wang, H., Easter, R. C., Zhang, R., Ma, P.-L., Singh, B., Zhang, K., Ganguly, D., Rasch, P. J., Burrows, S. M., Ghan, S. J., Lou, S., Qian, Y., Yang, Y., Feng, Y., Flanner, M., Leung, R. L., Liu, X., Shrivastava, M., Sun, J., Tang, Q., Xie, S., and Yoon, J.- H.: Aerosols in the E3SM Version 1: New Developments and Their Impacts on Radiative Forcing, J. Adv. Model. Earth Sy., 12, e2019MS001851, https://doi.org/10.1029/2019MS001851, 2020.
<br>
<br>Zhang, G. J. and McFarlane, N. A.: Sensitivity of climate simula- tions to the parameterization of cumulus convection in the Cana- dian Climate Centre general circulation model, Atmos. Ocean, 33, 407–446, https://doi.org/10.1080/07055900.1995.9649539, 1995.
</details>


## Simulation Settings
* ** Code branch**:huiwanpnnl/maint-1.0_cnd_diag1.1
* ** Computing platform**: compy
* ** Configurations:**
     * compset: FC5AV1C-L
     * resolution: ne30_ne30
     * RUN_STARTDATE: 2009-10-01
     * simulation length: 1 month
     * output: monthly average

### CondiDiag Settings
* CondiDiag GMD URL: https://gmd.copernicus.org/preprints/gmd-2021-331/
* Conditional sampling option
``` py
metric_name = ’ALL’
```
* Checkpoint options
``` py
qoi_chkpt   = 'AERWETRM','RAD','PACEND','DYNEND','DRYADJ','DEEPCU',
              'CLUBB01','CUDET01','CLDMIC01',
              'CLUBB02','CUDET02','CLDMIC02',
              'CLUBB03','CUDET03','CLDMIC03',
              'CLUBB04','CUDET04','CLDMIC04',
              'CLUBB05','CUDET05','CLDMIC05',
              'CLUBB06','CUDET06','CLDMIC06',
```
* Quantity of interest (QoI) options
``` py
qoi_name = 'T','T','Q','Q',"U","U","V","V","RHW","RHW","RHI","RHI",'CLDLIQ','CLDLIQ','CLDICE','CLDICE','RAINQM','RAINQM','SNOWQM','SNOWQM',
qoi_nver =  72, 72, 72, 72, 72, 72, 72, 72,   72,   72,   72,   72,      72,      72,      72,      72,      72,      72,      72,      72,
qoi_x_dp =   0,  1,  0,  1,  0,  1,  0,  1,    0,    1,    0,    1,       0,       1,       0,       1,       0,       1,       0,       1,
```


### History output options
``` py
 history_amwg        = .false.
 history_aero_optics = .false.
 history_aerosol     = .false.
 
fincl1 = 'PRECC','PRECL','PRECSC','PRECSL','QFLX','PRECCZM0',
         'MPDW2V','MPDW2I','MPDW2P','MPDI2V','MPDI2W','MPDI2P',
```



