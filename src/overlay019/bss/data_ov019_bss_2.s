; Cluster A wave 4 — overlay 019 (brief 139).
; mwasmarm syntax + dsd LCF auto-routing.
; 3 .bss symbols, range 0x021b6334..0x021b6848.
; split from the original single-TU cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-4).

        .bss

        .global data_ov019_021b6334
data_ov019_021b6334:
        .space 0x500
        .global data_ov019_021b6834
data_ov019_021b6834:
        .space 0x8
        .global data_ov019_021b683c
data_ov019_021b683c:
        .space 0xc
