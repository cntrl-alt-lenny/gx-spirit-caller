; Cluster A wave 4 — overlay 019 (brief 139).
; mwasmarm syntax + dsd LCF auto-routing.
; 2 .bss symbols, range 0x021b6914..0x021b6940.
; split from the original single-TU cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-4).

        .bss

        .global data_ov019_021b6914
data_ov019_021b6914:
        .space 0xc
        .global data_ov019_021b6920
data_ov019_021b6920:
        .space 0x20
