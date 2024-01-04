# Chorus-Reproduction-Scripts
This repository is dedicated to the reproduction of the manuscript titled "Rapid Multiple Protein Sequence Search by Parallel and Heterogeneous Computation."

The official source code is at the following [link](https://github.com/Bio-Acc/Chorus)


* [Chorus-Reproduction-Scripts](#chorus-reproduction-scripts)
    * [Download Data](#download-data)
    * [Path](#path)
    * [Scrips](#scrips)
        * [Other](#other)
        * [01.Reproduction-Review1-Result](#01reproduction-review1-result)
        * [02.Supplementary-Figure9-Reliability-benchmark-with-competing-methods](#02supplementary-figure9-reliability-benchmark-with-competing-methods)
        * [03.Supplementary-Figure8-Performance-cross-over-point-with-competing-methods](#03supplementary-figure8-performance-cross-over-point-with-competing-methods)
        * [04. Cas-analysis scrips](#04-cas-analysis-scrips)
    * [Contact](#contact)

## Download Data

* MMseq2 benchmark
```
cd /home/wangziyuan/fxw/Chorus-Reproduction-Scripts
wget http://wwwuser.gwdg.de/~compbiol/mmseqs2/mmseqs2-benchmark.tar.gz
tar -zxvf mmseqs2-benchmark.tar.gz
```

## Environment

Operating System:  Ubuntu 20.04.5 LTS
CPU: Xeon E5-2680 v4


|Software|Version|
|-|-|
|chorus|1.0.0|
|mmseqs2|45111b641859ed0ddd875b94d6fd1aef1a675b7e|
|blast|2.12.0|


Set the environment variable (optional)
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
├── mmseqs2-benchmark-pub
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
    │   ├── chorus.sh
    │   ├── diamond.sh
    │   └── mmseqs2.sh
    ├── 04.Cas-Analysis
    │   └── get.sh
    └── other
        └── drop-cache.sh
```
### Other
In the operating system, Page Cache and Slab Cache can accelerate I/O read and write operations.  Due to the acceleration effects of these system caches, there can be inconsistencies in runtimes for the same query and target.  To ensure fairness in our tests, we clear the system's Page Cache and Slab Cache before each search operation.

|File Name|Discription|
|-|-|
|drop-cache.sh|drop the system cache|

### 01.Reproduction-Review1-Result
the query is the query.fasta (6370 queries) and targetdb.fasta (30430281 targets) in the mmseqs2-benchmark-pub

|File Name|Discription|
|-|-|
|blastp.sh|`*.sh` is the script for running the corresponding program.|
|chorus.sh|`*.sh` is the script for running the corresponding program.|
|mmseqs2.sh|`*.sh` is the script for running the corresponding program.|



### 02.Supplementary-Figure9-Reliability-benchmark-with-competing-methods

the query is the query.fasta (6370 queries) in the  mmseqs2-benchmark-pub
the target is the targetannotation.fasta (3374007 targets)

we use the tantan tool to tantan the targetannotation.fasta
1. Download and build tantan: https://gitlab.com/mcfrith/tantan

2. Tantan the query and database 

```bash
tantan -p -x X query.fasta query_tantan.fasta
tantan -p -x X targetannotation.fasta targetannotation_tantan.fasta
```

3. Run the script

|File Name|Discription|
|-|-|
|blastp.sh|`*.sh` is the script for running the corresponding program.|
|chorus.sh|`*.sh` is the script for running the corresponding program.|
|mmseqs2.sh|`*.sh` is the script for running the corresponding program.|
|evaluaion|This file is the result of a search analyzed with the evaluate tool of mmseqs-benchmark.|

### 03.Supplementary-Figure8-Performance-cross-over-point-with-competing-methods
In this part, we use the script to analyze the time of mmseqs2, chorus, and diamond to get the cross-over point.

The database is UniRef90 (Mar 2023 version, size 75G). 

The sequences in the querys set were randomly extracted from UniRef50 (June 2015 version), encompassing a size of 14 GB, with each sequence having a length of 1000 amino acids. 


You can get the `S8_CrossoverPointQuerys.zip` from this repo's [Release](https://github.com/FanxwGit/Chorus-Reproduction-Scripts/releases/tag/v1.0)
or You can use this command to download the sequences.
```
wget https://github.com/FanxwGit/Chorus-Reproduction-Scripts/releases/download/v1.0/S8_CrossoverPointQuerys.zip
```


|File Name|Discription|
|-|-|
|chorus.sh|`*.sh` is the script for running the corresponding program.|
|diamond.sh|`*.sh` is the script for running the corresponding program.|
|mmseqs2.sh|`*.sh` is the script for running the corresponding program.|
|S8_CrossoverPointQuerys.zip|a sequences randomly extracted|


### 04. Cas-analysis scrips

Because the cas-analysis scipts is too large, we put it in this repository's release. You can download it from this repo's [Release](https://github.com/FanxwGit/Chorus-Reproduction-Scripts/releases/tag/v1.0)

or you can use this command to download it.
```
wget https://github.com/FanxwGit/Chorus-Reproduction-Scripts/releases/download/v1.0/crispr_query.zip
unzip crispr_query.zip
```

**More details about Cas-analysis in this notes.md**

after the extraction is completed, the expected folder structure is 
```
/home/username
├── casq-demo.casq
│   ├── casq-known_CasNuevo
│   ├── casq.p1
│   ├── casq.p1.log
│   ├── casq.p1start
│   ├── notes
│   ├── run.initOrf.log
│   └── run.initOrf.sh
└── cast-build
    ├── casq-known_CasNuevo
    ├── CAST
    └── cast-knowncas
└── notes.md
```

`cast-build` is the program/script folder
`casq-demo` is the demostration project folder
`notes.md` is the notes for the cas-analysis



|File Name|Discription|
|-|-|
|crispr_query.zip|This Zip contain the cas-analysis scrips.|


## Contact
Thank you for your interest in our work.
If you have any questions, please commit an issue.