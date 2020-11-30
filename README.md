# 4-4multiplier-fpga
## Design Cost
### Total Instance Count
sum(logic cell instances) = (2 * 4 + 2 * 2 + 6 + 24 + 8 + 8) + (11 + 5) = 74
<br>
The sum above is calculated by couting instances in each module in datapath and controller, respectively, and by order of emergence.

### Total Area of Instances
Area associated with each table is shown below:
<br>

| Module | Area (sum(module_count * module_area))| Instances in Top-Level Design |
| ------ | ------------------------------------- | ----------------------------- |
| register_4bit | 4*s1 = 60 | 2 |
| mux_2bit | 2*c1 = 14 | 2 |
| multiplier_2bit | 5*c1 + c2 = 35 + 8 = 43 | 1 |
| adder_minim | 8 * 3 * c1 = 24 * 7 = 168 | 1 |
| register_8bit | 8*s1 = 120 | 1 |
| mux_8bit | 8*c1 = 56 | 1 |
| state_machine | 2 * c1 + 3 * s2 = 14 + 45 = 59 | 1 |
| signal_assigner | 5*c1 + c2 = 35 + 8 = 43 | 1 |
<br>
Calculating the total area required for our top-level design results in the value of 637 area units.