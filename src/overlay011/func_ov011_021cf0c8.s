; func_ov011_021cf0c8: C-32 cross-overlay BL wall — brief 192 recipe.
; Brief 197 Track A drain. 304 bytes; module:none BLs hand-encoded.

        .text
        .extern func_0208bf3c
        .extern func_ov011_021cc250
        .extern func_ov011_021cdb7c
        .extern func_ov011_021d0fb0
        .global func_ov011_021cf0c8
        .arm
func_ov011_021cf0c8:
        .word   0xe92d4ff0
        .word   0xe24dd00c
        .word   0xe59f711c
        bl      func_ov011_021cdb7c
        .word   0xe3500000
        .word   0x0a00003c
        .word   0xe5970270
        .word   0xe1a00600
        .word   0xe1b00f20
        .word   0x0a000038
        .word   0xe5971214
        .word   0xe5972218
        .word   0xe28d0000
        .word   0xe3a08000
        .word   0xebff91bc                      ; bl 0x021b37f8 (cross-overlay)
        .word   0xe59d9000
        .word   0xe59da004
        .word   0xe3a06a01
        .word   0xe1a0b008
        .word   0xe1a05008
        .word   0xe3a04b02
        .word   0xea00001c
        .word   0xe5970218
        .word   0xe5971214
        .word   0xe2800008
        .word   0xe5870218
        .word   0xe3500a01
        .word   0xc5876218
        .word   0xe5972218
        .word   0xe28d0000
        .word   0xebff91ac                      ; bl 0x021b37f8 (cross-overlay)
        .word   0xe59d1000
        .word   0xe59d0004
        .word   0xe0491001
        .word   0xe04a0000
        .word   0xe0c39191
        .word   0xe0c12090
        .word   0xe3a00b02
        .word   0xe0999000
        .word   0xe0a3000b
        .word   0xe1a03629
        .word   0xe0922004
        .word   0xe1833a00
        .word   0xe0a10005
        .word   0xe1a01622
        .word   0xe1811a00
        .word   0xe0830001
        bl      func_0208bf3c
        .word   0xe59d9000
        .word   0xe59da004
        .word   0xe0888000
        .word   0xe3580a02
        .word   0xb5970218
        .word   0xb3500a01
        .word   0xbaffffde
        .word   0xe59d1000
        .word   0xe59d2004
        .word   0xe5970218
        .word   0xe587121c
        .word   0xe5872220
        .word   0xe3500a01
        .word   0xba000006
        .word   0xe5970270
        .word   0xe3c00703
        .word   0xe3800702
        .word   0xe5870270
        .word   0xea000001
        .word   0xe597121c
        .word   0xe597a220
        .word   0xe1a0200a
        .word   0xe3a00000
        bl      func_ov011_021d0fb0
        bl      func_ov011_021cc250
        .word   0xe28dd00c
        .word   0xe8bd8ff0
        .word   0x021d403c                      ; load to 0x021d403c (mod=overlay(11))
