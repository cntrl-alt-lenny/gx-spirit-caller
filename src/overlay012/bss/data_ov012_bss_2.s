; Cluster A wave 4 — overlay 012 (brief 139).
; mwasmarm syntax + dsd LCF auto-routing.
; 2 .bss symbols, range 0x021cc934..0x021ccc00.
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-4).

        .bss

        .global data_ov012_021cc934
data_ov012_021cc934:
        .space 0x290
        .global data_ov012_021ccbc4
data_ov012_021ccbc4:
        .space 0x3c
