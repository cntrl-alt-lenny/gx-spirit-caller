; Cluster A .bss wave 3 — overlay 014 (brief 120).
; mwasmarm syntax + dsd LCF auto-routing.
; 2 .bss symbols, range 0x022350e0..0x022350f4.
; split from the original cluster to carve out matched symbols (fragment 2 of 3, cm-bss-convert-6).

        .bss

        .global data_ov014_022350e0
data_ov014_022350e0:
        .space 0x8
        .global data_ov014_022350e8
data_ov014_022350e8:
        .space 0xc
