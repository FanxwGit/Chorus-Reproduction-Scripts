#!/bin/bash
CHORUS="/home/wangziyuan/bio/chorus/build"
EVALUATE="/home/wangziyuan/bio/benchmark/mmseqs2-benchmark-pub/mmseqs-benchmark/build/evaluate_results"


# 11
TARGET_TANTAN="/data-nvme/wangziyuan/fxw/data/mmseqs2-benchmark-pub/db/targetannotation_tantan.fasta"
QUERY_TANTAN="/data-nvme/wangziyuan/fxw/data/mmseqs2-benchmark-pub/db/query_tantan.fasta"


RESULT="/data-nvme/wangziyuan/fxw/res/chorus"
DB="/data-nvme/wangziyuan/fxw/db/chorus"



rm -rf $RESULT
rm -rf $DB

mkdir -p $DB
mkdir -p $RESULT

time "${CHORUS}/createDB" "${TARGET_TANTAN}" "${DB}/nr" 4 #  1m9.250s
time "${CHORUS}/query" -q "${QUERY_TANTAN}" -d "${DB}/nr" -o "${RESULT}"/output.m8 # 4m11.356s

"${EVALUATE}" "$QUERY_TANTAN" "$TARGET_TANTAN" "${RESULT}/output.m8" "${RESULT}/evaluation_roc5.dat" 4000 1 | tee "${RESULT}/evaluation.log"

# cp ${RESULT}/evaluation.log /home/wangziyuan/fxw/work/02.20231010-ROC/evaluation/chorus11.log
