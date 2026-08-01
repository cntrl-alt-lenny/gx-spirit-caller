; Cluster A .bss wave 3 — overlay 021 (brief 120).
; mwasmarm syntax + dsd LCF auto-routing.
; 1 .bss symbols, range 0x021ace8c..0x021acec8.
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-3).

        .bss

        .global data_ov021_021ace8c
data_ov021_021ace8c:
        .space 0x3c
