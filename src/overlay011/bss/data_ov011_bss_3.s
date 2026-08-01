; Cluster A wave 4 — overlay 011 (brief 139).
; mwasmarm syntax + dsd LCF auto-routing.
; 5 .bss symbols, range 0x021d4218..0x021d4674.
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-3).
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-5).

        .bss

        .global data_ov011_021d4218
data_ov011_021d4218:
        .space 0x54
        .global data_ov011_021d426c
data_ov011_021d426c:
        .space 0x3f4
        .global data_ov011_021d4660
data_ov011_021d4660:
        .space 0x4
        .global data_ov011_021d4664
data_ov011_021d4664:
        .space 0xc
        .global data_ov011_021d4670
data_ov011_021d4670:
        .space 0x4
