; func_ov002_022589c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022d016c
        .extern func_0202e234
        .extern func_0203158c
        .extern func_ov002_021bd710
        .extern func_ov002_021bd948
        .extern func_ov002_021bdc94
        .extern func_ov002_021bdde0
        .extern func_ov002_021be2d8
        .extern func_ov002_021fc1a0
        .extern func_ov002_0225753c
        .global func_ov002_022589c0
        .arm
func_ov002_022589c0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x30
    mov r9, r1
    ldr r3, _LIT0
    and r4, r9, #0x1
    mov r8, r2
    mul r7, r4, r3
    mov r1, #0x14
    cmp r8, #0x4
    mul r6, r8, r1
    ldr r2, _LIT1
    mov sl, r0
    add r1, r2, r7
    add r1, r1, #0x30
    mov r4, #0x0
    add r5, r1, r6
    addgt sp, sp, #0x30
    movgt r0, r4
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r1, _LIT2
    ldr r1, [r1, #0x4]
    eor r1, r1, #0x1
    cmp r9, r1
    bne .L_170
    bl func_0202e234
    cmp r0, #0x0
    ldrneh r0, [r5, #0x8]
    cmpne r0, #0x0
    beq .L_164
    mov r0, sl
    bl func_0203158c
    cmp r0, #0x0
    beq .L_164
    add r0, sp, #0x18
    mov r1, r4
    str r1, [r0]
    ldrh r3, [sp, #0x1a]
    mov r2, r9, lsl #0x10
    mov r2, r2, lsr #0x10
    bic r3, r3, #0x1
    and r2, r2, #0x1
    orr r2, r3, r2
    strh r2, [sp, #0x1a]
    mov r2, r8, lsl #0x10
    mov r3, r2, lsr #0x10
    ldrh r5, [sp, #0x1a]
    mov r3, r3, lsl #0x1b
    str r1, [r0, #0x4]
    orr r2, r5, #0x4000
    strh r2, [sp, #0x1a]
    ldrh r5, [sp, #0x1a]
    ldr r2, _LIT1
    str r1, [r0, #0x8]
    bic r5, r5, #0x3e
    orr r3, r5, r3, lsr #0x1a
    add r2, r2, r7
    strh r3, [sp, #0x1a]
    add r2, r2, #0x30
    ldr r3, [r2, r6]
    ldrh r5, [sp, #0x1a]
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    bic r5, r5, #0xfc0
    strh r5, [sp, #0x1a]
    ldrh r5, [sp, #0x1a]
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    mov r2, r2, lsl #0x10
    mov r3, r2, lsr #0x10
    bic r2, r5, #0x3000
    orr r6, r2, #0x3000
    ldrh r5, [sp, #0x1c]
    ldr r2, _LIT3
    mov r3, r3, lsl #0x17
    and r2, r5, r2
    orr r3, r2, r3, lsr #0x11
    strh r3, [sp, #0x1c]
    ldr r2, _LIT4
    str r1, [r0, #0xc]
    str r1, [r0, #0x10]
    str r1, [r0, #0x14]
    strh sl, [sp, #0x18]
    strh r6, [sp, #0x1a]
    mov r3, #0x4
    str r3, [r2, #0xd80]
    bl func_ov002_021fc1a0
    cmp r0, #0x0
    orrne r4, r4, #0x8
.L_164:
    add sp, sp, #0x30
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_170:
    ldr r0, _LIT4
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x2
    beq .L_190
    cmp r0, #0x3
    beq .L_218
    cmp r0, #0x4
    bne .L_260
.L_190:
    mov r0, r9
    mov r1, r8
    bl func_ov002_021bd710
    cmp r0, #0x0
    beq .L_1c4
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    cmp r9, r0
    bne .L_260
    ldr r0, _LIT4
    mov r1, #0x10
    str r1, [r0, #0xd80]
    b .L_260
.L_1c4:
    mov r0, r9
    mov r1, r8
    bl func_ov002_021bd948
    cmp r0, #0x0
    beq .L_260
    ldrh r0, [r5, #0x8]
    cmp r0, #0x0
    ldrh r0, [r5, #0x6]
    beq .L_1f8
    cmp r0, #0x0
    orrne r4, r4, #0x100
    orreq r4, r4, #0x200
    b .L_260
.L_1f8:
    cmp r0, #0x0
    orreq r4, r4, #0x200
    mov r0, r9
    mov r1, r8
    bl func_ov002_021bdc94
    cmp r0, #0x0
    orrne r4, r4, #0x20
    b .L_260
.L_218:
    mov r0, r9
    mov r1, r8
    bl func_ov002_021bdde0
    cmp r0, #0x0
    bne .L_254
    ldr r3, _LIT4
    mov r5, #0x7
    mov r0, r9
    mov r1, r8
    mov r2, #0x1
    str r5, [r3, #0xd80]
    bl func_ov002_021be2d8
    cmp r0, #0x0
    orrne r4, r4, #0x1
    b .L_260
.L_254:
    ldr r0, _LIT4
    mov r1, #0x8
    str r1, [r0, #0xd80]
.L_260:
    ldr r0, _LIT5
    add r0, r0, r7
    ldrh r0, [r6, r0]
    cmp r0, #0x0
    beq .L_368
    mov r0, sl
    bl func_0202e234
    cmp r0, #0x0
    beq .L_368
    mov r0, sl
    bl func_ov002_0225753c
    cmp r0, #0x0
    beq .L_368
    add r0, sp, #0x0
    mov r1, #0x0
    str r1, [r0]
    ldrh r3, [sp, #0x2]
    mov r2, r9, lsl #0x10
    mov r2, r2, lsr #0x10
    bic r3, r3, #0x1
    and r2, r2, #0x1
    orr r2, r3, r2
    strh r2, [sp, #0x2]
    ldrh r5, [sp, #0x2]
    mov r2, r8, lsl #0x10
    mov r3, r2, lsr #0x10
    ldr r2, _LIT1
    bic r5, r5, #0x3e
    mov r3, r3, lsl #0x1b
    orr r3, r5, r3, lsr #0x1a
    add r2, r2, r7
    strh r3, [sp, #0x2]
    add r2, r2, #0x30
    ldr r3, [r2, r6]
    ldrh r5, [sp, #0x2]
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    bic r5, r5, #0xfc0
    strh r5, [sp, #0x2]
    ldrh r5, [sp, #0x2]
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    mov r2, r2, lsl #0x10
    mov r3, r2, lsr #0x10
    bic r2, r5, #0x3000
    orr r6, r2, #0x3000
    str r1, [r0, #0x4]
    ldrh r5, [sp, #0x4]
    ldr r2, _LIT3
    mov r3, r3, lsl #0x17
    and r2, r5, r2
    orr r3, r2, r3, lsr #0x11
    strh r3, [sp, #0x4]
    ldr r2, _LIT4
    str r1, [r0, #0x8]
    str r1, [r0, #0xc]
    str r1, [r0, #0x10]
    str r1, [r0, #0x14]
    strh sl, [sp]
    strh r6, [sp, #0x2]
    mov r3, #0x4
    str r3, [r2, #0xd80]
    bl func_ov002_021fc1a0
    cmp r0, #0x0
    orrne r4, r4, #0x8
.L_368:
    mov r0, r4
    add sp, sp, #0x30
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cd73c
_LIT3: .word 0xffff803f
_LIT4: .word data_ov002_022d016c
_LIT5: .word data_ov002_022cf1a4
