; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 7 .bss symbols, range 0x021aa130..0x021aa4a0.
; split from the original single-TU cluster to carve out matched symbols (fragment 5 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 8 of 8, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-8).

        .bss

        .global data_021aa130
data_021aa130:
        .space 0x30
        .global data_021aa160
data_021aa160:
        .space 0x100
        .global data_021aa260
data_021aa260:
        .space 0x100
        .global data_021aa360
data_021aa360:
        .space 0x100
        .global data_021aa460
data_021aa460:
        .space 0x4
        .global data_021aa464
data_021aa464:
        .space 0x1c
        .global data_021aa480
data_021aa480:
        .space 0x20
