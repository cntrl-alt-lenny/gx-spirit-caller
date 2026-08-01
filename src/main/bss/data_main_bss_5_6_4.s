; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 17 .bss symbols, range 0x021a674c..0x021a8288.
; split from the original single-TU cluster to carve out matched symbols (fragment 5 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 6 of 8, cm-bss-convert-2).
; split from the original cluster to carve out matched symbols (fragment 1 of 2, cm-bss-convert-5).
; split from the original cluster to carve out matched symbols (fragment 3 of 3, cm-bss-convert-7).

        .bss

        .global data_021a674c
data_021a674c:
        .space 0x4
        .global data_021a6750
data_021a6750:
        .space 0x4
        .global data_021a6754
data_021a6754:
        .space 0x4
        .global data_021a6758
data_021a6758:
        .space 0x4
        .global data_021a675c
data_021a675c:
        .space 0x4
        .global data_021a6760
data_021a6760:
        .space 0x4
        .global data_021a6764
data_021a6764:
        .space 0x4
        .global data_021a6768
data_021a6768:
        .space 0x4
        .global data_021a676c
data_021a676c:
        .space 0x4
        .global data_021a6770
data_021a6770:
        .space 0x30
        .global data_021a67a0
data_021a67a0:
        .space 0x280
        .global data_021a6a20
data_021a6a20:
        .space 0x1000
        .global data_021a7a20
data_021a7a20:
        .space 0x7e8
        .global data_021a8208
data_021a8208:
        .space 0x18
        .global data_021a8220
data_021a8220:
        .space 0x60
        .global data_021a8280
data_021a8280:
        .space 0x4
        .global data_021a8284
data_021a8284:
        .space 0x4
