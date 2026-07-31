; Cluster A .bss wave 1 — main module residue (after 10-symbol pilot at 0x02102c60).
; Per brief 116. mwasmarm syntax + dsd LCF auto-routing.
;
; 33 .bss symbols, range 0x02102d44..0x02104f58.
; split from the original single-TU cluster to carve out matched symbols (fragment 1 of 5, cm-bss-convert-1).

        .bss

        .global data_02102d44
data_02102d44:
        .space 0x8
        .global data_02102d4c
data_02102d4c:
        .space 0xd94
        .global data_02103ae0
data_02103ae0:
        .space 0x18
        .global data_02103af8
data_02103af8:
        .space 0x254
        .global data_02103d4c
data_02103d4c:
        .space 0x20
        .global data_02103d6c
data_02103d6c:
        .space 0x8
        .global data_02103d74
data_02103d74:
        .space 0x2c
        .global data_02103da0
data_02103da0:
        .space 0x4
        .global data_02103da4
data_02103da4:
        .space 0x4
        .global data_02103da8
data_02103da8:
        .space 0x25b
        .global data_02104003
data_02104003:
        .space 0xa9
        .global data_021040ac
data_021040ac:
        .space 0xaf8
        .global data_02104ba4
data_02104ba4:
        .space 0x8
        .global data_02104bac
data_02104bac:
        .space 0x94
        .global data_02104c40
data_02104c40:
        .space 0x28
        .global data_02104c68
data_02104c68:
        .space 0x8
        .global data_02104c70
data_02104c70:
        .space 0x8
        .global data_02104c78
data_02104c78:
        .space 0x2
        .global data_02104c7a
data_02104c7a:
        .space 0x1a
        .global data_02104c94
data_02104c94:
        .space 0x1a
        .global data_02104cae
data_02104cae:
        .space 0x2
        .global data_02104cb0
data_02104cb0:
        .space 0x34
        .global data_02104ce4
data_02104ce4:
        .space 0x8
        .global data_02104cec
data_02104cec:
        .space 0xc
        .global data_02104cf8
data_02104cf8:
        .space 0xb4
        .global data_02104dac
data_02104dac:
        .space 0x100
        .global data_02104eac
data_02104eac:
        .space 0x70
        .global data_02104f1c
data_02104f1c:
        .space 0x0
        .global data_02104f1c_alias
data_02104f1c_alias:
        .space 0x20
        .global data_02104f3c
data_02104f3c:
        .space 0x10
        .global data_02104f4c
data_02104f4c:
        .space 0x4
        .global data_02104f50
data_02104f50:
        .space 0x4
        .global data_02104f54
data_02104f54:
        .space 0x4
