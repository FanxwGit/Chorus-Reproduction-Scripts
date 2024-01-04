#!/bin/bash
DIAMOND="/home/wangziyuan/bio/diamond/diamond"
EVALUATE="/home/wangziyuan/bio/benchmark/mmseqs2-benchmark-pub/mmseqs-benchmark/build/evaluate_results"


TARGET_TANTAN="/data-nvme/wangziyuan/fxw/data/mmseqs2-benchmark-pub/db/targetannotation_tantan.fasta"
QUERY_TANTAN="/data-nvme/wangziyuan/fxw/data/mmseqs2-benchmark-pub/db/query_tantan.fasta"


REFERENCE="/data-nvme/wangziyuan/fxw/db/diamond"
RESULT="/data-nvme/wangziyuan/fxw/res/diamond"


rm -rf $RESULT
rm -rf $REFERENCE

mkdir -p $RESULT
mkdir -p $REFERENCE

"${DIAMOND}" makedb --in "${TARGET_TANTAN}" --db "${REFERENCE}"
"${DIAMOND}" blastp --query "${QUERY_TANTAN}"  --db "${REFERENCE}" --out "${RESULT}"/output.m8

"${EVALUATE}" "$QUERY_TANTAN" "$TARGET_TANTAN" "${RESULT}/output.m8" "${RESULT}/evaluation_roc5.dat" 4000 1 | tee "${RESULT}/evaluation.log"
ACTUAL=$(grep "^ROC5 AUC:" "${RESULT}/evaluation.log" | cut -d" " -f3)
