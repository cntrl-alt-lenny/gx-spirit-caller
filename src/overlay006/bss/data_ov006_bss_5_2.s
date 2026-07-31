; Cluster A .bss wave 2 — overlay 6 (brief 118 self-extend).
; mwasmarm syntax + dsd LCF auto-routing.
; 6 .bss symbols, range 0x0225e05c..0x0225e1a0.
; split from the original single-TU cluster to carve out matched symbols (fragment 5 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-3).

        .bss

        .global data_ov006_0225e05c
data_ov006_0225e05c:
        .space 0xc
        .global data_ov006_0225e068
data_ov006_0225e068:
        .space 0x8c
        .global data_ov006_0225e0f4
data_ov006_0225e0f4:
        .space 0xc
        .global data_ov006_0225e100
data_ov006_0225e100:
        .space 0x2c
        .global data_ov006_0225e12c
data_ov006_0225e12c:
        .space 0xc
        .global data_ov006_0225e138
data_ov006_0225e138:
        .space 0x68
