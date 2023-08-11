# GAMESS ECP KPP-2 Artifacts

## 10-point MSN Reaction Pathway

Directory: 10-points

This directory contains the inputs and outputs for the GAMESS ECP KPP-2 science challenge problem consisting of 10-points along a representative reaction path on a mesoporous silica nanoparticle (MSN) that includes an amine-containing catalytic group and is surrounded by 4,600 water molecules [13,800 atoms; 46,000 electrons], all within the effective fragment molecular orbital (EFMO) method. Each of the 10 points along the reaction path used 5,430 Frontier nodes.

| Identifier | Filename                                    | Total Wall time (s) | Raw View |
|------------|---------------------------------------------|-------:|------|
| msn-r      | msn-r\_4600water\_efmo\_rimp2.rcut10.log    | 1118.7 |[msn-r](https://raw.githubusercontent.com/gms-bbg/ecp-kpp2/main/10-points/msn-r_4600water_efmo_rimp2.rcut10.log)|
| msn-r1ts   | msn-r1ts\_4600water\_efmo\_rimp2.rcut10.log | 1655.1 |[msn-r1ts](https://raw.githubusercontent.com/gms-bbg/ecp-kpp2/main/10-points/msn-r_4600water_efmo_rimp2.rcut10.log)|
| msn-r2ts   | msn-r2ts\_4600water\_efmo\_rimp2.rcut10.log | 1655.7 |[msn-r2ts](https://raw.githubusercontent.com/gms-bbg/ecp-kpp2/main/10-points/msn-r_4600water_efmo_rimp2.rcut10.log)|
| msn-r3ts   | msn-r3ts\_4600water\_efmo\_rimp2.rcut10.log | 1686.3 |[msn-r3ts](https://raw.githubusercontent.com/gms-bbg/ecp-kpp2/main/10-points/msn-r_4600water_efmo_rimp2.rcut10.log)|
| msn-ts     | msn-ts\_4600water\_efmo\_rimp2.rcut10.log   | 1672.2 |[msn-ts](https://raw.githubusercontent.com/gms-bbg/ecp-kpp2/main/10-points/msn-r_4600water_efmo_rimp2.rcut10.log)|
| msn-ts1p   | msn-ts1p\_4600water\_efmo\_rimp2.rcut10.log | 1687.5 |[msn-ts1p](https://raw.githubusercontent.com/gms-bbg/ecp-kpp2/main/10-points/msn-r_4600water_efmo_rimp2.rcut10.log)|
| msn-ts2p   | msn-ts2p\_4600water\_efmo\_rimp2.rcut10.log | 1667.7 |[msn-ts2p](https://raw.githubusercontent.com/gms-bbg/ecp-kpp2/main/10-points/msn-r_4600water_efmo_rimp2.rcut10.log)|
| msn-ts3p   | msn-ts3p\_4600water\_efmo\_rimp2.rcut10.log | 1664.4 |[msn-ts3p](https://raw.githubusercontent.com/gms-bbg/ecp-kpp2/main/10-points/msn-r_4600water_efmo_rimp2.rcut10.log)|
| msn-ts4p   | msn-ts4p\_4600water\_efmo\_rimp2.rcut10.log | 1692.3 |[msn-ts4p](https://raw.githubusercontent.com/gms-bbg/ecp-kpp2/main/10-points/msn-r_4600water_efmo_rimp2.rcut10.log)|
| msn-p      | msn-p\_4600water\_efmo\_rimp2.rcut10.log    | 1704.5 |[msn-p](https://raw.githubusercontent.com/gms-bbg/ecp-kpp2/main/10-points/msn-r_4600water_efmo_rimp2.rcut10.log)|

## MSN5 Hydrated

This directory contains the inputs and outputs for a small fragmented system that is tractable within the queuing policy limits on Frontier. This small fragmented system consists of 5 msn fragments from the msn-r structure with the full hydration shell. The parameter RESDIM controls a distance dependent cut-off that determines how dimers are treated (QM vs. EFP). Increasing the RESDIM value from 1 to 2 will result in more dimers being treated with quantum mechanics which will increase the amount of computational work available.

Directory: msn5-hydrated

### RESDIM=1

| Identifier | Filename                                    | Total Wall time (s) | Speed-up (x) | Raw View |
|------------|---------------------------------------------|-------------------:|:------------:|------|
| msn5-hyd-resdim1-cpu | msn\_05frag\_4600water\_efmo\_rimp2.rcut1_0128N-0128-cpu.log | 8002.7 |     |[msn5-hyd-resdim1-cpu](https://raw.githubusercontent.com/gms-bbg/ecp-kpp2/main/msn5-hydrated/msn_05frag_4600water_efmo_rimp2.rcut1_0128N-0128-cpu.log)|
| msn5-hyd-resdim1-gpu | msn\_05frag\_4600water\_efmo\_rimp2.rcut1_0128N-0128-gpu.log | 1760.7 | 4.6 |[msn5-hyd-resdim1-gpu](https://raw.githubusercontent.com/gms-bbg/ecp-kpp2/main/msn5-hydrated/msn_05frag_4600water_efmo_rimp2.rcut1_0128N-0128-gpu.log)|

### RESDIM=2

| Identifier | Filename                                    | Total Wall time (s) | Speed-up (x) | Raw View |
|------------|---------------------------------------------|-------------------:|:------------:|------|
| msn5-hyd-resdim2-cpu | msn\_05frag\_4600water\_efmo\_rimp2.rcut2\_0128N-0128-cpu.log | 10442.7 |     |[msn5-hyd-resdim2-cpu](https://raw.githubusercontent.com/gms-bbg/ecp-kpp2/main/msn5-hydrated/msn_05frag_4600water_efmo_rimp2.rcut2_0128N-0128-cpu.log)|
| msn5-hyd-resdim2-gpu | msn\_05frag\_4600water\_efmo\_rimp2.rcut2\_0128N-0128-gpu.log |  2132.6 | 4.9 |[msn5-hyd-resdim2-gpu](https://raw.githubusercontent.com/gms-bbg/ecp-kpp2/main/msn5-hydrated/msn_05frag_4600water_efmo_rimp2.rcut2_0128N-0128-gpu.log)|

## Annotated Runs

This directory contains the outputs for the small fragmented system (MSN5 hydrated) where the `CRAY_ACC_DEBUG` environmental variable is set to level 2 to provide annotations within the log file related to OpenMP offloading.

Directory: annotated

### RESDIM=1

| Identifier | Filename                                    | Raw View |
|------------|---------------------------------------------|----------|
| msn5-hyd-resdim1-gpu-info | msn\_05frag\_4600water\_efmo\_rimp2.rcut1_0128N-0128-gpu-info.log |[msn5-hyd-resdim1-gpu-info]()|

### RESDIM=2

| Identifier | Filename                                    | Raw View |
|------------|---------------------------------------------|----------|
| msn5-hyd-resdim2-gpu-info | msn\_05frag\_4600water\_efmo\_rimp2.rcut2\_0128N-0128-gpu-info.log |[msn5-hyd-resdim2-gpu-info]()|
