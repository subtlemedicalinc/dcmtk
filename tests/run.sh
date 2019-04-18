#!/bin/bash

mkdir -p ./tests/data
mkdir -p ./tests/data/jobs

export DCMDICTPATH=./tests/dicom.dic

./build/bin/storescp

./build/bin/storescp \
    -ll "warn" \
    --aetitle "SubtleEDGE" \
    --fork \
    --output-directory \
    ./tests/data/jobs \
    --write-xfer-little \
    --sort-on-uid \
    --filename-extension \
    .dcm \
    --exec-on-sassoc \
    "./tests/onNEW.sh #u #a #c #r" \
    --exec-on-series \
    "./tests/onSERIES.sh #u #a #c #r #s #e" \
    --exec-on-eoassoc \
    "./tests/onEND.sh #u #a #c #r" \
    --max-pdu \
    131072 \
    18900