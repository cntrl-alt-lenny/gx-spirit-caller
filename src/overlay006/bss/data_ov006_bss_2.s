; Cluster A .bss wave 2 — overlay 6 (brief 118 self-extend).
; mwasmarm syntax + dsd LCF auto-routing.
; 11 .bss symbols, range 0x021dba08..0x0224f1c0.
; split from the original single-TU cluster to carve out matched symbols (fragment 2 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 1 of 5, cm-bss-convert-9).

        .bss

        .global data_ov006_021dba08
data_ov006_021dba08:
        .space 0x5f14
        .global data_ov006_021e191c
data_ov006_021e191c:
        .space 0x10001
        .global data_ov006_021f191d
data_ov006_021f191d:
        .space 0x10026
        .global data_ov006_02201943
data_ov006_02201943:
        .space 0xf699
        .global data_ov006_02210fdc
data_ov006_02210fdc:
        .space 0x96c
        .global data_ov006_02211948
data_ov006_02211948:
        .space 0xd6dc
        .global data_ov006_0221f024
data_ov006_0221f024:
        .space 0x2929
        .global data_ov006_0222194d
data_ov006_0222194d:
        .space 0x10001
        .global data_ov006_0223194e
data_ov006_0223194e:
        .space 0x10001
        .global data_ov006_0224194f
data_ov006_0224194f:
        .space 0xd861
        .global data_ov006_0224f1b0
data_ov006_0224f1b0:
        .space 0x10
