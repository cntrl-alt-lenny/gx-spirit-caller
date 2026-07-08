; func_ov002_022bb73c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ccee4
        .extern data_ov002_022d1330
        .extern data_ov002_022d1a18
        .extern data_ov002_022d281c
        .extern func_020371b8
        .extern func_020a9698
        .extern func_ov002_022a61e8
        .extern func_ov002_022bda78
        .global func_ov002_022bb73c
        .arm
func_ov002_022bb73c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldr r0, [r4, #0xc60]
    cmp r0, #0x0
    beq .L_2c
    cmp r0, #0x1
    beq .L_c4
    cmp r0, #0x2
    beq .L_138
    b .L_164
.L_2c:
    add r0, r4, #0xc00
    ldrh r5, [r0, #0x68]
    ldr r0, _LIT0
    mov r1, r5, lsl #0x1f
    mov r2, r5, lsl #0x1a
    mov r3, r5, lsl #0x12
    mov r1, r1, lsr #0x1f
    mov r2, r2, lsr #0x1b
    mov r3, r3, lsr #0x18
    strh r5, [sp, #0x4]
    bl func_ov002_022a61e8
    mov r5, r0
    mov r2, #0x0
    ldr r0, _LIT1
    str r2, [sp]
    add r3, r4, #0xc80
    mov r1, #0x34
    bl func_ov002_022bda78
    ldrsb r1, [r5]
    add r0, r4, #0x124
    cmp r1, #0x0
    beq .L_98
    ldrh r1, [r5, #0xa]
    mov r1, r1, lsl #0x11
    movs r1, r1, lsr #0x1f
    moveq r2, #0x0
    beq .L_9c
.L_98:
    ldr r2, [r4, #0xc5c]
.L_9c:
    ldr r1, _LIT2
    add r0, r0, #0x800
    bl func_020a9698
    ldr r0, _LIT3
    mov r1, #0x0
    str r1, [r0, #0x4]
    mov r0, #0x1
    str r0, [r4, #0xc60]
    str r1, [r4, #0xc64]
    b .L_164
.L_c4:
    ldr r0, [r4, #0xc64]
    ldr r5, _LIT1
    cmp r0, #0xf
    bne .L_e8
    mov r0, #0x4e
    sub r1, r0, #0x4f
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_e8:
    mov r1, #0x0
.L_ec:
    ldr r0, [r5]
    cmp r0, #0x0
    beq .L_108
    ldr r0, [r5, #0x4]
    cmp r0, #0x34
    moveq r0, #0x1
    beq .L_11c
.L_108:
    add r1, r1, #0x1
    cmp r1, #0x10
    add r5, r5, #0x8
    blt .L_ec
    mov r0, #0x0
.L_11c:
    cmp r0, #0x0
    bne .L_164
    mov r0, #0x2
    str r0, [r4, #0xc60]
    mov r0, #0x0
    str r0, [r4, #0xc64]
    b .L_164
.L_138:
    ldr r0, _LIT3
    mov r1, #0x1
    str r1, [r0, #0x4]
    mov r0, #0xc
    str r0, [r4, #0xcc8]
    mov r0, #0x3
    str r0, [r4, #0xcd0]
    mov r0, #0x0
    add sp, sp, #0x8
    str r0, [r4, #0xc54]
    ldmia sp!, {r3, r4, r5, pc}
.L_164:
    ldr r1, [r4, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r4, #0xc64]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d1330
_LIT1: .word data_ov002_022d281c
_LIT2: .word data_ov002_022ccee4
_LIT3: .word data_ov002_022d1a18
