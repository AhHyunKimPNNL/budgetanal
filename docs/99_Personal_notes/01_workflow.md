# Work Flow

## overview
[diagram tutorial](https://squidfunk.github.io/mkdocs-material/reference/diagrams/#using-sequence-diagrams)


1. E3SM
2. SciDAC & time integration
    - see SciDAC homepage
    - read paper again
3. Water budget analysis.
    - Q, T, Cloud water/ice, Rain
    - checkpoints...



``` mermaid
classDiagram
  E3SM -- Dynamics
  E3SM -- Physics
  E3SM -- Coupler
  Dynamics --> Physics
  Physics --> Coupler
  class E3SM{
      
  }
  class Dynamics{
  }
  class Coupler{
  }
  class Physics{
  }
```


