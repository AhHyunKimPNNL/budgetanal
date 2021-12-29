# EAMv1 Water Budget Analysis page
* since Dec. 27, 2021.
* url: https://github.com/AhHyunKimPNNL/budgetanal

## Flowchart for time integration in EAM

![flowchart](img/coupling_diagram_EAMv1.png)

The following documents provide partial descriptions:
  - Section 2.1 in https://doi.org/10.5194/gmd-14-1921-2021

## Main Checkpoints in CondiDiag

* CondiDiag GMD URL: https://gmd.copernicus.org/preprints/gmd-2021-331/


### Dynamical core

| long name                                                   | short name | etc.             |
|-------------------------------------------------------------|------------|------------------|
| Dynamical core and large-scale transport                    | DYNEND     |                  |

### Before coupler

| long name                                                   | short name | etc.             |
|-------------------------------------------------------------|------------|------------------|
| Mass and energy fixers                                      | PBCINI     |                  |
| Dry adiabatic adjustment                                    | DRYADJ     |                  |
| Deep convection                                             | DEEPCU     |                  |
| Shallow convection (EAMv0   only)                           | SHCU       |                  |
| CARMA cloud microphysics                                    | CARMA      |                  |
| Stratiform cloud macrophysics,   sub-step xx                | CLDMACxx   |                  |
| Aerosol activation and mixing,   sub-step xx                | CLDAERxx   |                  |
| Stratiform cloud microphysics,   sub-step xx                | CLDMICxx   |                  |
| Ice saturation adjustment,   sub-step xx                    | ICEMACxx   | “clubb_tend_cam” |
| CLUBB, sub-step xx                                          | CLUBBxx    | “clubb_tend_cam” |
| Convective detrainment,   sub-step xx                       | CUDETxx    | “clubb_tend_cam” |
| Miscellaneous diagnostics,   sub-step xx                    | MACDIAGxx  | “clubb_tend_cam” |
| Stratiform clouds, all   substeps                           | STCLD      |                  |
| Aerosol wet removal and   resuspension                      | AERWETRM   |                  |
| Miscellaneous diagnostics and   output                      | PBCDIAG    |                  |
| Radiative transfer                                          | RAD        | Beginning of timestep |
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

## Simulation Settings
* ** Code branch**:huiwanpnnl/maint-1.0_cnd_diag1.1
* ** Computing platform**: compy
* ** Configurations:**
     * compset: FC5AV1C-L
     * resolution: ne30_ne30
     * RUN_STARTDATE: 2009-10-01
     * simulation length: 1 month
     * output: monthly average

## CondiDiag Settings
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


## History output options
``` py
 history_amwg        = .false.
 history_aero_optics = .false.
 history_aerosol     = .false.
 
fincl1 = 'PRECC','PRECL','PRECSC','PRECSL','QFLX','PRECCZM0',
         'MPDW2V','MPDW2I','MPDW2P','MPDI2V','MPDI2W','MPDI2P',
```


<br><br><br><br><br>

---------------------------



## How to use mkdocs
* webstie: https://www.mkdocs.org/

### commands
* `pip install mkdocs` - install mkdocs
* `mkdocs new [dir-name]` - Create a new project.
* `mkdocs serve` - Start the live-reloading docs server.
    * --dev-addr=IP:PORT - setup test page ip & port
* `mkdocs build` - Build the documentation site.
* `mkdocs -h` - Print help message and exit.
* `mkdocs gh-deploy` - publish mkdocs using github

### Settings in mkdocs.yml file
* `site_name: [name of the website]` - setup name of the website
* `theme: readthedocs` - setup themes (default: Bootstrap)

