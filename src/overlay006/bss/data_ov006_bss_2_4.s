; Cluster A .bss wave 2 — overlay 6 (brief 118 self-extend).
; mwasmarm syntax + dsd LCF auto-routing.
; 3 .bss symbols, range 0x0224f290..0x0224f2f4.
; split from the original single-TU cluster to carve out matched symbols (fragment 2 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 4 of 5, cm-bss-convert-9).

        .bss

        .global data_ov006_0224f290
data_ov006_0224f290:
        .space 0x1c
        .global data_ov006_0224f2ac
data_ov006_0224f2ac:
        .space 0x3c
        .global data_ov006_0224f2e8
data_ov006_0224f2e8:
        .space 0xc
