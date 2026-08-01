; Cluster A .bss wave 3 — overlay 014 (brief 120).
; mwasmarm syntax + dsd LCF auto-routing.
; 2 .bss symbols, range 0x02235150..0x02235180.
; split from the original cluster to carve out matched symbols (fragment 3 of 3, cm-bss-convert-6).

        .bss

        .global data_ov014_02235150
data_ov014_02235150:
        .space 0xc
        .global data_ov014_0223515c
data_ov014_0223515c:
        .space 0x24
