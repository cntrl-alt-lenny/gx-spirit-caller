; func_ov002_0229c6e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d10dc
        .extern data_ov002_022d1320
        .extern data_ov002_022d1330
        .extern data_ov002_022d19bc
        .extern data_ov002_022d1a18
        .extern data_ov002_022d1a9c
        .extern func_ov002_022a1760
        .extern func_ov002_022a3808
        .extern func_ov002_022a6b88
        .extern func_ov002_022a6be0
        .extern func_ov002_022b37cc
        .global func_ov002_0229c6e8
        .arm
func_ov002_0229c6e8:
    stmdb sp!, {r3, lr}
    cmp r0, #0x3d
    addls pc, pc, r0, lsl #0x2
    b .L_1f04
    b .L_1b20
    b .L_1bb0
    b .L_1be0
    b .L_1b5c
    b .L_1b80
    b .L_1b80
    b .L_1ea4
    b .L_1f04
    b .L_1f04
    b .L_1f04
    b .L_1f04
    b .L_1f04
    b .L_1d90
    b .L_1b74
    b .L_1b74
    b .L_1f04
    b .L_1b2c
    b .L_1f04
    b .L_1b20
    b .L_1d60
    b .L_1f04
    b .L_1b20
    b .L_1f04
    b .L_1f04
    b .L_1d00
    b .L_1b20
    b .L_1cd0
    b .L_1f04
    b .L_1c70
    b .L_1c40
    b .L_1c58
    b .L_1cb8
    b .L_1c10
    b .L_1ca0
    b .L_1c88
    b .L_1d30
    b .L_1f04
    b .L_1d48
    b .L_1f04
    b .L_1d78
    b .L_1f04
    b .L_1f04
    b .L_1eec
    b .L_1f04
    b .L_1f04
    b .L_1eec
    b .L_1f04
    b .L_1ebc
    b .L_1e08
    b .L_1b68
    b .L_1b68
    b .L_1dc0
    b .L_1dc0
    b .L_1df0
    b .L_1f04
    b .L_1e14
    b .L_1e2c
    b .L_1e44
    b .L_1e5c
    b .L_1e74
    b .L_1e8c
    b .L_1e08
.L_1b20:
    ldr r0, _LIT0
    bl func_ov002_022a6be0
    ldmia sp!, {r3, pc}
.L_1b2c:
    ldr r0, _LIT0
    bl func_ov002_022a6be0
    cmp r0, #0x0
    bne .L_1b4c
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x15
    bne .L_1b54
.L_1b4c:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_1b54:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_1b5c:
    ldr r0, _LIT2
    ldrh r0, [r0]
    ldmia sp!, {r3, pc}
.L_1b68:
    ldr r0, _LIT3
    bl func_ov002_022a1760
    ldmia sp!, {r3, pc}
.L_1b74:
    ldr r0, _LIT4
    bl func_ov002_022b37cc
    ldmia sp!, {r3, pc}
.L_1b80:
    ldr r0, _LIT5
    bl func_ov002_022a3808
    cmp r0, #0x0
    bne .L_1ba0
    ldr r0, _LIT4
    bl func_ov002_022b37cc
    cmp r0, #0x0
    beq .L_1ba8
.L_1ba0:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_1ba8:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_1bb0:
    ldr r0, _LIT5
    bl func_ov002_022a3808
    cmp r0, #0x0
    bne .L_1bd0
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x1a
    bne .L_1bd8
.L_1bd0:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_1bd8:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_1be0:
    ldr r0, _LIT4
    bl func_ov002_022b37cc
    cmp r0, #0x0
    bne .L_1c00
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x1b
    bne .L_1c08
.L_1c00:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_1c08:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_1c10:
    ldr r0, _LIT5
    bl func_ov002_022a3808
    cmp r0, #0x0
    bne .L_1c30
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x5
    bne .L_1c38
.L_1c30:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_1c38:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_1c40:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0xa
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_1c58:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_1c70:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x4
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_1c88:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x6
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_1ca0:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x8
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_1cb8:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x9
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_1cd0:
    ldr r0, _LIT0
    bl func_ov002_022a6be0
    cmp r0, #0x0
    bne .L_1cf0
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0xb
    bne .L_1cf8
.L_1cf0:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_1cf8:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_1d00:
    ldr r0, _LIT0
    bl func_ov002_022a6be0
    cmp r0, #0x0
    bne .L_1d20
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0xc
    bne .L_1d28
.L_1d20:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_1d28:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_1d30:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0xe
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_1d48:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0xd
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_1d60:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x14
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_1d78:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x16
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_1d90:
    ldr r0, _LIT5
    bl func_ov002_022a3808
    cmp r0, #0x0
    bne .L_1db0
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x2
    bne .L_1db8
.L_1db0:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_1db8:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_1dc0:
    ldr r0, _LIT5
    bl func_ov002_022a3808
    cmp r0, #0x0
    bne .L_1de0
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x1
    bne .L_1de8
.L_1de0:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_1de8:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_1df0:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x10
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_1e08:
    ldr r0, _LIT5
    bl func_ov002_022a3808
    ldmia sp!, {r3, pc}
.L_1e14:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x18
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_1e2c:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x17
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_1e44:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x19
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_1e5c:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x11
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_1e74:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x12
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_1e8c:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x13
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_1ea4:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0xf
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_1ebc:
    ldr r0, _LIT5
    bl func_ov002_022a3808
    cmp r0, #0x0
    bne .L_1edc
    ldr r0, _LIT0
    bl func_ov002_022a6b88
    cmp r0, #0x0
    beq .L_1ee4
.L_1edc:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
.L_1ee4:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_1eec:
    ldr r0, _LIT1
    ldr r0, [r0, #0xc54]
    cmp r0, #0x7
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, pc}
.L_1f04:
    ldr r0, _LIT0
    bl func_ov002_022a6b88
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022d1330
_LIT1: .word data_ov002_022d1a9c
_LIT2: .word data_ov002_022d19bc
_LIT3: .word data_ov002_022d10dc
_LIT4: .word data_ov002_022d1a18
_LIT5: .word data_ov002_022d1320
