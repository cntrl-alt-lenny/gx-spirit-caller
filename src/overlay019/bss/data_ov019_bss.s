; Cluster A wave 4 — overlay 019 (brief 139).
; mwasmarm syntax + dsd LCF auto-routing.
; 2 .bss symbols, range 0x021b5e28..0x021b5e70.
; split from the original single-TU cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-1).

        .bss

        .global data_ov019_021b5e28
data_ov019_021b5e28:
        .space 0x3c
        .global data_ov019_021b5e64
data_ov019_021b5e64:
        .space 0xc
