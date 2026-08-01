; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 4 .bss symbols, range 0x0219ed40..0x0219ed54.
; split from the original single-TU cluster to carve out matched symbols (fragment 5 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 1 of 8, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 2 of 6, cm-bss-convert-3).
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-8).

        .bss

        .global data_0219ed40
data_0219ed40:
        .space 0x8
        .global data_0219ed48
data_0219ed48:
        .space 0x4
        .global data_0219ed4c
data_0219ed4c:
        .space 0x4
        .global data_0219ed50
data_0219ed50:
        .space 0x4
