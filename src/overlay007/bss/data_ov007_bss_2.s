; Cluster A wave 4 — overlay 007 (brief 139).
; mwasmarm syntax + dsd LCF auto-routing.
; 2 .bss symbols, range 0x02233520..0x02233580.
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-6).

        .bss

        .global data_ov007_02233520
data_ov007_02233520:
        .space 0xc
        .global data_ov007_0223352c
data_ov007_0223352c:
        .space 0x54
