; Cluster A .bss wave 2 — overlay 6 (brief 118 self-extend).
; mwasmarm syntax + dsd LCF auto-routing.
; 1 .bss symbols, range 0x0224f1fc..0x0224f20c.
; split from the original single-TU cluster to carve out matched symbols (fragment 2 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 2 of 5, cm-bss-convert-9).

        .bss

        .global data_ov006_0224f1fc
data_ov006_0224f1fc:
        .space 0x10
