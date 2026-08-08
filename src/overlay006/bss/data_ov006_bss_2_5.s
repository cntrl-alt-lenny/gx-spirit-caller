; Cluster A .bss wave 2 — overlay 6 (brief 118 self-extend).
; mwasmarm syntax + dsd LCF auto-routing.
; 1 .bss symbol, range 0x0224f330..0x0224f344.
; split from the original single-TU cluster to carve out matched symbols (fragment 2 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 5 of 5, cm-bss-convert-9).
; split further to carve out data_ov006_0224f344 (cm-restock-carve-1).

        .bss

        .global data_ov006_0224f330
data_ov006_0224f330:
        .space 0x14
