; Cluster A wave 4 — overlay 010 (brief 139).
; mwasmarm syntax + dsd LCF auto-routing.
; 6 .bss symbols, range 0x021b99ec..0x021ba000.
; split from the original cluster to carve out matched symbols (fragment 3 of 3, cm-bss-convert-3).

        .bss

        .global data_ov010_021b99ec
data_ov010_021b99ec:
        .space 0x4
        .global data_ov010_021b99f0
data_ov010_021b99f0:
        .space 0x4
        .global data_ov010_021b99f4
data_ov010_021b99f4:
        .space 0x4
        .global data_ov010_021b99f8
data_ov010_021b99f8:
        .space 0x6c
        .global data_ov010_021b9a64
data_ov010_021b9a64:
        .space 0x188
        .global data_ov010_021b9bec
data_ov010_021b9bec:
        .space 0x414
