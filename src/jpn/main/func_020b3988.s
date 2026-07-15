; func_020b3988 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020b3988
        .global .L_020b3988
        .global .L_020b398c
        .global .L_020b3990
        .global .L_020b3994
        .global .L_020b3998
        .global .L_020b399c
        .global .L_020b39a0
        .global .L_020b39a4
        .global .L_020b39a8
        .global .L_020b39ac
        .global .L_020b39b0
        .global .L_020b39b4
        .global .L_020b39b8
        .global .L_020b39bc
        .global .L_020b39c0
        .global .L_020b39c4
        .global .L_020b39c8
        .global .L_020b39cc
        .global .L_020b39d0
        .global .L_020b39d4
        .global .L_020b39d8
        .global .L_020b39dc
        .global .L_020b39e0
        .global .L_020b39e4
        .global .L_020b39e8
        .global .L_020b39ec
        .global .L_020b39f0
        .global .L_020b39f4
        .global .L_020b39f8
        .global .L_020b39fc
        .global .L_020b3a00
        .global .L_020b3a04
        .global .L_020b3a08
        .global .L_020b3a0c
        .global .L_020b3a10
        .global .L_020b3a14
        .global .L_020b3a18
        .global .L_020b3a1c
        .global .L_020b3a20
        .global .L_020b3a24
        .global .L_020b3a28
        .global .L_020b3a2c
        .global .L_020b3a30
        .global .L_020b3a34
        .global .L_020b3a38
        .global .L_020b3a3c
        .global .L_020b3a40
        .global .L_020b3a44
        .global .L_020b3a48
        .global .L_020b3a4c
        .global .L_020b3a50
        .global .L_020b3a54
        .global .L_020b3a58
        .global .L_020b3a5c
        .global .L_020b3a60
        .global .L_020b3a64
        .global .L_020b3a68
        .global .L_020b3a6c
        .global .L_020b3a70
        .global .L_020b3a74
        .global .L_020b3a78
        .global .L_020b3a7c
        .global .L_020b3a80
        .global .L_020b3a84
        .global .L_020b3a88
        .global .L_020b3a8c
        .global .L_020b3a90
        .global .L_020b3a94
        .global .L_020b3a98
        .global .L_020b3a9c
        .global .L_020b3aa0
        .global .L_020b3aa4
        .global .L_020b3aa8
        .global .L_020b3aac
        .global .L_020b3ab0
        .global .L_020b3ab4
        .global .L_020b3ab8
        .global .L_020b3abc
        .global .L_020b3ac0
        .global .L_020b3ac4
        .global .L_020b3ac8
        .global .L_020b3acc
        .global .L_020b3ad0
        .global .L_020b3ad4
        .global .L_020b3ad8
        .global .L_020b3adc
        .global .L_020b3ae0
        .global .L_020b3ae4
        .global .L_020b3ae8
        .global .L_020b3aec
        .global .L_020b3af0
        .global .L_020b3af4
        .global .L_020b3af8
        .global .L_020b3afc
        .global .L_020b3b00
        .global .L_020b3b04
        .global .L_020b3b08
        .global .L_020b3b0c
        .global .L_020b3b10
        .global .L_020b3b14
        .global .L_020b3b18
        .global .L_020b3b1c
        .global .L_020b3b20
        .global .L_020b3b24
        .global .L_020b3b28
        .global .L_020b3b2c
        .global .L_020b3b30
        .global .L_020b3b34
        .global .L_020b3b38
        .global .L_020b3b3c
        .global .L_020b3b40
        .global .L_020b3b44
        .global .L_020b3b48
        .global .L_020b3b4c
        .global .L_020b3b50
        .global .L_020b3b54
        .global .L_020b3b58
        .global .L_020b3b5c
        .global .L_020b3b60
        .global .L_020b3b64
        .global .L_020b3b68
        .arm
func_020b3988:
.L_020b3988:
    cmp r1, #0x0
.L_020b398c:
    bxeq lr
.L_020b3990:
    cmp r0, r1
.L_020b3994:
    movcc r1, r0
.L_020b3998:
    movcc r0, #0x0
.L_020b399c:
    bxcc lr
.L_020b39a0:
    mov r2, #0x1c
.L_020b39a4:
    mov r3, r0, lsr #0x4
.L_020b39a8:
    cmp r1, r3, lsr #0xc
.L_020b39ac:
    suble r2, r2, #0x10
.L_020b39b0:
    movle r3, r3, lsr #0x10
.L_020b39b4:
    cmp r1, r3, lsr #0x4
.L_020b39b8:
    suble r2, r2, #0x8
.L_020b39bc:
    movle r3, r3, lsr #0x8
.L_020b39c0:
    cmp r1, r3
.L_020b39c4:
    suble r2, r2, #0x4
.L_020b39c8:
    movle r3, r3, lsr #0x4
.L_020b39cc:
    mov r0, r0, lsl r2
.L_020b39d0:
    rsb r1, r1, #0x0
.L_020b39d4:
    adds r0, r0, r0
.L_020b39d8:
    add r2, r2, r2, lsl #0x1
.L_020b39dc:
    add pc, pc, r2, lsl #0x2
.L_020b39e0:
    nop
.L_020b39e4:
    adcs r3, r1, r3, lsl #0x1
.L_020b39e8:
    subcc r3, r3, r1
.L_020b39ec:
    adcs r0, r0, r0
.L_020b39f0:
    adcs r3, r1, r3, lsl #0x1
.L_020b39f4:
    subcc r3, r3, r1
.L_020b39f8:
    adcs r0, r0, r0
.L_020b39fc:
    adcs r3, r1, r3, lsl #0x1
.L_020b3a00:
    subcc r3, r3, r1
.L_020b3a04:
    adcs r0, r0, r0
.L_020b3a08:
    adcs r3, r1, r3, lsl #0x1
.L_020b3a0c:
    subcc r3, r3, r1
.L_020b3a10:
    adcs r0, r0, r0
.L_020b3a14:
    adcs r3, r1, r3, lsl #0x1
.L_020b3a18:
    subcc r3, r3, r1
.L_020b3a1c:
    adcs r0, r0, r0
.L_020b3a20:
    adcs r3, r1, r3, lsl #0x1
.L_020b3a24:
    subcc r3, r3, r1
.L_020b3a28:
    adcs r0, r0, r0
.L_020b3a2c:
    adcs r3, r1, r3, lsl #0x1
.L_020b3a30:
    subcc r3, r3, r1
.L_020b3a34:
    adcs r0, r0, r0
.L_020b3a38:
    adcs r3, r1, r3, lsl #0x1
.L_020b3a3c:
    subcc r3, r3, r1
.L_020b3a40:
    adcs r0, r0, r0
.L_020b3a44:
    adcs r3, r1, r3, lsl #0x1
.L_020b3a48:
    subcc r3, r3, r1
.L_020b3a4c:
    adcs r0, r0, r0
.L_020b3a50:
    adcs r3, r1, r3, lsl #0x1
.L_020b3a54:
    subcc r3, r3, r1
.L_020b3a58:
    adcs r0, r0, r0
.L_020b3a5c:
    adcs r3, r1, r3, lsl #0x1
.L_020b3a60:
    subcc r3, r3, r1
.L_020b3a64:
    adcs r0, r0, r0
.L_020b3a68:
    adcs r3, r1, r3, lsl #0x1
.L_020b3a6c:
    subcc r3, r3, r1
.L_020b3a70:
    adcs r0, r0, r0
.L_020b3a74:
    adcs r3, r1, r3, lsl #0x1
.L_020b3a78:
    subcc r3, r3, r1
.L_020b3a7c:
    adcs r0, r0, r0
.L_020b3a80:
    adcs r3, r1, r3, lsl #0x1
.L_020b3a84:
    subcc r3, r3, r1
.L_020b3a88:
    adcs r0, r0, r0
.L_020b3a8c:
    adcs r3, r1, r3, lsl #0x1
.L_020b3a90:
    subcc r3, r3, r1
.L_020b3a94:
    adcs r0, r0, r0
.L_020b3a98:
    adcs r3, r1, r3, lsl #0x1
.L_020b3a9c:
    subcc r3, r3, r1
.L_020b3aa0:
    adcs r0, r0, r0
.L_020b3aa4:
    adcs r3, r1, r3, lsl #0x1
.L_020b3aa8:
    subcc r3, r3, r1
.L_020b3aac:
    adcs r0, r0, r0
.L_020b3ab0:
    adcs r3, r1, r3, lsl #0x1
.L_020b3ab4:
    subcc r3, r3, r1
.L_020b3ab8:
    adcs r0, r0, r0
.L_020b3abc:
    adcs r3, r1, r3, lsl #0x1
.L_020b3ac0:
    subcc r3, r3, r1
.L_020b3ac4:
    adcs r0, r0, r0
.L_020b3ac8:
    adcs r3, r1, r3, lsl #0x1
.L_020b3acc:
    subcc r3, r3, r1
.L_020b3ad0:
    adcs r0, r0, r0
.L_020b3ad4:
    adcs r3, r1, r3, lsl #0x1
.L_020b3ad8:
    subcc r3, r3, r1
.L_020b3adc:
    adcs r0, r0, r0
.L_020b3ae0:
    adcs r3, r1, r3, lsl #0x1
.L_020b3ae4:
    subcc r3, r3, r1
.L_020b3ae8:
    adcs r0, r0, r0
.L_020b3aec:
    adcs r3, r1, r3, lsl #0x1
.L_020b3af0:
    subcc r3, r3, r1
.L_020b3af4:
    adcs r0, r0, r0
.L_020b3af8:
    adcs r3, r1, r3, lsl #0x1
.L_020b3afc:
    subcc r3, r3, r1
.L_020b3b00:
    adcs r0, r0, r0
.L_020b3b04:
    adcs r3, r1, r3, lsl #0x1
.L_020b3b08:
    subcc r3, r3, r1
.L_020b3b0c:
    adcs r0, r0, r0
.L_020b3b10:
    adcs r3, r1, r3, lsl #0x1
.L_020b3b14:
    subcc r3, r3, r1
.L_020b3b18:
    adcs r0, r0, r0
.L_020b3b1c:
    adcs r3, r1, r3, lsl #0x1
.L_020b3b20:
    subcc r3, r3, r1
.L_020b3b24:
    adcs r0, r0, r0
.L_020b3b28:
    adcs r3, r1, r3, lsl #0x1
.L_020b3b2c:
    subcc r3, r3, r1
.L_020b3b30:
    adcs r0, r0, r0
.L_020b3b34:
    adcs r3, r1, r3, lsl #0x1
.L_020b3b38:
    subcc r3, r3, r1
.L_020b3b3c:
    adcs r0, r0, r0
.L_020b3b40:
    adcs r3, r1, r3, lsl #0x1
.L_020b3b44:
    subcc r3, r3, r1
.L_020b3b48:
    adcs r0, r0, r0
.L_020b3b4c:
    adcs r3, r1, r3, lsl #0x1
.L_020b3b50:
    subcc r3, r3, r1
.L_020b3b54:
    adcs r0, r0, r0
.L_020b3b58:
    adcs r3, r1, r3, lsl #0x1
.L_020b3b5c:
    subcc r3, r3, r1
.L_020b3b60:
    adcs r0, r0, r0
.L_020b3b64:
    mov r1, r3
.L_020b3b68:
    bx lr
