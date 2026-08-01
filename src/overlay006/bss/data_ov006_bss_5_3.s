; Cluster A .bss wave 2 — overlay 6 (brief 118 self-extend).
; mwasmarm syntax + dsd LCF auto-routing.
; 3 .bss symbols, range 0x0225df2c..0x0225df3c.
; split from the original single-TU cluster to carve out matched symbols (fragment 5 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-3).
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-5).

        .bss

        .global data_ov006_0225df2c
data_ov006_0225df2c:
        .space 0x2
        .global data_ov006_0225df2e
data_ov006_0225df2e:
        .space 0x2
        .global data_ov006_0225df30
data_ov006_0225df30:
        .space 0xc
