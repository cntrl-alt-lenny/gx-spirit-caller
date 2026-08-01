; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 3 .bss symbols, range 0x0219000c..0x0219060c.
; split from the original single-TU cluster to carve out matched symbols (fragment 2 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-3).
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-5).

        .bss

        .global data_0219000c
data_0219000c:
        .space 0x1b0
        .global data_021901bc
data_021901bc:
        .space 0x50
        .global data_0219020c
data_0219020c:
        .space 0x400
