; Cluster A wave 4 — overlay 011 (brief 139).
; mwasmarm syntax + dsd LCF auto-routing.
; 2 .bss symbols, range 0x021d4800..0x021d4820.
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-3).

        .bss

        .global data_ov011_021d4800
data_ov011_021d4800:
        .space 0xc
        .global data_ov011_021d480c
data_ov011_021d480c:
        .space 0x14
