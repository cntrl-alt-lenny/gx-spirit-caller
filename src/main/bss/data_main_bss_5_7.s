; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 27 .bss symbols, range 0x021a8d20..0x021a9928.
; split from the original single-TU cluster to carve out matched symbols (fragment 5 of 5, cm-bss-convert-1).
; split from the original cluster to carve out matched symbols (fragment 7 of 8, cm-bss-convert-2).

        .bss

        .global data_021a8d20
data_021a8d20:
        .space 0x4
        .global data_021a8d24
data_021a8d24:
        .space 0x4
        .global data_021a8d28
data_021a8d28:
        .space 0x4
        .global data_021a8d2c
data_021a8d2c:
        .space 0x4
        .global data_021a8d30
data_021a8d30:
        .space 0x20
        .global data_021a8d50
data_021a8d50:
        .space 0x28
        .global data_021a8d78
data_021a8d78:
        .space 0x14
        .global data_021a8d8c
data_021a8d8c:
        .space 0x10
        .global data_021a8d9c
data_021a8d9c:
        .space 0x24
        .global data_021a8dc0
data_021a8dc0:
        .space 0xa00
        .global data_021a97c0
data_021a97c0:
        .space 0x80
        .global data_021a9840
data_021a9840:
        .space 0x4
        .global data_021a9844
data_021a9844:
        .space 0x4
        .global data_021a9848
data_021a9848:
        .space 0x4
        .global data_021a984c
data_021a984c:
        .space 0x4
        .global data_021a9850
data_021a9850:
        .space 0x30
        .global data_021a9880
data_021a9880:
        .space 0x8
        .global data_021a9888
data_021a9888:
        .space 0x6
        .global data_021a988e
data_021a988e:
        .space 0x2
        .global data_021a9890
data_021a9890:
        .space 0x60
        .global data_021a98f0
data_021a98f0:
        .space 0x4
        .global data_021a98f4
data_021a98f4:
        .space 0x4
        .global data_021a98f8
data_021a98f8:
        .space 0x4
        .global data_021a98fc
data_021a98fc:
        .space 0x4
        .global data_021a9900
data_021a9900:
        .space 0x20
        .global data_021a9920
data_021a9920:
        .space 0x4
        .global data_021a9924
data_021a9924:
        .space 0x4
