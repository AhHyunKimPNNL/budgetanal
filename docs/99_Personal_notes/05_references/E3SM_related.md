# E3SM related papers

## Rasch et al. (2019, JAMES)
[An Overview of the Atmospheric Component of the Energy Exascale Earth system Model](https://doi.org/10.1029/2019MS001629)

### E3SM$^{\prime}$s Main  Research Areas
1. the water cycle
    - water cycle extremes: e.g., hurricanes, midlatitude cyclones, atmospheric rivers
    - water variability and availability (storms, storm tracks, blocking, snowmelt)
    - sea level rise issues (especially topography associated with Greenland and Antarctic ice sheet)
2. Sea level rise
3. Exploratory studies of the nitrogen and phosphorus on land biogeochemistry (BGC)

### Difference with CAM5.3
* improved treatment of some diabatic process
    - boundary layer turbulences
    - cloud
    - aerosols
    - some stratospheric ozon
    - new tuning & evaluation strategies
* COSP (Bodas-Salcedo et al., 2011) version 1.4
* Thinner surface layer: 100-m-thick -> 20-m-thick
* aerosol-cloud(stratiform and shallow convective cloud) interaction is included when coupled with CLUBB and MAM4.
* Thresuhold size for autoconversion of ice crystals to snow particles: constant --> function of temperature

### Model Configuration
#### resolution
* Horizontal
    - LR(Lower-horizontal resolution): ~100 km
    - HR(High-horizontal reosolution): ~25 km

* Vertical
    - 72 layers (~60km, ~0.1 hPa)
    - surface layer: 20 m thick
    - 15 layers between the surface and 850 hPa
        - better capture thin cloud, sharp gradients at top of BL, rapid changes in process rate (autoconversion, accretion, evaporation, and radiative heating rates) and cloud properties (drop size and rain rates)
    - 850 hPa ~ 500 hPa: slowly increase from 100 to 500 m
        - water vapor gradients are still very strong compared to important cloud features 
        - variations in water vapor features
        - aerosol plumes that are frequently observed to occur at vertical scales of 500 m and less.
    - free troposphere (above 500 hPa) ~ the lower stratosphere (70 hPa): increased from 1200 to 600 m.
        - for adequate representation of upward propagating large-scale tropical waves (e.g., Kelvin and mixed-Rossby gravity)

#### Dynamical Formulation
* Galerkin spectral finite element method (Dennis et al., 2012; Taylor, Tribbia & Iskandarani, 1997; Taylor & Fournier, 2010)
    - solve the primitive equation on a cubed-sphere grid
* tracer transport: semi-Lagrangian vertical coordinate system (Lin 2004)
* tendencies from dynamics, tracer transport, and physics parameterizations are calculated in time split manner.
    - The subcycling frequency and strategy for communication of information between updates to the model state by physical parameterizations trace constituent transport and fluid dynamics by the dynamical core is {==resolution dependent==}. 
* coupling method: a hybrid physics-dynamics coupling (Lauritzen et al., 2014, Zhang et al., 2018)

#### Physical Process
#### Turbulence, Shallow Convection, and Stratiform Clouds
* Cloud Layers Unified By Binormals (CLUBB) (Golaz et al., 2002; Larson, 2017; Larson & Golaz, 2005; Bogenshutz et al. (2013)
    - a set of probability density function (PDF) of fields
        - shape: Analytic Double Gaussian 1 shape of Larson et al. (2002)
    - based on a higher-order closure to the prognostic equations for higher-order moments
    - prognoses nine subgrid higher-order moments
        - the vertical turbulent fluxes of total water (vapor plus cloud liquid) and liquid water potential temperature (θl);
        - the variances of total water, θl, vertical velocity, zonal velocity, and meridional velocity;
        - the covariance of total water and θl; and the third-order moment of vertical velocity
    - {== CLUBB does not yet incorporate a treatment for ice==}
    - turbulent advection and buoyancy terms are closed by analytic integration over the subgrid PDF.
    - momentum flux: parameterized by downgradient eddy diffusion.
(7416 of the CLUBB svn repository)
* {==CLUBB's turbulent kinetic energy (and corresponding cloud updraft velocities) does not currently depend directly on radiative cooling rates near cloud top and often produce weak estimated subgrid vertical velocities==}

#### Deep convection
* Zhang and McFarlane (1995) (+ Richter and Jochum, 2008; Richter and Rasch, 2008)
* a bulk updraft and downdraft
    - updraft: undergoing entrainment, detrainment, condensation, precipitation
    - downdraft: undergoing entrainment and evaporation
* cloud base mass flux: CAPE at a prescribed (tunable) timescale
* updraft condensate mass: a saturation adjustment (to the liquid saturation vapor pressure along a moist adiabat) followed by conversion to precipiation with a (tunable) adjustment timescale proportionate to the convective updraft mass flux (timescale for land and ocean may differ)
* downdraft coefficient (tunable): 
    - control the mass flux at the downdraft top
    - the evaporation rateof the rainfall driving the downdraft.
* ice thermodynamics are generally neglected.
    - when liqud condensate is detrained from the updraft it is partitioned into liquid and ice over a (tunable) temperature range.
    - the energy associated with a phase change is applied locally to the temperature tendency to conserve energy.
* sensitive to vertical & horizontal resolution. Higher vertical resolution causes:
    - much stronger temperature & moisture gradient in the boundary layer.
    - allow more variation in layer stability, RH, and buoyancy (i.e., updraft plumes may penetrate more layers before reaching their level of neutral buoyancy [LNB])
    - drier free troposphere: because water vapor is confined to the boundary layer, in the absence of processes that mix air to higher altitudes
    - shallower convection due to the stronger gradients (and a drier free troposhere) influencing many meteorological features (radiative heating, altitude of detraining heat, and water substances) and the moisture modes that play a significant role in equatorial wave variability.
* LNB (level of neutral buoyancy) calculation (or cloud top calculation) (Xie et al. 2018):
    - resolution dependent
    - depend strongly on the environment air properties entrained in the updraft (Neal et al. 2008)
    - convection top is sensitive to free troposphere humidity.
    - ^^EAMv1 reduce the resolution dependence by terminating the CAPE calculation when the parcel encounters a single negatively buoyant layer in the plume buoyancy calculation^^.
* optional parameterization of convective gustiness: designed to represent the increase in surface wind produced in the presence of evaporating precipitation (Harrop et al., 2018)
* convective cloud fraction is assumed proportional to the log of the updraft mass flux (Hack et al., 1993)
* detraining convective condensate in partitioned into liquid and ice
    - liquid size: inherits the stratiform cloud at the same location
    - ice size: specified as a tunable parameter  
* tunable parameters:
    - timescale for calculating closure designed to reduce CAPE (essential to determine cloud base mass) 
    - timescale for conversion to precipitation (essential to generate updraft condensate mass via a saturation adjustment)
    - downdraft coefficient: used to control the mass flux at the downdraft top and the evaporation rate of the rainfall driving the downdraft.
    - temperature range that partitioning liquid and ice during the detrainment process due to convective updraft 
    - the lowest possible launch level (maybe buoyancy??): from surface to 100 m
    - entrainment parameter(dmpdx): when this is reduced, depth of the convection is controlled.
    - size of the cloud ice formed from detrainment of convective condensate

#### Aerosol 
* Four-mode version of the Modal Aerosol Module (MAM4; Liu et al., 2016): 1 coarse, 3 fine-particle
* moajor aerosol speies: sulfate, black carbon, primary organic matter, marine organic aerosol (MOA), secondary organic aerosol (SOA), mineral dust, and sea spray
* new representation of MOA (Burrows et al., 2014; Burrows et al., 2018) -> important step towards linking ocean BGC process with the ocean surface chemistry that determines sea spray aerosol formation.
* revise the simplified treatment of SOA (single-lumped-species treatment of SOA) --> by adapting SOA production sources (Shrivastava et al., 2015)
    - explicit treatment of multigenerational gas-pase chemistry of SOA precursor gases and particle-phase transformation of SOA.
* Aging of primary carbon: 8-monolayer (slow ageing; Liu et al. 2016)
* Parallel time-split treatment of H2SO4 production: by gas-phase chemistry and loss by condensation (improve new particle formation process, increases small particle number concentration).
* Include Aerosol wet removal (Wang et al, 2013): convective transport and scavenging of aerosols (with secondary activation in convective updrafts above colud base) (the upper tropospheric and polar region concentration was improved).
* resuspension of aerosol matter from evaporating raindrops: 
    - revised to return particles to the coarse mode (before revision, it return to the originating mode) 
    - modest reduction to aerosol mass and CCN

#### Cloud Microphysics
* Two-moment bulk microphysics parameterization for stratiform clouds (Morrison and Gettelman version 2; Gettelman and Morrison, 2015)
* [8 prognostic variables](https://agupubs.onlinelibrary.wiley.com/doi/10.1029/2019MS001629#jame20932-tbl-0006)
* aerosol-cloud(stratiform and shallow convective cloud) interaction is included when coupled with CLUBB and MAM4.
    - default rate at which liquid is transferred from liquid to ice via the Wegener-Bergeron-Findeison (WBF) process was set unrealistically low.
    - aerosol interaction with deep convective cloud is still neglected.
* stratiform cloud liquid and ice nucleation processes use a characteristic in-cloud updraft velocity that is diagnosed as a function of the turbulent kinetic energy predicted by CLUBB.
    - CLUBB^{\prime}$s turbulent kinetic energy (and corresponding cloud updraft velocities) does not currently depend directly on radiative cooling rates near cloud top and often produce weak estimated subgrid vertical velocities so a (tunable) lower limit of 0.2 m/s was chosen for the subgrid velocity used to activate liquid and ice clouds.
* the lower bound for IN calculation is triggered very frequently (impact is small with 0.3 W/m^2^ changes in global annual mean longwave and shortwave cloud radiative effects)
* liquid cloud drop activation: Abdul-Razzak and Ghan (2000).
* ice nucleation parameterization for heterogeneous ice formation in mixed-phase cloud (Wang et al., 2014)
    - classic nucleation theory(CNT)-based ice nucleation parameterization
    - depends on interstitial and cloud-borne BC & dust aerosol
* Thresuhold size for autoconversion of ice crystals to snow particles: constant --> function of temperature
* Autoconversion parameterization: Khairoutdinov and Kogan (2000)
    - represent self-collection of small liquid drops to form precipitataion size particles
        - the tree parameters developed for that parameterization (and usually treated as fixed inviolate constants) are actually subjected to significant uncertainty depending upon cloud regime (Wood, 2005; Kogan, 2013) and have a very strong impact on aerosol indirect radiative effect( e.g., Wang et al., 2012).
        - these values are mostly fitted using a central values for autoconversion (and accretion)
        - choose the values that reduce radiative biases in regions with low cloud water and droplet number in the regimes other than stratocumulus regions (e.g., trade cumuli) produce less precipitation through autoconversion than the standard KK@000 treatment and are very consistent with Kogan (2013) and Beheng (1994) rates in low aerosol (cloud droplet) regimes.
    - Autoconvertion rate parameters: [Appendix A in this article](https://agupubs.onlinelibrary.wiley.com/doi/10.1029/2019MS001629#jame20932-app-0001)
![EAMv1 vs KK2000](https://agupubs.onlinelibrary.wiley.com/cms/asset/eac03789-6df9-4674-b329-996e9d5dab18/jame20932-fig-0002-m.jpg)
Autoconversion rate (a–c) as a function of cloud water mixing ratio (Qc) at cloud droplet number concentration (Nc) = 20, 100, and 200 cm−3 and (d–f) as a function of Nc at Qc = 0.3, 0.5, and 0.7 g/

* aerosols and light-absorbing particles (e.g., BC and dust) deposition on snow and ice surfaces over land and sea ice + this process is harmonized to treat both external mixing and internal mixing (within hydrometeor) of BC and snow grains (Flanner et al, 2012; Flanner, 2013)
* hygroscopicity for soluble species depends on RH.
* Aerosol mass and number concentrations are merged with a historic inventory of volcanic aerosols wwith an assumed mean radius in the stratosphere.
* Aerosol optical properties for each aerosol mode (Ghan and Zaveri, 2007) 
    - are calculated after merging with historic inventory.
    - optical properties of aerosols are combined using a "homogeneous mixing assumption" by volume to produce estimates of single scattering albedo, extinction, and backscatter by wavelength and then provided to the radiative transfer parameterization.

#### Chemistry
* stratosperic ozone concentration: Hsu and Prather (2009, LINOZ2)
* Linearized production and loss coefficients characterizing sensitivity to local ozone concentration, local temperature, and the ozone column above are used to calculate 
    - stratospheric production
    - loss terms for ozone for each decade of the 1850-2000 time period between 12 and 58 km
    - monthly mean zonal estimates
* Cariolle et al. (1990): a simple parameterization for ozone depletion in the presence of polar stratospheric clouds at cold temperatures in the stratosphere.
    - the rate of exponential decay is a function of the prescribed chlorine loading (ozone holes will only form when chlorine loading is high, and the temperature is cold enough to form polar stratospheric clouds)
    - advected stratospheric ozone mixing ratios are then merged at the tropopause with prescribed monthly mean tropospheric ozone archived from more comprehensive chemical simulations performed with the MOZART chemical transport model as discussed in Neale et al (2010).
    - this merged ozone distribution is then used in the radiative transfer calculation and for oxidation of aerosol precursors.
* Chlorine loading: 
    - changeable
    - advected by dynamics part.

#### Radiative Transfer
* Rapid Radiative Transfer Model for GCM (RRTMG; Iacono et al., 2008; Mlawer et al., 1997)
* Radiative fluxes and heating rate calculation in the clear sky: uses a modified correlated-k method
* Shortwave
    - 14 SW bands (from 0.2 to 12.2 micro meters) 
    - have Extinction optical depth, single scattering albedo, asymmetry properties
    - solar irradiance is specified for the SW bands from the Lean data set (Wang et al. 2005)
* Longwave
    - a mass specific absorbtion is specified
    - 16 bands (from 3.1 to 1000 micro meter)
    - Rayleigh scattering & sources of extinction for H~2~O, O~3~, CO~2~, O~2~, CH~4~, and N~2~O.
    - uses moelcular sources of absorption for the same species + CFC-11 & CFC-12
* cloud properties
    - a single set of in-cloud properties
    - a single cloud fraction for each model cell
    - the composite cloud properties are derived as a complicated function of individual estimates of convective and stratiform (liquid and ice) cloud fraction and condensate properties (mass and number mixing ratios) and assumptions of ice crystal shape using the following recipe.
    - cloud fraction compositing: Park et al (2014)
    - vertical cloud overlap: Neale et al. (2010)
        - maximum vertical overlap is assumed within each of the three regimes representing low (p>700 hPa), middle (400 hPa < p < 700 hPa), and high (p < 400 hPa) clouds.
        - random vertical overlap is assumed between these three regimes
    - liquid cloud drop optic: Wiscombe (1996)
    - ice cloud optics: Mitchell (2002): extended to allow for radiatively active falling snow.
    - process for cloud
        1. A subcolumn decomposition of cloud overlap and fraction generates a set of subcolumns in which cloud is either 1 or 0 in each layer. 
        2. these composited cloud and aerosol properties for each subcolumn are in turn passed to RRTMG along with concentrations of radiatively active gases.
        3. the MonteCarlo Independent Column Approximation (Pincus, Baker & Morcrette, 2003) that represents subgrid-scale cloud variability is used to calculate the heating rates and fluxes in each subcolumn for specific spectral bands; averaging each subcolumn^{\prime}$s radiative heating rate over time and subcolumn provides an estimate o f grid mean radiative heating rate.

#### Gravity Waves
* Richter et al. (2010)
* orographic mountain waves (McFarlane. 1987)
    - launched from the layer nearest the surface
    - obstacle heights are determined from root-mean-square deviations of unresolved topography. (Lauritzen et al)
        - source files are downscaled 
        - 16 iteration of the discrete HOMME second-order Laplacian operator are applied by running the dynamical core in a special mode.
        - topography is smoother in CAM-SE than CAM-FV: CAM-SE does not have a good pressure gradient fixer
    - average flow properties are estimated in a "source layer" extending from the model surface to an obstacle peak height based on the RMS deviation of unresolved topography.
    - Isotropic orographic source is assumed (wave amplitudes are independent of source-layer wind direction, but orographic GW wave orientations are assumed to be normal to the source-layer wind.
    - near-surface flow nonlinearities arising from flow splitting (blocking) of downslope winds is not represented (e.g., Lott & Miller, 1997; Scinocca & McFarlane, 2004)
* convective (Beres et al. 2004)
    - produced by oscillating convectivee motion with the deep convective cells
    - launched when deep convection procuded by the ZM parameterization       
    - width and shape: a function of phase speed determined by the depth of deep convective heating (from heating profile from the ZM parameterization)
    - amplitude: the square of the max heating in ZM scaled by a factor
    - obstacle effect is not considered
    - ^^responsible for producing QBO-like fluctuation of the equatorial zonal wind^^, but the amplitude and period were not optimized in the current EAM and the oscillation is currently too strong
* frontal (Charron & Manzini, 2002)
    - produced when the frontogenesis function (by Hoskins, 1982) is found to exceed a specified threshold at 600 hPa
    - lanched at 500 hPa with a prespecified momentum flux amplitude.
    - spectrum is alligned parallel to the wind at the source level (the steering level of fronts)
    - 40 individual waves with phase speeds from U -100 to U +100 m/s are launched
    - The spectrum is Gaussian in shape and centered on the source level wind.
    - critical in reversing high-latitude upper-stratospheric and mesospheric jets and are ultimately responsible for producing the mesopause temperature reversal in models.
    - the top boundary condition for GW is set so the momentum flux goes out at the model top
    - ^^important in the momentum budget above 40 km in the Northern Hemisphere and above 50 km in the Southern Hemisphere^^.

### Tuning strategy
* brute force strategy: 2-10 year simulations and subjective evaluations of dozens of climate diagnostics
* higher resolution tuning
    1. Xie et al. (2012) and Ma et al. (2018): two frameworks using short simulations were used as an interal part of model development 
        - model biases related to fast physical processes in short-term hindcast resemble those from long-term climate simulations
    2. A hindcasting methodology identified with Transpose-AMIP & Cloud-Associated Parameterization Testbed (Phillips et al., 2004; Williams et al., 2013)
        - assess candidate physical parameterizations and tune the computationally expensive high-resolution EAM configuration following protocols described in previous studies (Boyle & Klein, 2010; ...)
    3. Wan et al., (2014) and Qian et al. (2015): a protocol for using perturbed parameters ensembles of 3-day simulations to reveal model sensitivities to parameter changes that provide insight similar to that found in longer, multiyear simulation
    4. Qian et al. (2018): identify simulation sensitivity to 18 uncertain parameters related to convection, turbulence, cloud microphysics, and orographic GW drag.
* The resolution-dependent tuning parameter: see [Appendix A](https://agupubs.onlinelibrary.wiley.com/doi/10.1029/2019MS001629#jame20932-app-0001) of this article


### Model Evaluation
* SST is prescribed. (see Golaz et al. (2018) for ocean-coupled simulation results)


## Xie et al. (2018)
[Understanding Cloud and Convective Characteristics in Version 1 of the E3SM Atmosphere Model](https://doi.org/10.1029/2018MS001350)

* summary for CLUBB
    - CLUBB: a simplified third-order turbulence parameterization Cloud Layers Unified By Binormals
        - unified treatment of boundary layer turbulence, shallow convection, and cloud macrophysics
        - leads to a reduction in subtropical coast stratocumulus cloud -> improved by increasing vertical resolution
        - an assumed joint subgrid probability density function (PDF): provides flexibility in the representing a variety of turbulent and cloud regemes.
        - paired with ZM deep convection scheme (Zhang and McFarlane, 1995)
    - increase in vertical resolution
        - underestimate high clouds over the tropical warm pool: due to the selection for numerical stability of a higher air parcel launch level in the deep convection scheme.
        - considerable degradation in cloud and precipitation fields without retuning.
            - weaker tropical and subtropical SCRE & LCRE
            - stronger precipitation in the ICTZ


* Remaining problems in EAMv1
    - underestimation of stratocumulus near the west coasts of major continents in the subtropics
    - the substantially reduced high clouds over the tropical warm pool (TWP)
    - other notable regional changes in cloud and precipitation.

### CLUBB
* CLUBB: Cloud Layer Unified By Binormals ( Turbulence(boundary layer), Shallow Convection, and Cloud Macrophysics.)
* PDF
    - Third-order (temperature, moisture, and vertical velocity) assumed PDF
    - shape: Gaussian shape (stratocumulus & cumulus clouds to be represented with a single PDF) (Bogenschutz et al., 2010; Larson et al., 2002)
    - the skewness of temperature and moisture is assumed to be proportional to the skewness of vertical velocity to reduce the computational cost.
    - the widths and skewness of the PDF are determined  by the higher-order moments predicted by CLUBB.
    - calculation of cloud fraction and cloud water mixing ration using PDF is {==limited to liquid clouds==} 
* Ice cloud fraction continues to be determined using a RH based scheme (Gettlman et al., 2010)
    - threshold for ice cloud formation: RHw/RHi > 100% (rhmaxi, tunable)
* tunable parameters: for the pressure correlation, dissipation, and skewness closure that appear in CLUBB^{\prime}$s predictive equations.

* vertical layer
    - importance of higher top: to capture important atmospheric features such as
        - troposphere & stratosphere: Quasi Biennial Oscillation, Sudden Stratospheric Warming, Southern Annular Mode
        - Stratospheric interaction: affect the mean state and inerannual variability of the tropospheric climate.
    - PBL
        - better capture the gradient in the geophysical field near inversion
        - accurate depiction of resolved-scale thermodynamics that spawns complicated interaction between 
            - land-surface flux
            - turbulence mixing
            - cloud microphysics (surface-to-troposphere water vapor gradients, cloud vertical extent, etc)
            - radiation


![EAM vertical layer](https://agupubs.onlinelibrary.wiley.com/cms/asset/7ef1d350-d2fe-4793-9a4b-933548828edc/jame20776-fig-0001-m.png)



* General performance
    - CLUBB led to a more realistic transition from stratocumulus to trade wind cumulus regions in the subtropical oceans (Bogenschutz et al., 2013)
    - LWCF: -4 W m^-2^ compared to observation
        - most severe in tropics: shallower deep convection depth --> lead to 
            - reduce stratiform high clouds due to weaker detrainment from the reduced convective peneration.
            - dry biases in the tropical middle and upper troposphere
    - SWCF: 5 W m^-2^ (with CLUBB) 8 m^-2^ (without CLUBB)
    - precipitation: excessive compared to observations.

### Model tuning
* vertical resolution
    - tuning parameter
        - entrainment (^^dmpdz^^): reduced (to increase the peneration depth of deep convection) 
        - convective precipitation efficiency (^^c0_ocn^^, ^^c0_lnd^^): reduced (due to excessive precipitation)
            - reduce convective precipitation
            - allow more condensate in the convective clouds & detrainment from  convection
        - areal extent of convective updraft (^^dp1^^): reduced
            - increase high cloud
            - reduce LWCF biases
            - cause underproduction of low- and middle level cloud in convectively active region
        - ice sedimentation rate (^^ice_sed_ai^^): smaller
        - detrainment ice particle size (^^re_ice_deep^^): smaller
            - remain in the atmosphere longer (increase high cloud lifetime & brighter cloud)
        - upper bound threshold RH for max. ice cloud fraction (^^rhmaxi^^): reduced
            - increase high-level cloud amount, reduce LWCF negative bias
        - threshold size of Aitken-mode sulfate aerosols for IN (^^so4_sz_thresh_icenuc^^):reduced
            - increase high-level cloud amount, reduce LWCF negative bias
    - sensitive areas
        - precipitation bias: Amazon & Tropical warm pool (TWP)
        - SWCF: stratocumulus region (eastern ocean basins)
        - surface wind stress bias: tropics & Southern Ocean (SO)

| Tuned parameter | Brief description| EAMv0   | EAMv1L          |
|-----------------|------------------|---------|-----------------|
| Deep convection |                  |         |                 |
| dmpdz           | Convective parcel fractional entrainment rate for updrafts     | −1.0e−3 | −0.7e−3 (−)     |
| C0_ocn          | Autoconversion parameter for deep convective clouds over ocean | 0.0035  | 0.007 (−)       |
| C0_lnd          | Autoconversion parameter for deep convective clouds over land  | 0.009   | 0.007 (−)       |
| Ke              | Convective rain evaporation                                    | 1.0e−6  | 1.5e−6 (+)      |
| Tiedke_add      | Perturbation added to the parcel buoyancy in ZM scheme         | 0.5     | 0.8             |
| capeten         | Capeten is the number of tentative CAPE computed—one for each neutral buoyancy crossing—to find the maximum cape of updraft plume for use in the ZM convective scheme. | 0.1e−6  | 0.075e−6        |
| liftlevel       | The lowest possible launch level above the models bottom level| 0.1e−6  | 0.075e−6        |
| Cloud macrophysics|                |         |                 |
| dp1             | Convective cloud fraction coefficient that controls the size of ensemble convective plume | 0.025   | 0.045 (−)       |
| rhmaxi          | Threshold RH with respect to ice for ice cloud fraction to equal to 1.0 | 1.10    | 1.05            |
| Re_ice_deep     | Convective ice cloud effective radius                          | 25e−6   | 16e−6           |
| Cloud microphysics |             |         |                 |
| Micro_mg_dcs    | Autoconversion size threshold for cloud ice to snow| 600e−6  | T dependent (−) |
| Ice_sed_ai      | Fall speed parameter for cloud ice                             | 700     | 500             |
| Aerosols        ||         |                 |
| so4_sz_thresh_icenuc| Aitken mode sulfate aerosol size threshold for homogeneous ice nucleation| 0.1e−6  | 0.075e−6        |
| *** CLUBB parameters not available in EAMv0 but require tuning from EAMv0_CL72 to EAMv1L | |         |                 |
| C1              | Constant associated with the dissipation of $\overline{ w^{\prime 2} }$        | 1.0     | 1.335           |
| C2rt            | Constant associated with the dissipation of total water mixing ratio| 1.0     | 1.75            |
| C8              | Constant associated with the damping of $\overline{ w^{\prime 3} }$ used in CLUBB | 4.2     | 4.3 (+)         |
| C14             | Constant in Newtonian damping of $\overline{ u^{\prime 2} }$ and $\overline{ v^{\prime 2} }$ used in CLUBB | 1.0     | 1.3 (+)         |
| C_k10           | Momentum diffusion factor                                       | 0.6     | 0.3             |


* horizontal resolution
    - use short-hindcast simulation (Ma et al., 2014; Xie et al., 2012)
    - similar parameters that were used in increasing vertical resolution are used.
    - additionally tuned parameters
        - convective ice cloud particle size & Aitken mode sulfate aerosol size threshold: more reduced.
        - C1, C8, C14: fine-tune the clouds and SWCF over the stratocumulus regimes in order to offset the negative effect due to the other tuning

| Tuned parameter      | Brief description                                                                                | EAMv1L   | EAMv1H      |
|----------------------|--------------------------------------------------------------------------------------------------|----------|-------------|
| Deep convection      |                                                                                                  |          |             |
| dmpdz                | Convective parcel fractional entrainment rate for updrafts                                       | −0.7e−3  | −0.2e−3 (−) |
| C0_ocn               | Autoconversion parameter for deep convective clouds over ocean                                   | 0.007    | 0.0035 (−)  |
| C0_lnd               | Autoconversion parameter for deep convective clouds over land                                    | 0.007    | 0.0043 (−)  |
| ke                   | Convective rain evaporation                                                                      | 1.5e−6   | 6e−6 (+)    |
| alfa                 | Maximum convective downdraft mass flux fraction that controls the strength of downdraft ensemble | 0.1      | 0.2 (+)     |
| Cloud macrophysics   |                                                                                                  |          |             |
| dp1                  | Convective cloud fraction coefficient that control the size of ensemble convective plume         | 0.045    | 0.039 (−)   |
| Re_ice_deep          | Convective ice cloud effective radius                                                            | 16e−6    | 12e−6 (−)   |
| CLUBB (turbulence)   |                                                                                                  |          |             |
| C1                   | Constant associated with the dissipation of $\overline{ w^{\prime 2} }$                          | 1.335    | 1.50 (+)    |
| C8                   | Constant associated with the damping of $\overline{ w^{\prime 3} }$ used in CLUBB                | 4.3      | 4.73 (+)    |
| C14                  | Constant in Newtonian damping of $\overline{ u^{\prime 2} }$ and $\overline{ v^{\prime 2} }$  used in CLUBB                    | 1.3      | 1.75 (+)    |
| Aerosols             |                                                                                                  |          |             |
| dust_emis_fact       | Dust emission parameter                                                                          | 2.05     | 2.50 (+)    |
| so4_sz_thresh_icenuc | Aitken mode sulfate aerosol size threshold for homogeneous ice nucleation                        | 0.075e−6 | 0.05e−6 (−) |


* large model sensitivity in deep convection regime to the increase of vertical resolution indicatees the poor scale awareness of the ZM scheme. (originally designed to work at a scale of 100 km or larger)
    - related properties: the level of the air parcel launch (liftlevel), free convection, melting, neutral buoyancy


### Results
* Cloud
    * CLUBB led to a more realistic transition from stratocumulus to trade wind cumulus regions in the subtropical oceans in CAM5 (Bogenschutz et al., 2013) and also in EAMv1L.
    * substantial decrease in Sc near the coasts in EAMv1:
        - might be due to the narrow area of low vertical velocity skewness in CLUBB and the annual mean skewness is too high
        - near Peru/Chile and Calinornian coast
    * increase of low clouds: 
        - especially in the trade cumulus regions due to a better representation of the boundary layer structure.(see Figure2 and Figure4 in this article)
    * problems with tuning
        - tuning of parameter to balance the TOA radiative budget reduces low clouds: {==due to competition & interaction between shallow and deep convection==}
        - dp1 reduction: lead to a large reduction of clouds in the low and middle levels ( cloud below 4 km)
    * {==adjusting parameters such as CAPE (capeten) and the air parcel launch level (liftlevel) due to increase in vertical resolution affect Sc and Cu transition==}.

    * ![Figure2](https://agupubs.onlinelibrary.wiley.com/cms/asset/c50c3b91-50a6-4a7c-9d67-bf3bc5d03af5/jame20776-fig-0002-m.png)
    * ![Figure4](https://agupubs.onlinelibrary.wiley.com/cms/asset/af82cf35-8da6-4bdd-9b4a-365c218e447a/jame20776-fig-0004-m.png)

    * reduction of high level cloud (drier free troposphere) --> due to high vertical resolution
        - water vapor is more easily confined to the surface and boundary layer.
        - excessive ice cloud and insufficient liquid cloud have been an outstanding issue in CAM5 (Kay et al., 2016; Xie et al., 2013).
        - IWP simulated by EAMv1L (11.64 g m^-2^) is significantly smaller than that produced by EAMv0 (31.70 g m^-2^) due to {==change of the ice-to-snow autoconversion scheme==}.
        - substantially weaker LWCF over the TWP due to less high cloud cover.

* Precipitation
    * excessive precipiation over large portions of the tropic, Arabian Sea, Pacific ITCZ, the subtropical oceans, Nortwestern Indian Ocean and Africa.
    * less precipitation over Amazon, TWP, and South China Sea. (mostly due to tuning)

* Temperature & Moisture
    * cold biases in the upper troposphere in the tropical and subtropical regions
    * moistures are trapped in the lower levels, drier mid/upper troposphere.

* Impact of tuning parameter "capeten" and Air Parcel Launch Level in ZM
    * capeten: the number of negative buoyancy layers that deep convection can penetrate.
    * adjustment leads to:
        - overall: negative on high clouds & tropical precipitation
        - increase in low clouds in the Sc/Cu transition region
        - decrease of low clouds along the equatorial deep convection region (reduction up to 15%)
        - tropical convection is substantially suppressed over the TWP & Eastern Pacific warm pool off the central Americal coast (reduced high cloud & LWCF)
        - enhanced precipitation and high clod over tropical lands & adjacent oceans (increase in LWCF)
        - significant cloud reduction above 6 km is due to the higher cloud launch level.


* Summary
    * Overall improvement in comparison with EAMv0
        1) cloud products
            - increased stratocumulus (except near the coasts) and trade-wind cumulus
            - better transition from Sc to Cu
        2) reduced biases in LWCF, especially over tropical land and adjacent ocean
        3) notably improved precipitation over the oceans adjacent to the indian peninsula and tropical eastern Indian ocean.
    * remaining problems due to CLUBB, MG2:
        - dry biases over the Amazon region
        - substantial reduction of Sc off the west coast of major continents in the subtropics
        - largely reduced high clouds over TWP
        - lack of low and middle level clouds over deep convection regions
        - dry bias in TWP and South East Asia.
        - {==CLUBB led to an initial reduction of stratocumulus clouds==}
    * Impact of increasing vertical resolution
        - large reduction of high cloud over tropical deep convection regimes (weaker LWCF over TWP)
        - excessive precipitation in the tropics
        - increase of Sc off the west coasts of Nort and South America
        - But, tuning parameter leads to an overall increase of high clouds and reduction of low and middle clouds in the tropical region
    * Impact of increasing horizontal resolution
        - decrease in cloud and precipitation field (weaker SWCF and LWCF) in the tropical and subtropical regions
        - stronger precipitation in ITCZ
        - But, tuning parameter leads to improve clouds and precipitation, including notable increase of Sc.
    * ZM tuning (capeten & liftlevel)
        - supresses deep convection over tropical oceans and enhances over lands.
        - reduce high clouds and tropical precipitation
     

!!! note

    output from the MISR simulator (Marchand& Ackerman, 2010) is to facilitate model-observation comparison of low-level clouds, as MISR provides the most accurate retrievals of cloud top heignts for low-level clouds among the available satellite cloud simulators contained in the Cloud Feedback Model Intercomparison Project Observaion Simulator Package (Bodas-Salcedo et al., 2011; Kay et al., 2012) 



!!! note

    MG2 only plays a minor role in influencing low cloud amount





