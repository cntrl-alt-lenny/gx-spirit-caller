; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 1 .bss symbols, range 0x021a1374..0x021a1474.
; split from the original single-TU cluster to carve out matched symbols (fragment 5 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 3 of 8, cm-bss-convert-2).

        .bss

        .global data_021a1374
data_021a1374:
        .space 0x100
