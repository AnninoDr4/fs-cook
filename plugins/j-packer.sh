#!/usr/bin/env bash

target=$1
target_source=/

tar \
    --exclude="${target_source}"/dev/* \
    --exclude="${target_source}"/run/* \
    --exclude="${target_source}"/proc/* \
    --exclude="${target_source}"/sys/* \
    --exclude="${target_source}"/tmp/* \
    -cpf \
     - "${target_source}" -P \
    | pv -s $(($(du -sk "${target_source}" | awk '{print $1}') * 1024)) |\
     bzip2 > "${target}".tar.xz