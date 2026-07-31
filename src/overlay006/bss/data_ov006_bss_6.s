; Cluster A .bss wave 2 — overlay 6 (brief 118 self-extend).
; mwasmarm syntax + dsd LCF auto-routing.
; 3 .bss symbols, range 0x021d0afc..0x021d6ed0.
; split from the original single-TU cluster to carve out matched symbols (fragment 1 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-2).

        .bss

        .global data_ov006_021d0afc
data_ov006_021d0afc:
        .space 0x50
        .global data_ov006_021d0b4c
data_ov006_021d0b4c:
        .space 0xdcd
        .global data_ov006_021d1919
data_ov006_021d1919:
        .space 0x55b7
