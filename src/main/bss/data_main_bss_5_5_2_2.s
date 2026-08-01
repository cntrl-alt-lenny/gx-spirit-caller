; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 3 .bss symbols, range 0x021a522c..0x021a5340.
; split from the original single-TU cluster to carve out matched symbols (fragment 5 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 5 of 8, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-6).
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-8).

        .bss

        .global data_021a522c
data_021a522c:
        .space 0x20
        .global data_021a524c
data_021a524c:
        .space 0x54
        .global data_021a52a0
data_021a52a0:
        .space 0xa0
