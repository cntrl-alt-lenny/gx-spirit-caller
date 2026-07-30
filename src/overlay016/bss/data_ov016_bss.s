; Cluster A wave 4 — overlay 016 (brief 139).
; mwasmarm syntax + dsd LCF auto-routing.
; 2 .bss symbols, range 0x021b9740..0x021b9784.
; split from the original single-TU cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-1).

        .bss

        .global data_ov016_021b9740
data_ov016_021b9740:
        .space 0x8
        .global data_ov016_021b9748
data_ov016_021b9748:
        .space 0x3c
