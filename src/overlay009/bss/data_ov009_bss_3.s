; Cluster A .bss wave 3 — overlay 009 (brief 120).
; mwasmarm syntax + dsd LCF auto-routing.
; 2 .bss symbols, range 0x021adc48..0x021adc94.
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-6).

        .bss

        .global data_ov009_021adc48
data_ov009_021adc48:
        .space 0xc
        .global data_ov009_021adc54
data_ov009_021adc54:
        .space 0x40
