; Cluster A wave 4 — overlay 016 (brief 139).
; mwasmarm syntax + dsd LCF auto-routing.
; 4 .bss symbols, range 0x021ba740..0x021babec.
; split from the original single-TU cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-8).

        .bss

        .global data_ov016_021ba740
data_ov016_021ba740:
        .space 0x3f8
        .global data_ov016_021bab38
data_ov016_021bab38:
        .space 0xc
        .global data_ov016_021bab44
data_ov016_021bab44:
        .space 0x9c
        .global data_ov016_021babe0
data_ov016_021babe0:
        .space 0xc
