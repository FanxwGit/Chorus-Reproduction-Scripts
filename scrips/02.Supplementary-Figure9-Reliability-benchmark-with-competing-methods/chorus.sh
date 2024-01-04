#!/bin/bash
CHORUS="/home/wangziyuan/bio/chorus/build"
EVALUATE="/home/wangziyuan/bio/benchmark/mmseqs2-benchmark-pub/mmseqs-benchmark/build/evaluate_results"

# 00
TARGET="/data-nvme/wangziyuan/fxw/data/mmseqs2-benchmark-pub/db/targetannotation.fasta"
QUERY="/data-nvme/wangziyuan/fxw/data/mmseqs2-benchmark-pub/db/query.fasta"

# 10
QUERY_TANTAN="/data-nvme/wangziyuan/fxw/data/mmseqs2-benchmark-pub/db/query_tantan.fasta"
TARGET="/data-nvme/wangziyuan/fxw/data/mmseqs2-benchmark-pub/db/targetannotation.fasta"

# 01
QUERY="/data-nvme/wangziyuan/fxw/data/mmseqs2-benchmark-pub/db/query.fasta"
TARGET_TANTAN="/data-nvme/wangziyuan/fxw/data/mmseqs2-benchmark-pub/db/targetannotation_tantan.fasta"

# 11
TARGET_TANTAN="/data-nvme/wangziyuan/fxw/data/mmseqs2-benchmark-pub/db/targetannotation_tantan.fasta"
QUERY_TANTAN="/data-nvme/wangziyuan/fxw/data/mmseqs2-benchmark-pub/db/query_tantan.fasta"


RESULT="/data-nvme/wangziyuan/fxw/res/chorus"
DB="/data-nvme/wangziyuan/fxw/db/chorus"



# #################00
# rm -rf $RESULT
# rm -rf $DB

# mkdir -p $DB
# mkdir -p $RESULT

# time "${CHORUS}/createDB" "${TARGET}" "${DB}/nr" 4 #  1m9.250s
# time "${CHORUS}/query" -q "${QUERY}" -d "${DB}/nr" -o "${RESULT}"/output.m8 # 4m11.356s

# "${EVALUATE}" "$QUERY" "$TARGET" "${RESULT}/output.m8" "${RESULT}/evaluation_roc5.dat" 4000 1 | tee "${RESULT}/evaluation.log"

# cp ${RESULT}/evaluation.log /home/wangziyuan/fxw/work/02.20231010-ROC/evaluation/chorus00.log
# #################


# #################10
# rm -rf $RESULT
# rm -rf $DB

# mkdir -p $DB
# mkdir -p $RESULT

# time "${CHORUS}/createDB" "${TARGET}" "${DB}/nr" 4 #  1m9.250s
# time "${CHORUS}/query" -q "${QUERY_TANTAN}" -d "${DB}/nr" -o "${RESULT}"/output.m8 # 4m11.356s

# "${EVALUATE}" "$QUERY_TANTAN" "$TARGET" "${RESULT}/output.m8" "${RESULT}/evaluation_roc5.dat" 4000 1 | tee "${RESULT}/evaluation.log"

# cp ${RESULT}/evaluation.log /home/wangziyuan/fxw/work/02.20231010-ROC/evaluation/chorus10.log
# #################



# #################01
# rm -rf $RESULT
# rm -rf $DB

# mkdir -p $DB
# mkdir -p $RESULT

# time "${CHORUS}/createDB" "${TARGET_TANTAN}" "${DB}/nr" 4 #  1m9.250s
# time "${CHORUS}/query" -q "${QUERY}" -d "${DB}/nr" -o "${RESULT}"/output.m8 # 4m11.356s

# "${EVALUATE}" "$QUERY" "$TARGET_TANTAN" "${RESULT}/output.m8" "${RESULT}/evaluation_roc5.dat" 4000 1 | tee "${RESULT}/evaluation.log"

# cp ${RESULT}/evaluation.log /home/wangziyuan/fxw/work/02.20231010-ROC/evaluation/chorus01.log
# #################


#################11
rm -rf $RESULT
rm -rf $DB

mkdir -p $DB
mkdir -p $RESULT

time "${CHORUS}/createDB" "${TARGET_TANTAN}" "${DB}/nr" 4 #  1m9.250s
time "${CHORUS}/query" -q "${QUERY_TANTAN}" -d "${DB}/nr" -o "${RESULT}"/output.m8 # 4m11.356s

"${EVALUATE}" "$QUERY_TANTAN" "$TARGET_TANTAN" "${RESULT}/output.m8" "${RESULT}/evaluation_roc5.dat" 4000 1 | tee "${RESULT}/evaluation.log"

cp ${RESULT}/evaluation.log /home/wangziyuan/fxw/work/02.20231010-ROC/evaluation/chorus11.log
#################