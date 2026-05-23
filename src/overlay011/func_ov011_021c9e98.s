; func_ov011_021c9e98: C-32 cross-overlay BL wall — brief 192 recipe.
; Brief 197 Track A drain. 420 bytes; module:none BLs hand-encoded.

        .text
        .extern GetSystemWork
        .extern func_020139b4
        .extern func_ov011_021c9e80
        .extern func_ov011_021c9e8c
        .extern func_ov011_021cf2dc
        .global func_ov011_021c9e98
        .arm
func_ov011_021c9e98:
        .word   0xe92d4010
        .word   0xe1a04000
        bl      GetSystemWork
        .word   0xe5900900
        .word   0xe1a00a80
        .word   0xe1a00f20
        .word   0xe3100002
        .word   0x0a000009
        bl      GetSystemWork
        .word   0xe5902900
        .word   0xe1a01a82
        .word   0xe1a01f21
        .word   0xe3c11002
        .word   0xe3c22c06
        .word   0xe1a01f01
        .word   0xe1821aa1
        .word   0xe5801900
        .word   0xe8bd8010
        .word   0xe3540000
        .word   0x1a000003
        .word   0xe3a00000
        .word   0xebff9e87                      ; bl 0x021b1910 (cross-overlay)
        bl      func_ov011_021c9e80
        .word   0xe8bd8010
        bl      func_ov011_021cf2dc
        .word   0xe3500000
        .word   0x08bd8010
        .word   0xe3540000
        .word   0x0a000046
        .word   0xe3540001
        .word   0x18bd8010
        .word   0xe59f011c
        .word   0xe5900024
        .word   0xe1a00580
        .word   0xe1a04c20
        bl      func_020139b4
        .word   0xe3500000
        .word   0x1a000005
        .word   0xe3540032
        .word   0x13540044
        .word   0x1a000002
        .word   0xe3a00001
        .word   0xebff9e72                      ; bl 0x021b1910 (cross-overlay)
        .word   0xea00000a
        bl      func_020139b4
        .word   0xe3500002
        .word   0x1a000005
        .word   0xe2440021
        .word   0xe3500001
        .word   0x8a000002
        .word   0xe3a00002
        .word   0xebff9e69                      ; bl 0x021b1910 (cross-overlay)
        .word   0xea000001
        .word   0xe3a00000
        .word   0xebff9e66                      ; bl 0x021b1910 (cross-overlay)
        .word   0xe354002b
        .word   0xca00000c
        .word   0xaa00001c
        .word   0xe3540015
        .word   0xca000001
        .word   0x0a000013
        .word   0xea000023
        .word   0xe3540022
        .word   0xca000021
        .word   0xe3540020
        .word   0xba00001f
        .word   0x0a00000d
        .word   0xe3540022
        .word   0x0a000014
        .word   0xea00001b
        .word   0xe3540032
        .word   0xca000006
        .word   0xe354002f
        .word   0xba000017
        .word   0x0a000008
        .word   0xe3540030
        .word   0x13540032
        .word   0x0a000002
        .word   0xea000012
        .word   0xe3540044
        .word   0x1a000010
        .word   0xe3a000b0
        bl      func_ov011_021c9e8c
        .word   0xe8bd8010
        .word   0xe3a000a0
        bl      func_ov011_021c9e8c
        .word   0xe8bd8010
        .word   0xe3a000cc
        bl      func_ov011_021c9e8c
        .word   0xe8bd8010
        bl      func_020139b4
        .word   0xe3500000
        .word   0x1a000002
        .word   0xe3a000cb
        bl      func_ov011_021c9e8c
        .word   0xe8bd8010
        bl      func_ov011_021c9e80
        .word   0xe8bd8010
        bl      func_ov011_021c9e80
        .word   0xe8bd8010
        .word   0xe3a00000
        .word   0xebff9e37                      ; bl 0x021b1910 (cross-overlay)
        bl      func_ov011_021c9e80
        .word   0xe8bd8010
        .word   0x021c7594                      ; load to 0x021c7594 (mod=overlays(0,7,9,14,21))
