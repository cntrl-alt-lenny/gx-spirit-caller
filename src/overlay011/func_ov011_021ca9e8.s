; func_ov011_021ca9e8: C-32 cross-overlay BL wall — brief 192 recipe.
; Brief 197 Track A drain. 276 bytes; module:none BLs hand-encoded.

        .text
        .extern data_ov009_021adb9c
        .extern func_0202c0c0
        .extern func_ov000_021adbdc
        .extern func_ov000_021adc1c
        .extern func_ov000_021add44
        .extern func_ov011_021cd1fc
        .global func_ov011_021ca9e8
        .arm
func_ov011_021ca9e8:
        .word   0xe92d4070
        .word   0xe59f00f8
        .word   0xe59f40f8
        .word   0xe59012bc
        .word   0xe59002a0
        .word   0xe1a01c01
        .word   0xe3500000
        .word   0xe1a05c21
        .word   0x0a000022
        .word   0xe3500001
        .word   0x1a000031
        .word   0xe5942268
        .word   0xe5940270
        .word   0xe59f10d0
        .word   0xe1a03b82
        .word   0xe1a00c00
        .word   0xe1b00c20
        .word   0xe7d16e23
        .word   0x0a00000b
        bl      func_ov011_021cd1fc
        .word   0xe5942268
        .word   0xe59f10b4
        .word   0xe1a02b82
        .word   0xe7d11e22
        .word   0xe2862e4b
        .word   0xe0821001
        .word   0xe0800001
        bl      func_0202c0c0
        .word   0xe3a01000
        bl      func_ov000_021add44
        .word   0xea00001d
        .word   0xe1a00782
        .word   0xe1b00e20
        .word   0x1a000002
        bl      func_ov000_021adc1c
        bl      func_ov000_021adbdc
        .word   0xea000017
        .word   0xe28600af
        .word   0xe2800b01
        .word   0xe0800005
        bl      func_0202c0c0
        .word   0xe3a01000
        bl      func_ov000_021add44
        .word   0xea000010
        .word   0xe5940268
        .word   0xe1a01b80
        .word   0xe1b01e21
        .word   0x1a000003
        bl      func_ov000_021adc1c
        bl      func_ov000_021adbdc
        bl      data_ov009_021adb9c
        .word   0xea000008
        .word   0xe1a00980
        .word   0xe1510e20
        .word   0x0a000000
        bl      data_ov009_021adb9c
        .word   0xe28500b9
        .word   0xe2800b01
        bl      func_0202c0c0
        .word   0xe3a01000
        bl      func_ov000_021add44
        .word   0xe3a00003
        .word   0xe3a01000
        .word   0xebff9c10                      ; bl 0x021b1b2c (cross-overlay)
        .word   0xe8bd8070
        .word   0x021d4000                      ; load to 0x021d4000 (mod=overlay(11))
        .word   0x021d403c                      ; load to 0x021d403c (mod=overlay(11))
        .word   0x021d3583                      ; load to 0x021d3583 (mod=overlay(11))
        .word   0x021d358b                      ; load to 0x021d358b (mod=overlay(11))
