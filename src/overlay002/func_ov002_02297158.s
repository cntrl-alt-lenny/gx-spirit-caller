; func_ov002_02297158 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_0203158c
        .extern func_ov002_021b9ecc
        .extern func_ov002_021c3b60
        .extern func_ov002_021fc1a0
        .extern func_ov002_021fc3e8
        .extern func_ov002_02259774
        .extern func_ov002_022819d4
        .extern func_ov002_02297050
        .global func_ov002_02297158
        .arm
func_ov002_02297158:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x3c
    mov sl, r0
    mov r0, #0x0
    ldr r5, [r1]
    str r1, [sp]
    str r0, [sp, #0x4]
.L_1c:
    ldr r0, [sp, #0x4]
    ldr r2, _LIT0
    eor r7, sl, r0
    ldr r0, _LIT1
    and r1, r7, #0x1
    mla r8, r1, r0, r2
    mov r1, r7, lsl #0x10
    mov r0, r5, lsl #0x10
    mov r1, r1, lsr #0x10
    mov fp, r0, lsr #0x10
    and r0, r1, #0x1
    add r9, r8, #0x30
    mov r6, #0x0
    str r0, [sp, #0x8]
    add r4, sp, #0x24
.L_58:
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b9ecc
    cmp r5, r0
    bne .L_1e0
    ldr r1, [r8, #0x40]
    mov r0, r1, lsr #0x6
    tst r0, #0x1
    bne .L_1e0
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_1e0
    cmp r7, sl
    beq .L_ac
    mov r0, r5
    bl func_0203158c
    cmp r0, #0x0
    ldrneh r0, [r8, #0x38]
    cmpne r0, #0x0
    beq .L_1e0
.L_ac:
    mov r0, #0x0
    str r0, [r4]
    ldrh r2, [sp, #0x26]
    str r0, [r4, #0x4]
    str r0, [r4, #0x8]
    str r0, [r4, #0xc]
    str r0, [r4, #0x10]
    str r0, [r4, #0x14]
    mov r0, r6, lsl #0x10
    mov r1, r0, lsr #0x10
    ldr r0, [sp, #0x8]
    bic r2, r2, #0x1
    orr r0, r2, r0
    strh r0, [sp, #0x26]
    ldrh r3, [sp, #0x26]
    mov r0, r1, lsl #0x1b
    ldrh r1, [sp, #0x28]
    bic r3, r3, #0x3e
    orr r0, r3, r0, lsr #0x1a
    strh r0, [sp, #0x26]
    ldr r0, _LIT2
    ldr r2, [r9]
    and r1, r1, r0
    mov r0, r2, lsl #0x12
    mov r2, r2, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r2, r2, lsl #0x1
    add r0, r2, r0, lsr #0x1f
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x17
    orr r0, r1, r0, lsr #0x11
    ldrh r2, [sp, #0x26]
    cmp r7, sl
    strh r0, [sp, #0x28]
    movne r0, #0x1
    moveq r0, #0x0
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, lsl #0x1f
    ldrh r0, [r8, #0x38]
    bic r2, r2, #0x4000
    orr r1, r2, r1, lsr #0x11
    strh r1, [sp, #0x26]
    cmp r0, #0x0
    strh fp, [sp, #0x24]
    mov r0, r4
    mov r1, #0x0
    beq .L_178
    bl func_ov002_021fc1a0
    b .L_17c
.L_178:
    bl func_ov002_021fc3e8
.L_17c:
    cmp r0, #0x0
    beq .L_1e0
    mov r0, r4
    bl func_ov002_02297050
    cmp r0, #0x0
    bne .L_1e0
    ldr r2, [sp]
    mov r0, r4
    ldr r2, [r2, #0x4]
    mov r1, #0x0
    blx r2
    cmp r0, #0x0
    beq .L_1e0
    ldr r4, _LIT3
    mov r0, r7
    mov r1, r6
    mov r2, #0x0
    mov r3, #0x3
    str sl, [r4, #0xd6c]
    bl func_ov002_02259774
    mov r1, r4
    mov r0, #0x1
    str r0, [r1, #0xd54]
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1e0:
    add r8, r8, #0x14
    add r9, r9, #0x14
    add r6, r6, #0x1
    cmp r6, #0xa
    ble .L_58
    ldr r0, [sp, #0x4]
    add r0, r0, #0x1
    str r0, [sp, #0x4]
    cmp r0, #0x2
    blt .L_1c
    ldr r0, [sp]
    ldr r1, [r0]
    mov r0, sl
    bl func_ov002_021c3b60
    movs r4, r0
    bmi .L_348
    mov r0, sl
    bl func_ov002_022819d4
    cmp r0, #0x0
    beq .L_348
    mov r2, sl, lsl #0x10
    mov r6, r2, lsr #0x10
    ldr r5, _LIT0
    ldr r2, _LIT1
    and r3, sl, #0x1
    mla r2, r3, r2, r5
    add r2, r2, #0x120
    ldr r2, [r2, r4, lsl #0x2]
    add r0, sp, #0xc
    mov r1, #0x0
    str r1, [r0]
    ldrh r7, [sp, #0xe]
    mov r3, r2, lsl #0x2
    mov r5, r3, lsr #0x18
    mov r3, r2, lsl #0x13
    mov r3, r3, lsr #0x13
    bic r7, r7, #0x1
    and r6, r6, #0x1
    orr r6, r7, r6
    strh r6, [sp, #0xe]
    mov r6, r2, lsl #0x12
    mov r2, r5, lsl #0x1
    ldrh r7, [sp, #0xe]
    add r2, r2, r6, lsr #0x1f
    str r1, [r0, #0x4]
    bic r5, r7, #0x3e
    orr r5, r5, #0x16
    strh r5, [sp, #0xe]
    mov r2, r2, lsl #0x10
    ldrh r7, [sp, #0xe]
    mov r5, r2, lsr #0x10
    ldrh r6, [sp, #0x10]
    ldr r2, _LIT2
    bic r7, r7, #0x4000
    and r6, r6, r2
    mov r2, r5, lsl #0x17
    orr r2, r6, r2, lsr #0x11
    str r1, [r0, #0x8]
    str r1, [r0, #0xc]
    str r1, [r0, #0x10]
    str r1, [r0, #0x14]
    strh r3, [sp, #0xc]
    strh r7, [sp, #0xe]
    strh r2, [sp, #0x10]
    bl func_ov002_021fc3e8
    cmp r0, #0x0
    beq .L_348
    add r0, sp, #0xc
    bl func_ov002_02297050
    cmp r0, #0x0
    bne .L_348
    ldr r0, [sp]
    mov r1, #0x0
    ldr r2, [r0, #0x4]
    add r0, sp, #0xc
    blx r2
    cmp r0, #0x0
    beq .L_348
    ldr r5, _LIT3
    mov r0, sl
    mov r2, r4
    mov r1, #0xb
    mov r3, #0x3
    str sl, [r5, #0xd6c]
    bl func_ov002_02259774
    mov r1, r5
    mov r0, #0x1
    str r0, [r1, #0xd54]
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_348:
    mov r0, #0x0
    add sp, sp, #0x3c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word 0xffff803f
_LIT3: .word data_ov002_022d016c
