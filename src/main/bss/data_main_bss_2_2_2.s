; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 6 .bss symbols, range 0x02192020..0x02193440.
; split from the original single-TU cluster to carve out matched symbols (fragment 2 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-6).

        .bss

        .global data_02192020
data_02192020:
        .space 0x2c0
        .global data_021922e0
data_021922e0:
        .space 0x820
        .global data_02192b00
data_02192b00:
        .space 0x820
        .global data_02193320
data_02193320:
        .space 0x20
        .global data_02193340
data_02193340:
        .space 0x40
        .global data_02193380
data_02193380:
        .space 0xc0
