; Cluster A .bss wave 2 — overlay 4 (brief 118).
; mwasmarm syntax + dsd LCF auto-routing.
; 3 .bss symbols, range 0x02291930..0x02291d38.
; split from the original cluster to carve out matched symbols (fragment 2 of 3, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-3).

        .bss

        .global data_ov004_02291930
data_ov004_02291930:
        .space 0x26
        .global data_ov004_02291956
data_ov004_02291956:
        .space 0x3da
        .global data_ov004_02291d30
data_ov004_02291d30:
        .space 0x8
