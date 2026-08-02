; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 10 .bss symbols, range 0x021a66dc..0x021a6734.
; split from the original single-TU cluster to carve out matched symbols (fragment 5 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 6 of 8, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-5).
; split from the original cluster to carve out matched symbols (fragment 2 of 3, cm-bss-convert-7).
; split from the original cluster to carve out matched symbols (fragment 3 of 3, cm-bss-convert-9).

        .bss

        .global data_021a66dc
data_021a66dc:
        .space 0x4
        .global data_021a66e0
data_021a66e0:
        .space 0x4
        .global data_021a66e4
data_021a66e4:
        .space 0x4
        .global data_021a66e8
data_021a66e8:
        .space 0x8
        .global data_021a66f0
data_021a66f0:
        .space 0x4
        .global data_021a66f4
data_021a66f4:
        .space 0x4
        .global data_021a66f8
data_021a66f8:
        .space 0x4
        .global data_021a66fc
data_021a66fc:
        .space 0x14
        .global data_021a6710
data_021a6710:
        .space 0x20
        .global data_021a6730
data_021a6730:
        .space 0x4
