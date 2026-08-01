; Cluster A wave 4 — overlay 005 (brief 139).
; mwasmarm syntax + dsd LCF auto-routing.
; 4 .bss symbols, range 0x021b1e60..0x021b2280.
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-4).

        .bss

        .global data_ov005_021b1e60
data_ov005_021b1e60:
        .space 0xc
        .global data_ov005_021b1e6c
data_ov005_021b1e6c:
        .space 0x3d4
        .global data_ov005_021b2240
data_ov005_021b2240:
        .space 0xc
        .global data_ov005_021b224c
data_ov005_021b224c:
        .space 0x34
