; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 8 .bss symbols, range 0x021a08bc..0x021a09f4.
; split from the original single-TU cluster to carve out matched symbols (fragment 5 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 1 of 8, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 6 of 6, cm-bss-convert-3).
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-8).

        .bss

        .global data_021a08bc
data_021a08bc:
        .space 0x4
        .global data_021a08c0
data_021a08c0:
        .space 0x10
        .global data_021a08d0
data_021a08d0:
        .space 0x4
        .global data_021a08d4
data_021a08d4:
        .space 0xc
        .global data_021a08e0
data_021a08e0:
        .space 0x4
        .global data_021a08e4
data_021a08e4:
        .space 0xc
        .global data_021a08f0
data_021a08f0:
        .space 0x4
        .global data_021a08f4
data_021a08f4:
        .space 0x100
