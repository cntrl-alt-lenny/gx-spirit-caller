; func_ov002_022bb074 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ccfd8
        .extern data_ov002_022ccfec
        .extern data_ov002_022d1af8
        .extern data_ov002_022d28fc
        .extern func_0202de9c
        .extern func_02037208
        .extern func_020a978c
        .extern func_ov002_022bdb88
        .global func_ov002_022bb074
        .arm
func_ov002_022bb074:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldr r0, [r6, #0xc60]
    cmp r0, #0x0
    beq .L_2c
    cmp r0, #0x1
    beq .L_124
    cmp r0, #0x2
    beq .L_1d0
    b .L_1f8
.L_2c:
    add r0, r6, #0xc00
    ldrh r1, [r0, #0x68]
    ldr r5, _LIT0
    mov r0, r1, lsl #0x1a
    mov r7, r0, lsr #0x1b
    cmp r7, #0x10
    movcc r4, #0x1
    ldr r0, [r6, #0xc5c]
    strh r1, [sp, #0x6]
    movcs r4, #0x0
    bl func_0202de9c
    cmp r0, #0x8
    moveq r0, #0x0
    beq .L_88
    cmp r0, #0x7
    moveq r0, #0x1
    beq .L_88
    cmp r0, #0x3
    moveq r0, #0x3
    beq .L_88
    cmp r0, #0x2
    moveq r0, #0x4
    movne r0, #0x2
.L_88:
    cmp r7, #0xe
    moveq r1, #0x100
    movne r1, #0x0
    orr r2, r1, r0
    cmp r4, #0x0
    movne r1, #0x30
    mov r3, #0x0
    str r3, [sp]
    moveq r1, #0x31
    mov r0, r5
    add r3, r6, #0xc80
    bl func_ov002_022bdb88
    add r0, r6, #0x124
    ldr r2, [r6, #0xc5c]
    ldr r1, _LIT1
    add r0, r0, #0x800
    bl func_020a978c
    add r0, r6, #0x14c
    ldr r1, _LIT2
    add r0, r0, #0x800
    bl func_020a978c
    cmp r4, #0x0
    beq .L_f8
    mov r0, #0x41
    sub r1, r0, #0x42
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_f8:
    ldr r0, _LIT3
    mov r1, #0x0
    str r1, [r0, #0x4]
    cmp r4, #0x0
    moveq r1, #0x1
    str r1, [r6, #0xcf0]
    mov r0, #0x1
    str r0, [r6, #0xc60]
    mov r0, #0x0
    str r0, [r6, #0xc64]
    b .L_1f8
.L_124:
    add r0, r6, #0xc00
    ldrh r1, [r0, #0x68]
    ldr r4, _LIT0
    mov r0, r1, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x10
    movcc r5, #0x1
    movcs r5, #0x0
    cmp r5, #0x0
    ldreq r0, [r6, #0xc64]
    strh r1, [sp, #0x4]
    cmpeq r0, #0x2d
    bne .L_16c
    mov r0, #0x41
    sub r1, r0, #0x42
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
.L_16c:
    mov r3, #0x0
    mov r1, #0x31
    mov r2, #0x30
.L_178:
    ldr r0, [r4]
    cmp r0, #0x0
    beq .L_1a0
    cmp r5, #0x0
    movne r7, r2
    ldr r0, [r4, #0x4]
    moveq r7, r1
    cmp r0, r7
    moveq r0, #0x1
    beq .L_1b4
.L_1a0:
    add r3, r3, #0x1
    cmp r3, #0x10
    add r4, r4, #0x8
    blt .L_178
    mov r0, #0x0
.L_1b4:
    cmp r0, #0x0
    bne .L_1f8
    mov r0, #0x2
    str r0, [r6, #0xc60]
    mov r0, #0x0
    str r0, [r6, #0xc64]
    b .L_1f8
.L_1d0:
    ldr r0, _LIT3
    mov r1, #0x1
    str r1, [r0, #0x4]
    mov r0, #0x0
    str r0, [r6, #0xcf0]
    mov r1, #0xc
    str r1, [r6, #0xcc8]
    add sp, sp, #0x8
    str r0, [r6, #0xc54]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1f8:
    ldr r1, [r6, #0xc64]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r6, #0xc64]
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022d28fc
_LIT1: .word data_ov002_022ccfd8
_LIT2: .word data_ov002_022ccfec
_LIT3: .word data_ov002_022d1af8
