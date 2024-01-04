# Chorus-Reproduction-Scripts
This repository is dedicated to the reproduction of the manuscript titled "Rapid Multiple Protein Sequence Search by Parallel and Heterogeneous Computation."

The official source code is at the following [link](https://github.com/Bio-Acc/Chorus)

## Download Data

* MMseq2 benchmark
```
cd /home/wangziyuan/fxw/Chorus-Reproduction-Scripts
wget http://wwwuser.gwdg.de/~compbiol/mmseqs2/mmseqs2-benchmark.tar.gz
tar -zxvf mmseqs2-benchmark.tar.gz
```

## Path

Set the environment variable
```
export CHORUS_HOME="/home/wangziyuan/bio/Chorus/bin"
export PATH=$CHORUS_HOME:$PATH

export MMSEQS_HOME="home/wangziyuan/bio/mmseqs/mmseqs/bin/"
export PATH=$MMSEQS_HOME:$PATH

export BLAST_HOME="/home/wangziyuan/bio/blast-2.12.0/ncbi-blast-2.12.0+/bin"
export PATH=$BLAST_HOME:$PATH
```
**Remember to replace the paths in the XX_HOME variables according to your actual installation locations.**
## Scrips
```
├── mmseqs2-benchmark-pub -> /home/wangziyuan/bio/benchmark/mmseqs2-benchmark-pub
├── README.md
└── scrips
    ├── 01.Reproduction-Review2-Result
    │   ├── blastp.sh
    │   ├── chorus.sh
    │   └── mmseqs2.sh
    ├── 02.Supplementary-Figure9-Reliability-benchmark-with-competing-methods
    │   ├── chorus.sh
    │   ├── diamond.sh
    │   ├── evaluation
    │   └── mmseqs2.sh
    ├── 03.Supplementary-Figure8-Performance-cross-over-point-with-competing-methods
    │   ├── analize_time_mmseqs2.py
    │   ├── analyze_time_chorus.py
    │   └── analyze_time_diamond.py
    └── other
        └── drop-cache.sh
```
### 0.Other

|File Name|Discription|
|-|-|
|drop-cache.sh|drop the system cache|

### 01.Reproduction-Review2-Result
|File Name|Discription|
|-|-|
|blastp.sh|`*.sh` is the script for running the corresponding program.|
|chorus.sh|`*.sh` is the script for running the corresponding program.|
|mmseqs2.sh|`*.sh` is the script for running the corresponding program.|



### 02.Supplementary-Figure9-Reliability-benchmark-with-competing-methods
|File Name|Discription|
|-|-|
|blastp.sh|`*.sh` is the script for running the corresponding program.|
|chorus.sh|`*.sh` is the script for running the corresponding program.|
|mmseqs2.sh|`*.sh` is the script for running the corresponding program.|
|evaluaion|This file is the result of a search analyzed with the evaluate tool of mmseqs-benchmark.|

`*.sh` is the script for running the corresponding program.`
### 03.