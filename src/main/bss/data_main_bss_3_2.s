; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 12 .bss symbols, range 0x0219a924..0x0219adcc.
; split from the original single-TU cluster to carve out matched symbols (fragment 3 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 2 of 2, cm-bss-convert-2).

        .bss

        .global data_0219a924
data_0219a924:
        .space 0x0
        .global data_0219a924_alias
data_0219a924_alias:
        .space 0x8
        .global data_0219a92c
data_0219a92c:
        .space 0x0
        .global data_0219a92c_alias
data_0219a92c_alias:
        .space 0x8
        .global data_0219a934
data_0219a934:
        .space 0x0
        .global data_0219a934_alias
data_0219a934_alias:
        .space 0x8
        .global data_0219a93c
data_0219a93c:
        .space 0xc
        .global data_0219a948
data_0219a948:
        .space 0x400
        .global data_0219ad48
data_0219ad48:
        .space 0x30
        .global data_0219ad78
data_0219ad78:
        .space 0x40
        .global data_0219adb8
data_0219adb8:
        .space 0x0
        .global data_0219adb8_alias
data_0219adb8_alias:
        .space 0x14
