; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 29 .bss symbols, range 0x02194340..0x0219adcc.
; split from the original single-TU cluster to carve out matched symbols (fragment 3 of 5, cm-bss-convert-1).

        .bss

        .global data_02194340
data_02194340:
        .space 0xc
        .global data_0219434c
data_0219434c:
        .space 0xc
        .global data_02194358
data_02194358:
        .space 0x1c
        .global data_02194374
data_02194374:
        .space 0x30c0
        .global data_02197434
data_02197434:
        .space 0x8
        .global data_0219743c
data_0219743c:
        .space 0x40
        .global data_0219747c
data_0219747c:
        .space 0xfb8
        .global data_02198434
data_02198434:
        .space 0xb4
        .global data_021984e8
data_021984e8:
        .space 0x234c
        .global data_0219a834
data_0219a834:
        .space 0x78
        .global data_0219a8ac
data_0219a8ac:
        .space 0x30
        .global data_0219a8dc
data_0219a8dc:
        .space 0x8
        .global data_0219a8e4
data_0219a8e4:
        .space 0x0
        .global data_0219a8e4_alias
data_0219a8e4_alias:
        .space 0x8
        .global data_0219a8ec
data_0219a8ec:
        .space 0x8
        .global data_0219a8f4
data_0219a8f4:
        .space 0x20
        .global data_0219a914
data_0219a914:
        .space 0x10
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
