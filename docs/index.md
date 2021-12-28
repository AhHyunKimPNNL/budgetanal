# EAMv1 Water Budget Analysis page
* since Dec. 27, 2021.
* url: https://github.com/AhHyunKimPNNL/budgetanal

## Simulation setup
* ** Code branch**:huiwanpnnl/maint-1.0_cnd_diag1.1
* ** Computing platform**: compy
* ** Configurations:**
     * compset: FC5AV1C-L
     * resolution: ne30_ne30
     * RUN_STARTDATE: 2009-10-01
     * simulation length: 1 month
     * output: average

## CondiDiag Settings
* GMD url: https://gmd.copernicus.org/preprints/gmd-2021-331/
* conditional sampling option
* checkpoint options
* Quantity of interest (QoI) options

## History output options
``` py
import tensorflow as tf
```

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

