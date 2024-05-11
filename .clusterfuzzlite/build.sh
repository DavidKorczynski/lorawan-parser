#!/bin/bash
autoreconf -fi
./configure
make

$CC $CFLAGS $LIB_FUZZING_ENGINE $SRC/fuzzer.c -Wl,--whole-archive $SRC/lorawan-parser/lw/.libs/liblorawan.a -Wl,--whole-archive $SRC/lorawan-parser/lib/libloragw$SRC/.libs/libloragw.a -Wl,--whole-archive $SRC/lorawan-parser/lib/.libs/lib.a -Wl,--allow-multiple-definition -I$SRC/lorawan-parser/util/parser -I$SRC/lorawan-parser/lib/libloragw/inc -I$SRC/lorawan-parser/lib -I$SRC/lorawan-parser/lw  -o $OUT/fuzzer
