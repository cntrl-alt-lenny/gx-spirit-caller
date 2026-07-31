; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 10 .bss symbols, range 0x0218fe80..0x0219060c.
; split from the original single-TU cluster to carve out matched symbols (fragment 2 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-3).

        .bss

        .global data_0218fe80
data_0218fe80:
        .space 0x3c
        .global data_0218febc
data_0218febc:
        .space 0x20
        .global data_0218fedc
data_0218fedc:
        .space 0x18
        .global data_0218fef4
data_0218fef4:
        .space 0x18
        .global data_0218ff0c
data_0218ff0c:
        .space 0x40
        .global data_0218ff4c
data_0218ff4c:
        .space 0x40
        .global data_0218ff8c
data_0218ff8c:
        .space 0x80
        .global data_0219000c
data_0219000c:
        .space 0x1b0
        .global data_021901bc
data_021901bc:
        .space 0x50
        .global data_0219020c
data_0219020c:
        .space 0x400
