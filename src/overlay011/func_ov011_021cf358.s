; func_ov011_021cf358: C-32 cross-overlay BL wall — brief 192 recipe.
; Brief 197 Track A drain. 76 bytes; module:none BLs hand-encoded.

        .text
        .extern func_02018b94
        .extern func_02019124
        .extern func_0201bf04
        .extern func_0201c6a0
        .extern func_ov011_021d1f9c
        .global func_ov011_021cf358
        .arm
func_ov011_021cf358:
        .word   0xe92d4008
        .word   0xe59f0038
        bl      func_0201bf04
        bl      func_0201c6a0
        bl      func_02018b94
        .word   0xe5900000
        .word   0xebff87cb                      ; bl 0x021b12a4 (cross-overlay)
        bl      func_02019124
        .word   0xe1a02000
        .word   0xe59f001c
        .word   0xe59012a4
        .word   0xe1a00b81
        .word   0xe1a00e20
        .word   0xe1a01781
        .word   0xe1a01e21
        bl      func_ov011_021d1f9c
        .word   0xe8bd8008
        .word   0x021d4218                      ; load to 0x021d4218 (mod=overlay(11))
        .word   0x021d4000                      ; load to 0x021d4000 (mod=overlay(11))
