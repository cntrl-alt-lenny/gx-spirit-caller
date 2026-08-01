; Cluster A .bss wave 3 — overlay 009 (brief 120).
; mwasmarm syntax + dsd LCF auto-routing.
; 3 .bss symbols, range 0x021adbc0..0x021adc00.
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-6).

        .bss

        .global data_ov009_021adbc0
data_ov009_021adbc0:
        .space 0xc
        .global data_ov009_021adbcc
data_ov009_021adbcc:
        .space 0x28
        .global data_ov009_021adbf4
data_ov009_021adbf4:
        .space 0xc
