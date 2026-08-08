; Cluster A .bss wave 2 — overlay 6 (brief 118 self-extend).
; mwasmarm syntax + dsd LCF auto-routing.
; 1 .bss symbol, range 0x0224f290..0x0224f2ac.
; split from the original single-TU cluster to carve out matched symbols (fragment 2 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 4 of 5, cm-bss-convert-9).
; split further to carve out data_ov006_0224f2ac (cm-restock-carve-1).

        .bss

        .global data_ov006_0224f290
data_ov006_0224f290:
        .space 0x1c
