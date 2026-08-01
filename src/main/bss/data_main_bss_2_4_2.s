; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 9 .bss symbols, range 0x02186b60..0x0218fd10.
; split from the original single-TU cluster to carve out matched symbols (fragment 2 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-3).
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-5).
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-6).

        .bss

        .global data_02186b60
data_02186b60:
        .space 0x68
        .global data_02186bc8
data_02186bc8:
        .space 0x1800
        .global data_021883c8
data_021883c8:
        .space 0x1800
        .global data_02189bc8
data_02189bc8:
        .space 0x1800
        .global data_0218b3c8
data_0218b3c8:
        .space 0x1800
        .global data_0218cbc8
data_0218cbc8:
        .space 0x1000
        .global data_0218dbc8
data_0218dbc8:
        .space 0x940
        .global data_0218e508
data_0218e508:
        .space 0x17c0
        .global data_0218fcc8
data_0218fcc8:
        .space 0x48
