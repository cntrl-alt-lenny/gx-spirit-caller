; Cluster A .bss wave 3 — overlay 021 (brief 120).
; mwasmarm syntax + dsd LCF auto-routing.
; 2 .bss symbols, range 0x021acfb0..0x021ad7d4.
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-3).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-4).

        .bss

        .global data_ov021_021acfb0
data_ov021_021acfb0:
        .space 0x6b0
        .global data_ov021_021ad660
data_ov021_021ad660:
        .space 0x174
