; Cluster A .bss wave 2 — overlay 6 (brief 118 self-extend).
; mwasmarm syntax + dsd LCF auto-routing.
; 5 .bss symbols, range 0x0225cb50..0x0225cbb8.
; split from the original single-TU cluster to carve out matched symbols (fragment 4 of 5, cm-bss-convert-1).

        .bss

        .global data_ov006_0225cb50
data_ov006_0225cb50:
        .space 0xc
        .global data_ov006_0225cb5c
data_ov006_0225cb5c:
        .space 0x20
        .global data_ov006_0225cb7c
data_ov006_0225cb7c:
        .space 0xc
        .global data_ov006_0225cb88
data_ov006_0225cb88:
        .space 0x10
        .global data_ov006_0225cb98
data_ov006_0225cb98:
        .space 0x20
