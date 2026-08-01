; Cluster A .bss wave 2 — overlay 6 (brief 118 self-extend).
; mwasmarm syntax + dsd LCF auto-routing.
; 6 .bss symbols, range 0x0225dc14..0x0225deb4.
; split from the original single-TU cluster to carve out matched symbols (fragment 5 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-3).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-5).

        .bss

        .global data_ov006_0225dc14
data_ov006_0225dc14:
        .space 0xc
        .global data_ov006_0225dc20
data_ov006_0225dc20:
        .space 0x14
        .global data_ov006_0225dc34
data_ov006_0225dc34:
        .space 0x230
        .global data_ov006_0225de64
data_ov006_0225de64:
        .space 0xc
        .global data_ov006_0225de70
data_ov006_0225de70:
        .space 0x38
        .global data_ov006_0225dea8
data_ov006_0225dea8:
        .space 0xc
