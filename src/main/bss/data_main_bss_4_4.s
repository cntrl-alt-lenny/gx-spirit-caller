; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 5 .bss symbols, range 0x0219b39c..0x0219b490.
; split from the original single-TU cluster to carve out matched symbols (fragment 4 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-4).
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-7).

        .bss

        .global data_0219b39c
data_0219b39c:
        .space 0x18
        .global data_0219b3b4
data_0219b3b4:
        .space 0x1c
        .global data_0219b3d0
data_0219b3d0:
        .space 0xc
        .global data_0219b3dc
data_0219b3dc:
        .space 0x24
        .global data_0219b400
data_0219b400:
        .space 0x90
