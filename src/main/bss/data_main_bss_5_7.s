; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 4 .bss symbols, range 0x021a8d20..0x021a8d30.
; split from the original single-TU cluster to carve out matched symbols (fragment 5 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 7 of 8, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-8).

        .bss

        .global data_021a8d20
data_021a8d20:
        .space 0x4
        .global data_021a8d24
data_021a8d24:
        .space 0x4
        .global data_021a8d28
data_021a8d28:
        .space 0x4
        .global data_021a8d2c
data_021a8d2c:
        .space 0x4
