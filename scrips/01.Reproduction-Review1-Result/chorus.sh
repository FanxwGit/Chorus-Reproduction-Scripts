#!/bin/bash
CHORUS="/home/wangziyuan/bio/chorus/build"
TARGET="/data-nvme/wangziyuan/fxw/data/mmseqs2-benchmark-pub/db/targetdb.fasta"
QUERY="/data-nvme/wangziyuan/fxw/data/mmseqs2-benchmark-pub/db/query.fasta"
RESULT="/data-nvme/wangziyuan/fxw/res/chorus"
DB="/data-nvme/wangziyuan/fxw/db/chorus"

rm -rf ${RESULT}
rm -rf ${DB}

mkdir -p "${DB}"
mkdir -p "${RESULT}"


sudo sh scrips/other/drop-cache.sh
time -p "${CHORUS}/createDB" "${TARGET}" "${DB}/nr" 8
sudo sh scrips/other/drop-cache.sh
time -p "${CHORUS}/query" -q "${QUERY}" -d "${DB}/nr" -o "${RESULT}"/output.m8