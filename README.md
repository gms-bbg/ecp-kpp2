# GAMESS ECP KPP-2 Artifacts

## 10-point MSN Reaction Pathway

Directory: 10-points [(link)](https://github.com/gms-bbg/ecp-kpp2/tree/main/10-points)

This directory contains the inputs and outputs for the GAMESS ECP KPP-2 science challenge problem consisting of 10-points along a representative reaction path on a mesoporous silica nanoparticle (MSN) that includes an amine-containing catalytic group and is surrounded by 4,600 water molecules [13,800 atoms; 46,000 electrons], all within the effective fragment molecular orbital (EFMO) method. Each of the 10 points along the reaction path used 5,430 Frontier nodes.

| Identifier | Filename | Total Wall time (s) |
|------------|----------|-------:|
| msn-r    [(link)](https://raw.githubusercontent.com/gms-bbg/ecp-kpp2/main/10-points/msn-r_4600water_efmo_rimp2.rcut10.log) | msn-r\_4600water\_efmo\_rimp2.rcut10.log    | 1118.7 |
| msn-r1ts [(link)](https://raw.githubusercontent.com/gms-bbg/ecp-kpp2/main/10-points/msn-r_4600water_efmo_rimp2.rcut10.log) | msn-r1ts\_4600water\_efmo\_rimp2.rcut10.log | 1655.1 |
| msn-r2ts [(link)](https://raw.githubusercontent.com/gms-bbg/ecp-kpp2/main/10-points/msn-r_4600water_efmo_rimp2.rcut10.log) | msn-r2ts\_4600water\_efmo\_rimp2.rcut10.log | 1655.7 |
| msn-r3ts [(link)](https://raw.githubusercontent.com/gms-bbg/ecp-kpp2/main/10-points/msn-r_4600water_efmo_rimp2.rcut10.log) | msn-r3ts\_4600water\_efmo\_rimp2.rcut10.log | 1686.3 |
| msn-ts   [(link)](https://raw.githubusercontent.com/gms-bbg/ecp-kpp2/main/10-points/msn-r_4600water_efmo_rimp2.rcut10.log) | msn-ts\_4600water\_efmo\_rimp2.rcut10.log   | 1672.2 |
| msn-ts1p [(link)](https://raw.githubusercontent.com/gms-bbg/ecp-kpp2/main/10-points/msn-r_4600water_efmo_rimp2.rcut10.log) | msn-ts1p\_4600water\_efmo\_rimp2.rcut10.log | 1687.5 |
| msn-ts2p [(link)](https://raw.githubusercontent.com/gms-bbg/ecp-kpp2/main/10-points/msn-r_4600water_efmo_rimp2.rcut10.log) | msn-ts2p\_4600water\_efmo\_rimp2.rcut10.log | 1667.7 |
| msn-ts3p [(link)](https://raw.githubusercontent.com/gms-bbg/ecp-kpp2/main/10-points/msn-r_4600water_efmo_rimp2.rcut10.log) | msn-ts3p\_4600water\_efmo\_rimp2.rcut10.log | 1664.4 |
| msn-ts4p [(link)](https://raw.githubusercontent.com/gms-bbg/ecp-kpp2/main/10-points/msn-r_4600water_efmo_rimp2.rcut10.log) | msn-ts4p\_4600water\_efmo\_rimp2.rcut10.log | 1692.3 |
| msn-p    [(link)](https://raw.githubusercontent.com/gms-bbg/ecp-kpp2/main/10-points/msn-r_4600water_efmo_rimp2.rcut10.log) | msn-p\_4600water\_efmo\_rimp2.rcut10.log    | 1704.5 |

## MSN5 Hydrated

Directory: msn5-hydrated [(link)](https://github.com/gms-bbg/ecp-kpp2/tree/main/msn5-hydrated)

This directory contains the inputs and outputs for a small fragmented system that is tractable within the queuing policy limits on Frontier. This small fragmented system consists of 5 msn fragments from the msn-r structure with the full hydration shell. The parameter Rcut controls a distance dependent cut-off that determines how dimers are treated (QM vs. EFP). Increasing the Rcut value from 1 to 2 will result in more dimers being treated with quantum mechanics which will increase the amount of computational work available.

### Rcut=1

| Identifier | Filename | Total Wall time (s) | Speed-up (x) |
|------------|----------|--------------------:|:------------:|
| msn5-hyd-rcut1-cpu [(link)](https://raw.githubusercontent.com/colleeneb/ecp-kpp2/main/msn5-hydrated/frontier/msn_05frag_4600water_efmo_rimp2.rcut1_0128N-0128-cpu.log) | msn\_05frag\_4600water\_efmo\_rimp2.rcut1_0128N-0128-cpu.log | 8002.7 |     |
| msn5-hyd-rcut1-gpu [(link)](https://raw.githubusercontent.com/colleeneb/ecp-kpp2/main/msn5-hydrated/frontier/msn_05frag_4600water_efmo_rimp2.rcut1_0128N-0128-gpu.log) | msn\_05frag\_4600water\_efmo\_rimp2.rcut1_0128N-0128-gpu.log | 1760.7 | 4.6 |

### Rcut=2

| Identifier | Filename | Total Wall time (s) | Speed-up (x) |
|------------|----------|--------------------:|:------------:|
| msn5-hyd-rcut2-cpu [(link)](https://raw.githubusercontent.com/colleeneb/ecp-kpp2/intel/msn5-hydrated/frontier/msn_05frag_4600water_efmo_rimp2.rcut2_0128N-0128-cpu.log) | msn\_05frag\_4600water\_efmo\_rimp2.rcut2\_0128N-0128-cpu.log | 10442.7 |     |
| msn5-hyd-rcut2-gpu [(link)](https://raw.githubusercontent.com/colleeneb/ecp-kpp2/intel/msn5-hydrated/frontier/msn_05frag_4600water_efmo_rimp2.rcut2_0128N-0128-gpu.log) | msn\_05frag\_4600water\_efmo\_rimp2.rcut2\_0128N-0128-gpu.log |  2132.6 | 4.9 |


### MSN5 Hydrated on Aurora

We have also run the MSN5 inputs on Aurora on 128 nodes, and received approval from Intel to post the results publicly. The results are below. For comparisons with Frontier, we note that on Aurora, we run with 24 ranks per node, while on Frontier we run with 16 ranks per node.

#### Rcut=1

| Identifier | Filename | Total Wall time (s) | Speed-up (x) |
|------------|----------|--------------------:|:------------:|
| msn5-hyd-rcut1-cpu [(link)](https://raw.githubusercontent.com/colleeneb/ecp-kpp2/intel/msn5-hydrated/aurora/msn_05frag_4600water_efmo_rimp2.rcut1_0128N-0128-cpu.log) | msn\_05frag\_4600water\_efmo\_rimp2.rcut1_0128N-0128-cpu.log | 2920.9 |     |
| msn5-hyd-rcut1-gpu [(link)](https://raw.githubusercontent.com/colleeneb/ecp-kpp2/intel/msn5-hydrated/aurora/msn_05frag_4600water_efmo_rimp2.rcut1_0128N-0128-gpu.log) | msn\_05frag\_4600water\_efmo\_rimp2.rcut1_0128N-0128-gpu.log | 901.3 | 3.2 |

#### Rcut=2

| Identifier | Filename | Total Wall time (s) | Speed-up (x) |
|------------|----------|--------------------:|:------------:|
| msn5-hyd-rcut2-cpu [(link)](https://raw.githubusercontent.com/colleeneb/ecp-kpp2/intel/msn5-hydrated/aurora/msn_05frag_4600water_efmo_rimp2.rcut2_0128N-0128-cpu.log) | msn\_05frag\_4600water\_efmo\_rimp2.rcut2\_0128N-0128-cpu.log | 3745.3 |     |
| msn5-hyd-rcut2-gpu [(link)](https://raw.githubusercontent.com/colleeneb/ecp-kpp2/intel/msn5-hydrated/aurora/msn_05frag_4600water_efmo_rimp2.rcut2_0128N-0128-gpu.log) | msn\_05frag\_4600water\_efmo\_rimp2.rcut2\_0128N-0128-gpu.log |  1109.6 | 3.4 |

## MSN5 Hydrated Traces

Directory: traces [(link)](https://github.com/gms-bbg/ecp-kpp2/tree/main/traces)

This directory contains the traces generated by the AMD ROC profiler `rocprof` for a 128 node run of MSN5 hydrated at an Rcut value of 1 on Crusher using the GAMESS offloaded code. Trace data is provided for ranks 0-7 which correspond to the GAMESS compute processes on the first node.

### Kernel Traces

The `--stats` option triggers `rocprof` to generate kernel execution statistics such as kernel name, number of time a kernel is called (Calls) , time spent in the kernel in nanoseconds (TotalDurationNs), the average time spent in the kernel in nanoseconds (AverageNs), and the percent of total GPU kernel time spent in the kernel (Percentage). 

| Identifier          | Rank | Filename |
|---------------------|:----:|------------------------|
| rank-0-kernel-trace [(link)](https://github.com/gms-bbg/ecp-kpp2/blob/main/traces/trace-rank-0.stats.csv) | 0    | trace-rank-0.stats.csv |
| rank-1-kernel-trace [(link)](https://github.com/gms-bbg/ecp-kpp2/blob/main/traces/trace-rank-1.stats.csv) | 1    | trace-rank-1.stats.csv |
| rank-2-kernel-trace [(link)](https://github.com/gms-bbg/ecp-kpp2/blob/main/traces/trace-rank-2.stats.csv) | 2    | trace-rank-2.stats.csv |
| rank-3-kernel-trace [(link)](https://github.com/gms-bbg/ecp-kpp2/blob/main/traces/trace-rank-3.stats.csv) | 3    | trace-rank-3.stats.csv |
| rank-4-kernel-trace [(link)](https://github.com/gms-bbg/ecp-kpp2/blob/main/traces/trace-rank-4.stats.csv) | 4    | trace-rank-4.stats.csv |
| rank-5-kernel-trace [(link)](https://github.com/gms-bbg/ecp-kpp2/blob/main/traces/trace-rank-5.stats.csv) | 5    | trace-rank-5.stats.csv |
| rank-6-kernel-trace [(link)](https://github.com/gms-bbg/ecp-kpp2/blob/main/traces/trace-rank-6.stats.csv) | 6    | trace-rank-6.stats.csv |
| rank-7-kernel-trace [(link)](https://github.com/gms-bbg/ecp-kpp2/blob/main/traces/trace-rank-7.stats.csv) | 7    | trace-rank-7.stats.csv |

### HIP Traces

The `--hip-trace` option triggers `rocprof` to generate statistics for HIP API calls such as host-to-device (hipMemcpyHtoD) and device-to-host (hipMemcpyDtoH) memory copies.

| Identifier       | Rank | Filename                   |
|------------------|:----:|----------------------------|
| rank-0-hip-trace [(link)](https://github.com/gms-bbg/ecp-kpp2/blob/main/traces/trace-rank-0.hip_stats.csv) | 0    | trace-rank-0.hip_stats.csv |
| rank-1-hip-trace [(link)](https://github.com/gms-bbg/ecp-kpp2/blob/main/traces/trace-rank-1.hip_stats.csv) | 1    | trace-rank-1.hip_stats.csv |
| rank-2-hip-trace [(link)](https://github.com/gms-bbg/ecp-kpp2/blob/main/traces/trace-rank-2.hip_stats.csv) | 2    | trace-rank-2.hip_stats.csv |
| rank-3-hip-trace [(link)](https://github.com/gms-bbg/ecp-kpp2/blob/main/traces/trace-rank-3.hip_stats.csv) | 3    | trace-rank-3.hip_stats.csv |
| rank-4-hip-trace [(link)](https://github.com/gms-bbg/ecp-kpp2/blob/main/traces/trace-rank-4.hip_stats.csv) | 4    | trace-rank-4.hip_stats.csv |
| rank-5-hip-trace [(link)](https://github.com/gms-bbg/ecp-kpp2/blob/main/traces/trace-rank-5.hip_stats.csv) | 5    | trace-rank-5.hip_stats.csv |
| rank-6-hip-trace [(link)](https://github.com/gms-bbg/ecp-kpp2/blob/main/traces/trace-rank-6.hip_stats.csv) | 6    | trace-rank-6.hip_stats.csv |
| rank-7-hip-trace [(link)](https://github.com/gms-bbg/ecp-kpp2/blob/main/traces/trace-rank-7.hip_stats.csv) | 7    | trace-rank-7.hip_stats.csv |

### Timing Summary

This table summarizes the timing statistics from the kernel and hip trace data generated by `rocprof`. The total wall time reported for each rank includes profiling overhead, 38.9 (s).

| Rank    | Total Wall (s) | Kernels + Data Transfers (s) | Kernels (s) | Data Transfers (s) | RHF Kernels (s) | CPHF Kernels (s) | TDHF Kernels (s) | RIMP2 Kernels (s) | HIPBLAS Kernels (s) | Host-to-Device (s) | Device-to-Host (s) | 
|:-------:|-------:|------:|------:|------:|------:|----:|------:|-----:|-----:|-----:|-----:|
|        0| 1799.6 | 921.4 | 841.4 |  80.1 | 114.9 | 0.6 | 620.9 | 10.4 | 44.5 | 52.3 | 27.7 |
|        1| 1799.6 | 977.3 | 890.6 |  86.7 | 111.5 | 3.7 | 662.2 | 13.1 | 50.1 | 58.8 | 27.9 |
|        2| 1799.6 | 953.4 | 860.4 |  93.0 | 107.3 | 2.3 | 633.4 | 16.2 | 51.2 | 65.1 | 27.9 |
|        3| 1799.6 | 819.7 | 721.6 |  98.2 |  93.2 | 4.2 | 506.0 | 18.8 | 59.4 | 70.1 | 28.1 |
|        4| 1799.6 | 827.5 | 725.0 | 102.5 |  96.7 | 4.9 | 505.2 | 21.2 | 57.1 | 76.1 | 26.4 |
|        5| 1799.6 | 892.5 | 782.5 | 110.0 | 100.8 | 6.5 | 550.5 | 22.7 | 61.9 | 82.6 | 27.4 |
|        6| 1799.6 | 856.0 | 746.0 | 110.0 |  98.7 | 5.4 | 512.0 | 24.1 | 65.8 | 83.3 | 26.7 |
|        7| 1799.6 | 921.7 | 810.4 | 111.3 | 101.5 | 0.5 | 563.1 | 25.8 | 69.5 | 83.9 | 27.5 |
| Average | 1799.6 | 896.2 | 797.2 |  99.0 | 103.1 | 8.5 | 569.2 | 19.0 | 57.4 | 71.5 | 27.5 |
