; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 4 .bss symbols, range 0x021a5800..0x021a5d18.
; split from the original single-TU cluster to carve out matched symbols (fragment 5 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 6 of 8, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-5).
; split from the original cluster to carve out matched symbols (fragment 1 of 3, cm-bss-convert-7).

        .bss

        .global data_021a5800
data_021a5800:
        .space 0x4
        .global data_021a5804
data_021a5804:
        .space 0x3c
        .global data_021a5840
data_021a5840:
        .space 0x4
        .global data_021a5844
data_021a5844:
        .space 0x4d4
