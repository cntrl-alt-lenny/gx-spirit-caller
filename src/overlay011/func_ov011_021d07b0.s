; func_ov011_021d07b0: C-32 cross-overlay BL wall — brief 192 recipe.
; Brief 197 Track A drain. 212 bytes; module:none BLs hand-encoded.

        .text
        .extern data_ov006_021cbf28
        .extern data_ov012_021cc344
        .extern func_02005ca0
        .extern func_02005e20
        .extern func_ov000_021ab8f8
        .extern func_ov011_021ca538
        .extern func_ov011_021cbc1c
        .extern func_ov011_021cc814
        .extern func_ov011_021cc8bc
        .extern func_ov011_021ccb6c
        .extern func_ov011_021ce50c
        .extern func_ov011_021cf0c8
        .extern func_ov011_021cf228
        .extern func_ov011_021cf640
        .extern func_ov011_021cffe4
        .extern func_ov011_021d02a4
        .extern func_ov011_021d12c0
        .extern func_ov011_021d1884
        .extern func_ov011_021d1d30
        .global func_ov011_021d07b0
        .arm
func_ov011_021d07b0:
        .word   0xe92d4038
        .word   0xe59f00bc
        .word   0xe59f40bc
        .word   0xe5901140
        .word   0xe3a05000
        .word   0xe3811040
        .word   0xe5801140
        bl      func_ov011_021d1d30
        .word   0xe59f00a8
        .word   0xe59002a0
        .word   0xe3500001
        .word   0x1a000001
        bl      func_ov011_021cbc1c
        bl      data_ov006_021cbf28
        bl      data_ov012_021cc344
        bl      func_ov011_021cf0c8
        bl      func_ov011_021d12c0
        bl      func_ov011_021d1884
        bl      func_ov011_021cf228
        bl      func_ov011_021ce50c
        .word   0xe5940274
        .word   0xe1a00980
        .word   0xe1b00e20
        .word   0x0a000002
        .word   0xe3500001
        .word   0x0a000003
        .word   0xea000004
        bl      func_ov011_021cffe4
        .word   0xe1a05000
        .word   0xea000001
        bl      func_ov011_021d02a4
        .word   0xe1a05000
        bl      func_ov011_021cf640
        bl      func_ov011_021ccb6c
        .word   0xe5940288
        bl      func_ov011_021ca538
        .word   0xebff849b                      ; bl 0x021b1ab4 (cross-overlay)
        bl      func_ov011_021cc8bc
        bl      func_ov011_021cc814
        .word   0xe3a00001
        bl      func_02005e20
        .word   0xe3a00002
        bl      func_02005e20
        .word   0xe3a00001
        bl      func_02005ca0
        .word   0xe3a00002
        bl      func_02005ca0
        bl      func_ov000_021ab8f8
        .word   0xe1a00005
        .word   0xe8bd8038
        .word   0x021c73e4                      ; load to 0x021c73e4 (mod=overlays(0,7,9,14,21))
        .word   0x021d403c                      ; load to 0x021d403c (mod=overlay(11))
        .word   0x021d4000                      ; load to 0x021d4000 (mod=overlay(11))
