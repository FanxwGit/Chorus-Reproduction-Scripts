#!/bin/bash
MMSEQS="/home/wangziyuan/bio/mmseqs/mmseqs/bin/mmseqs"
TARGET="/data-nvme/wangziyuan/fxw/data/mmseqs2-benchmark-pub/db/targetdb.fasta"
QUERY="/data-nvme/wangziyuan/fxw/data/mmseqs2-benchmark-pub/db/query.fasta"

DB="/data-nvme/wangziyuan/fxw/db/mmseqs2"
TMP="/data-nvme/wangziyuan/fxw/db/mmseqs2/tmp"
RESULT="/data-nvme/wangziyuan/fxw/res/mmseqs2"


# rm -rf ${RESULT}
# rm -rf ${TMP}

# mkdir -p "${DB}"
# mkdir -p "${TMP}"
# mkdir -p "${RESULT}"

sudo sh scrips/0.Other/drop-cache.sh
time -p "${MMSEQS}" createdb "${TARGET}" "${DB}"/targetDB
sudo sh scrips/0.Other/drop-cache.sh
time -p "${MMSEQS}" createdb "${QUERY}" "${DB}"/queryDB
sudo sh scrips/0.Other/drop-cache.sh
time -p "${MMSEQS}" search "${DB}"/queryDB "${DB}"/targetDB "${RESULT}"/alnRes.m8 "${TMP}" -s 1