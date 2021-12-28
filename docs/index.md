# EAMv1 Water Budget Analysis page
* since Dec. 27, 2021.
* url: https://github.com/AhHyunKimPNNL/budgetanal

## Simulation Settings
* ** Code branch**:huiwanpnnl/maint-1.0_cnd_diag1.1
* ** Computing platform**: compy
* ** Configurations:**
     * compset: FC5AV1C-L
     * resolution: ne30_ne30
     * RUN_STARTDATE: 2009-10-01
     * simulation length: 1 month
     * output: average

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
* `mkdocs build` - Build the documentation site.
* `mkdocs -h` - Print help message and exit.
* `mkdocs gh-deploy` - publish mkdocs using github

### Settings in mkdocs.yml file
* `site_name: [name of the website]` - setup name of the website
* `theme: readthedocs` - setup themes (default: Bootstrap)

