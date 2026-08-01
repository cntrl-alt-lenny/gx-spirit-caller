; Cluster A wave 4 — overlay 005 (brief 139).
; mwasmarm syntax + dsd LCF auto-routing.
; 6 .bss symbols, range 0x021b1d40..0x021b1e4c.
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-4).

        .bss

        .global data_ov005_021b1d40
data_ov005_021b1d40:
        .space 0xc
        .global data_ov005_021b1d4c
data_ov005_021b1d4c:
        .space 0x5c
        .global data_ov005_021b1da8
data_ov005_021b1da8:
        .space 0xc
        .global data_ov005_021b1db4
data_ov005_021b1db4:
        .space 0x1c
        .global data_ov005_021b1dd0
data_ov005_021b1dd0:
        .space 0xc
        .global data_ov005_021b1ddc
data_ov005_021b1ddc:
        .space 0x70
