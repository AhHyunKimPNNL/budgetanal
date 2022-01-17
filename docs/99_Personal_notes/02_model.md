# Personal notes


## Dynamics & Physics coupling??

[The numerics of physical parametrization](https://www.ecmwf.int/sites/default/files/elibrary/2004/8032-numerics-physical-parameterization.pdf)

## Coupling of Dynamical Core and Parameterization Suite in CAM5

[Link for the documentation](https://ncar.github.io/CAM/doc/build/html/cam5_scientific_guide/pd_coupling.html)

^^The CAM5.0 cleanly separates the parameterization suite from the dynamical core^^, and makes it easier to replace or modify each in isolation. The dynamical core can be coupled to the parameterization suite in a purely time split manner or in a purely process split one, as described below.

Consider the general prediction equation for a generic variable $\psi$,

(1) $\frac{\partial \psi} {\partial t}$ = $D\left(\psi\right)$  + $P\left(\psi\right)$ ;,

- $\psi$: a prognostic variable (e.g., temperature, horizontal wind component)
- D: The dynamical core component
- P: the physical parameterization suite

A three-time-level notation is employed which is appropriate for the semi-implicit Eulerian spectral transform dynamical core. However, the numerical characteristics of the physical parameterizations are more like those of diffusive processes rather than advective ones. They are therefore approximated with forward or backward differences, rather than centered three-time-level forms.

{==The Process Split coupling==} is approximated by

(2) $\psi^{n+1}$ = $\psi^{n-1} + 2\Delta t D(\psi^{n+1},\psi^{n},\psi^{n-1})
                        + 2\Delta t P(\psi^*,\psi^{n-1}) \;,$

where $P(\psi^*,\psi^{n-1})$ is calculated first from

(3)$\psi^* = \psi^{n-1} + 2\Delta t P(\psi^*,\psi^{n-1}) \;.$

{==The Time Split coupling==} is approximated by

(4)$\psi^* = \psi^{n-1} + 2\Delta t D(\psi^*,\psi^{n},\psi^{n-1}) \;,$

(5)$\psi^{n+1} = \psi^* + 2\Delta t P(\psi^{n+1},\psi^*) \;$.

The distinction is that in the Process Split approximation the calculations of D and P are both based on the same past state, $\psi^{n-1}$, ^^while in the Time Split approximations D and P are calculated sequentially^^, each based on the state produced by the other.

As mentioned above, the Eulerian core employs the three-time-level notation in eq. (2)-(5). Eqns. (2)-(5) also apply to two-time-level finite volume, semi-Lagrangian and spectral element (HOMME) cores by dropping centered n term dependencies, and replacing n-1 by n and $2 \Delta t$ by $\Delta t$.


The parameterization package can be applied to produce an updated field as indicated in Eq. (3) and Eq. (5). Thus Eq. (5) can be written with an operator notation

(6)$\psi^{n+1} = {\boldsymbol{P}}\left(\psi^*\right) \;$,

where only the past state is included in the operator dependency for notational convenience. The implicit predicted state dependency is understood. The Process Split equation (2) can also be written in operator notation as

(7)$\psi^{n+1} = {\boldsymbol{D}}\left(\psi^{n-1},
      \frac {{\boldsymbol{P}}(\psi^{n-1})-\psi^{n-1}} {2 \Delta t} \right) \;$,

- $\psi^{n-1}$: the prognostic variable input to the dynamical core
- $\frac {{\boldsymbol{P}}(\psi^{n-1})-\psi^{n-1}} {2 \Delta t} ;$: the forcing rate from the parameterization package (e.g. the heating rate in the thermodynamic equation). 

Again only the past state is included in the operator dependency, with the implicit predicted state dependency left understood. With this notation the Time Split system (4) and (5) can be written

(8)$\psi^{n+1} = {\boldsymbol{P}}\left({\boldsymbol{D}}\left(\psi^{n-1},0\right)\right) \;$.

The total parameterization package in CAM5.0 consists of a sequence of components, indicated by

(9)$P = \{ M,R,S,T \} \;$,

- M: (Moist) precipitation processes
- R: clouds and Radiation
- S: the Surface model
- T: Turbulent mixing. 

Each of these in turn is subdivided into various components: M includes an optional dry adiabatic adjustment (normally applied only in the stratosphere), moist penetrative convection, shallow convection, and large-scale stable condensation; R first calculates the cloud parameterization followed by the radiation parameterization; S provides the surface fluxes obtained from land, ocean and sea ice models, or calculates them based on specified surface conditions such as sea surface temperatures and sea ice distribution. These surface fluxes provide lower flux boundary conditions for the turbulent mixing T which is comprised of the planetary boundary layer parameterization, vertical diffusion, and gravity wave drag.

Defining operators following (6) for each of the parameterization components, the couplings in CAM5.0 are summarized as:

TIME SPLIT

(10)$\psi^{n+1} = {\boldsymbol{T}}\left({\boldsymbol{S}}\left({\boldsymbol{R}}\left({\boldsymbol{M}}\left(
             {\boldsymbol{D}}\left(\psi^{n-1},0\right)\right)\right)\right)\right)$

PROCESS SPLIT

(11)$\psi^{n+1} = {\boldsymbol{D}}\left(\psi^{n-1},\frac {
{\boldsymbol{T}}\left({\boldsymbol{S}}\left({\boldsymbol{R}}\left(
{\boldsymbol{M}}\left(\psi^{n-1}\right)\right)\right)\right) - \psi^{n-1}}
{2\Delta t}\right)$

The labels Time Split and Process Split refer to the coupling of the dynamical core with the complete parameterization suite. The components within the parameterization suite are coupled via time splitting in both forms.

The Process Split form is convenient for spectral transform models. With Time Split approximations extra spectral transforms are required to convert the updated momentum variables provided by the parameterizations to vorticity and divergence for the Eulerian spectral core, or to recalculate the temperature gradient for the semi-Lagrangian spectral core. The Time Split form is convenient for the finite-volume core which adopts a Lagrangian vertical coordinate. Since the scheme is explicit and restricted to small time-steps by its non-advective component, it sub-steps the dynamics multiple times during a longer parameterization time step. With Process Split approximations the forcing terms must be interpolated to an evolving Lagrangian vertical coordinate every sub-step of the dynamical core. Besides the expense involved, it is not completely obvious how to interpolate the parameterized forcing, which can have a vertical grid scale component arising from vertical grid scale clouds, to a different vertical grid. [Wil02] compares simulations with the Eulerian spectral transform dynamical core coupled to the CCM3 parameterization suite via Process Split and Time Split approximations.


[Wil02]	D. L. Williamson. Time-split versus process-split coupling of parameterizations and dynamical core. Mon. Wea. Rev., 130:2024–2041, 2002.


## Horizontal discretization
![Horizontal discretization](https://agupubs.onlinelibrary.wiley.com/cms/asset/bf1ead11-db1c-46b1-bcfd-67804109d477/jame20932-fig-0001-m.png)









