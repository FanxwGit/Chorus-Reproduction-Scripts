#!/bin/bash
BLAST="/home/wangziyuan/bio/blast-2.12.0/ncbi-blast-2.12.0+/bin"
TARGET="/data-nvme/wangziyuan/fxw/data/mmseqs2-benchmark-pub/db/targetdb.fasta"
QUERY="/data-nvme/wangziyuan/fxw/data/mmseqs2-benchmark-pub/db/query.fasta"

RESULT="/data-nvme/wangziyuan/fxw/res/blastp"
DB="/data-nvme/wangziyuan/fxw/db/blastp/mydb"


rm -rf ${RESULT}
rm -rf ${DB}

mkdir -p "${RESULT}"

sudo sh scrips/0.Other/drop-cache.sh
time -p $BLAST/makeblastdb -dbtype prot -in $TARGET -out $DB 2>&1 
sudo sh scrips/0.Other/drop-cache.sh

time -p $BLAST/blastp -query $QUERY -db $DB -out $RESULT/results_blast_tmp.m8 -num_threads 56 2>&1
