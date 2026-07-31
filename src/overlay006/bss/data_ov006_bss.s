; Cluster A .bss wave 2 — overlay 6 (brief 118 self-extend).
; mwasmarm syntax + dsd LCF auto-routing.
; 8 .bss symbols, range 0x021cf140..0x021d6ed0.
; split from the original single-TU cluster to carve out matched symbols (fragment 1 of 5, cm-bss-convert-1).

        .bss

        .global data_ov006_021cf140
data_ov006_021cf140:
        .space 0x18
        .global data_ov006_021cf158
data_ov006_021cf158:
        .space 0x1c
        .global data_ov006_021cf174
data_ov006_021cf174:
        .space 0x3c
        .global data_ov006_021cf1b0
data_ov006_021cf1b0:
        .space 0x104d
        .global data_ov006_021d01fd
data_ov006_021d01fd:
        .space 0x8ff
        .global data_ov006_021d0afc
data_ov006_021d0afc:
        .space 0x50
        .global data_ov006_021d0b4c
data_ov006_021d0b4c:
        .space 0xdcd
        .global data_ov006_021d1919
data_ov006_021d1919:
        .space 0x55b7
