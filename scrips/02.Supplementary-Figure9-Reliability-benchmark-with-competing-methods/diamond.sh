#!/bin/bash
DIAMOND="/home/wangziyuan/bio/diamond/diamond"
EVALUATE="/home/wangziyuan/bio/benchmark/mmseqs2-benchmark-pub/mmseqs-benchmark/build/evaluate_results"

# 00
# TARGET="/data-nvme/wangziyuan/fxw/data/mmseqs2-benchmark-pub/db/targetannotation.fasta"
# QUERY="/data-nvme/wangziyuan/fxw/data/mmseqs2-benchmark-pub/db/query.fasta"

# # 10
# QUERY_TANTAN="/data-nvme/wangziyuan/fxw/data/mmseqs2-benchmark-pub/db/query_tantan.fasta"
# TARGET="/data-nvme/wangziyuan/fxw/data/mmseqs2-benchmark-pub/db/targetannotation.fasta"

# # 01
# QUERY="/data-nvme/wangziyuan/fxw/data/mmseqs2-benchmark-pub/db/query.fasta"
# TARGET_TANTAN="/data-nvme/wangziyuan/fxw/data/mmseqs2-benchmark-pub/db/targetannotation_tantan.fasta"

# # 11
TARGET_TANTAN="/data-nvme/wangziyuan/fxw/data/mmseqs2-benchmark-pub/db/targetannotation_tantan.fasta"
QUERY_TANTAN="/data-nvme/wangziyuan/fxw/data/mmseqs2-benchmark-pub/db/query_tantan.fasta"


REFERENCE="/data-nvme/wangziyuan/fxw/db/diamond"
RESULT="/data-nvme/wangziyuan/fxw/res/diamond"


#################00
# rm -rf $RESULT
# rm -rf $REFERENCE

# mkdir -p $RESULT
# mkdir -p $REFERENCE

# "${DIAMOND}" makedb --in "${TARGET}" --db "${REFERENCE}"
# "${DIAMOND}" blastp --query "${QUERY}"  --db "${REFERENCE}" --out "${RESULT}"/output.m8


# "${EVALUATE}" "$QUERY" "$TARGET" "${RESULT}/output.m8" "${RESULT}/evaluation_roc5.dat" 4000 1 | tee "${RESULT}/evaluation.log"
# ACTUAL=$(grep "^ROC5 AUC:" "${RESULT}/evaluation.log" | cut -d" " -f3)

# cp ${RESULT}/evaluation.log /home/wangziyuan/fxw/work/02.20231010-ROC/evaluation/diamond00.log
#################



# #################10
# rm -rf $RESULT
# rm -rf $REFERENCE

# mkdir -p $RESULT
# mkdir -p $REFERENCE

# "${DIAMOND}" makedb --in "${TARGET}" --db "${REFERENCE}"
# "${DIAMOND}" blastp --query "${QUERY_TANTAN}"  --db "${REFERENCE}" --out "${RESULT}"/output.m8

# "${EVALUATE}" "$QUERY_TANTAN" "$TARGET" "${RESULT}/output.m8" "${RESULT}/evaluation_roc5.dat" 4000 1 | tee "${RESULT}/evaluation.log"
# ACTUAL=$(grep "^ROC5 AUC:" "${RESULT}/evaluation.log" | cut -d" " -f3)

# cp ${RESULT}/evaluation.log /home/wangziyuan/fxw/work/02.20231010-ROC/evaluation/diamond01.log
# #################


# #################01
# rm -rf $RESULT
# rm -rf $REFERENCE

# mkdir -p $RESULT
# mkdir -p $REFERENCE

# "${DIAMOND}" makedb --in "${TARGET_TANTAN}" --db "${REFERENCE}"
# "${DIAMOND}" blastp --query "${QUERY}"  --db "${REFERENCE}" --out "${RESULT}"/output.m8

# "${EVALUATE}" "$QUERY" "$TARGET_TANTAN" "${RESULT}/output.m8" "${RESULT}/evaluation_roc5.dat" 4000 1 | tee "${RESULT}/evaluation.log"
# ACTUAL=$(grep "^ROC5 AUC:" "${RESULT}/evaluation.log" | cut -d" " -f3)

# cp ${RESULT}/evaluation.log /home/wangziyuan/fxw/work/02.20231010-ROC/evaluation/diamond10.log
# #################


# #################11
rm -rf $RESULT
rm -rf $REFERENCE

mkdir -p $RESULT
mkdir -p $REFERENCE

"${DIAMOND}" makedb --in "${TARGET_TANTAN}" --db "${REFERENCE}"
"${DIAMOND}" blastp --query "${QUERY_TANTAN}"  --db "${REFERENCE}" --out "${RESULT}"/output.m8

# "${EVALUATE}" "$QUERY_TANTAN" "$TARGET_TANTAN" "${RESULT}/output.m8" "${RESULT}/evaluation_roc5.dat" 4000 1 | tee "${RESULT}/evaluation.log"
# ACTUAL=$(grep "^ROC5 AUC:" "${RESULT}/evaluation.log" | cut -d" " -f3)

# cp ${RESULT}/evaluation.log /home/wangziyuan/fxw/work/02.20231010-ROC/evaluation/diamond11.log
# #################