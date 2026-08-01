; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 3 .bss symbols, range 0x021a088c..0x021a089c.
; split from the original single-TU cluster to carve out matched symbols (fragment 5 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 1 of 8, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 6 of 6, cm-bss-convert-3).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-8).

        .bss

        .global data_021a088c
data_021a088c:
        .space 0x4
        .global data_021a0890
data_021a0890:
        .space 0x4
        .global data_021a0894
data_021a0894:
        .space 0x8
