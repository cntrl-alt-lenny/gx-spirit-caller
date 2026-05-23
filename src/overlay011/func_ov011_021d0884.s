; func_ov011_021d0884: C-32 cross-overlay BL wall — brief 192 recipe.
; Brief 197 Track A drain. 152 bytes; module:none BLs hand-encoded.

        .text
        .extern func_02001ba4
        .extern func_020058b4
        .extern func_02005c60
        .extern func_0201ef3c
        .extern func_0202c1ac
        .extern func_ov000_021aae70
        .extern func_ov000_021b3810_unk
        .extern func_ov011_021ca3d4
        .extern func_ov011_021d2db8
        .global func_ov011_021d0884
        .arm
func_ov011_021d0884:
        .word   0xe92d4008
        bl      func_020058b4
        bl      func_ov000_021aae70
        bl      func_ov011_021ca3d4
        .word   0xe59f0064
        .word   0xe5900250
        bl      func_ov000_021b3810_unk
        .word   0xe59f0058
        .word   0xe59f1058
        .word   0xe59000e8
        .word   0xe59f2054
        bl      func_0201ef3c
        .word   0xe59f0044
        .word   0xe59f104c
        .word   0xe59000ec
        .word   0xe59f2048
        bl      func_0201ef3c
        .word   0xe59f0030
        .word   0xe59f1040
        .word   0xe59000bc
        .word   0xe59f203c
        bl      func_0201ef3c
        .word   0xebff814d                      ; bl 0x021b0e18 (cross-overlay)
        bl      func_ov011_021d2db8
        bl      func_0202c1ac
        bl      func_02001ba4
        .word   0xe3a00001
        bl      func_02005c60
        .word   0xe3a00002
        bl      func_02005c60
        .word   0xe8bd8008
        .word   0x021d4000                      ; load to 0x021d4000 (mod=overlay(11))
        .word   0x021d4110                      ; load to 0x021d4110 (mod=overlay(11))
        .word   0x021d4178                      ; load to 0x021d4178 (mod=overlay(11))
        .word   0x021d4120                      ; load to 0x021d4120 (mod=overlay(11))
        .word   0x021d4180                      ; load to 0x021d4180 (mod=overlay(11))
        .word   0x021d40c4                      ; load to 0x021d40c4 (mod=overlay(11))
        .word   0x021d40e0                      ; load to 0x021d40e0 (mod=overlay(11))
