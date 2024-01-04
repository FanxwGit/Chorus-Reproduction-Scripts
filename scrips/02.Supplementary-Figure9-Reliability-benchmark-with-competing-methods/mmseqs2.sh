#!/bin/bash
MMSEQS="/home/wangziyuan/bio/mmseqs/mmseqs/bin/mmseqs"
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


DB="/data-nvme/wangziyuan/fxw/db/mmseqs2"
TMP="/data-nvme/wangziyuan/fxw/db/mmseqs2/tmp"
RESULT="/data-nvme/wangziyuan/fxw/res/mmseqs2"

#################00
# rm -rf ${DB}
# rm -rf ${TMP}
# rm -rf ${RESULT}

# mkdir -p "${DB}"
# mkdir -p "${TMP}"
# mkdir -p "${RESULT}"

# time "${MMSEQS}" createdb "${TARGET}" "${DB}"/targetDB  # 2m47.257s
# time "${MMSEQS}" createdb "${QUERY}" "${DB}"/queryDB  # 0.028s
# time "${MMSEQS}" search "${DB}"/queryDB "${DB}"/targetDB "${RESULT}"/alnRes.m8 "${TMP}" -s 1  # 3m29.264s

# $MMSEQS convertalis "${DB}"/queryDB "${DB}"/targetDB $RESULT/alnRes.m8 $RESULT/alnRes.m8

# "${EVALUATE}" "$QUERY" "$TARGET" "${RESULT}/alnRes.m8" "${RESULT}/evaluation_roc5.dat" 4000 1 | tee "${RESULT}/evaluation.log"

# cp ${RESULT}/evaluation.log /home/wangziyuan/fxw/work/02.20231010-ROC/evaluation/mmseqs00.log
# #################

#################10
# rm -rf ${DB}
# rm -rf ${TMP}
# rm -rf ${RESULT}

# mkdir -p "${DB}"
# mkdir -p "${TMP}"
# mkdir -p "${RESULT}"

# time "${MMSEQS}" createdb "${TARGET}" "${DB}"/targetDB  # 2m47.257s
# time "${MMSEQS}" createdb "${QUERY_TANTAN}" "${DB}"/queryDB  # 0.028s
# time "${MMSEQS}" search "${DB}"/queryDB "${DB}"/targetDB "${RESULT}"/alnRes.m8 "${TMP}" -s 1  # 3m29.264s

# $MMSEQS convertalis "${DB}"/queryDB "${DB}"/targetDB $RESULT/alnRes.m8 $RESULT/alnRes.m8

# "${EVALUATE}" "$QUERY_TANTAN" "$TARGET" "${RESULT}/alnRes.m8" "${RESULT}/evaluation_roc5.dat" 4000 1 | tee "${RESULT}/evaluation.log"

# cp ${RESULT}/evaluation.log /home/wangziyuan/fxw/work/02.20231010-ROC/evaluation/mmseqs10.log
#################

#################01
# rm -rf ${DB}
# rm -rf ${TMP}
# rm -rf ${RESULT}

# mkdir -p "${DB}"
# mkdir -p "${TMP}"
# mkdir -p "${RESULT}"

# time "${MMSEQS}" createdb "${TARGET_TANTAN}" "${DB}"/targetDB  # 2m47.257s
# time "${MMSEQS}" createdb "${QUERY}" "${DB}"/queryDB  # 0.028s
# time "${MMSEQS}" search "${DB}"/queryDB "${DB}"/targetDB "${RESULT}"/alnRes.m8 "${TMP}" -s 1  # 3m29.264s

# $MMSEQS convertalis "${DB}"/queryDB "${DB}"/targetDB $RESULT/alnRes.m8 $RESULT/alnRes.m8

# "${EVALUATE}" "$QUERY" "$TARGET_TANTAN" "${RESULT}/alnRes.m8" "${RESULT}/evaluation_roc5.dat" 4000 1 | tee "${RESULT}/evaluation.log"

# cp ${RESULT}/evaluation.log /home/wangziyuan/fxw/work/02.20231010-ROC/evaluation/mmseqs01.log
#################

#################11
rm -rf ${DB}
rm -rf ${TMP}
rm -rf ${RESULT}

mkdir -p "${DB}"
mkdir -p "${TMP}"
mkdir -p "${RESULT}"

time "${MMSEQS}" createdb "${TARGET_TANTAN}" "${DB}"/targetDB  # 2m47.257s
time "${MMSEQS}" createdb "${QUERY_TANTAN}" "${DB}"/queryDB  # 0.028s
time "${MMSEQS}" search "${DB}"/queryDB "${DB}"/targetDB "${RESULT}"/alnRes.m8 "${TMP}" -s 1  # 3m29.264s

$MMSEQS convertalis "${DB}"/queryDB "${DB}"/targetDB $RESULT/alnRes.m8 $RESULT/alnRes.m8

# "${EVALUATE}" "$QUERY_TANTAN" "$TARGET_TANTAN" "${RESULT}/alnRes.m8" "${RESULT}/evaluation_roc5.dat" 4000 1 | tee "${RESULT}/evaluation.log"

# cp ${RESULT}/evaluation.log /home/wangziyuan/fxw/work/02.20231010-ROC/evaluation/mmseqs11.log
#################

