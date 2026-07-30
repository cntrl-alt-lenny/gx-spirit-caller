; Cluster A .bss wave 2 — overlay 6 (brief 118 self-extend).
; mwasmarm syntax + dsd LCF auto-routing.
; 3 .bss symbols, range 0x0225bee0..0x0225c4dc.
; split from the original single-TU cluster to carve out matched symbols (fragment 3 of 5, cm-bss-convert-1).

        .bss

        .global data_ov006_0225bee0
data_ov006_0225bee0:
        .space 0x1
        .global data_ov006_0225bee1
data_ov006_0225bee1:
        .space 0x5ef
        .global data_ov006_0225c4d0
data_ov006_0225c4d0:
        .space 0xc
