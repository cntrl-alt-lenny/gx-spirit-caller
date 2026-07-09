; func_ov002_022554bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022d008c
        .extern func_0202b86c
        .extern func_ov002_021b4040
        .extern func_ov002_021b8eec
        .extern func_ov002_021bcf50
        .extern func_ov002_021d58dc
        .extern func_ov002_021d5a90
        .extern func_ov002_021de3c0
        .extern func_ov002_021deb3c
        .extern func_ov002_021dec64
        .extern func_ov002_021e2ca4
        .global func_ov002_022554bc
        .arm
func_ov002_022554bc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x28
    mov r0, #0x0
    str r0, [sp, #0x8]
.L_10:
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, [r0, #0xcec]
    ldr r0, [sp, #0x8]
    ldr r2, _LIT2
    eor r5, r3, r0
    and r0, r5, #0x1
    mla sl, r0, r1, r2
    mov r0, r5, lsl #0x10
    mov r0, r0, lsr #0x10
    and r0, r0, #0x1
    ldr r4, _LIT3
    str sl, [sp, #0x4]
    add r9, sl, #0x30
    and fp, r5, #0xff
    mov r6, #0x0
    str r0, [sp, #0xc]
.L_54:
    ldr r1, [r9]
    mov r0, r5
    mov r1, r1, lsl #0x13
    mov r7, r1, lsr #0x13
    mov r1, r6
    bl func_ov002_021b8eec
    cmp r0, #0x0
    beq .L_270
    mov r0, r5
    mov r1, r6
    mov r2, r4
    bl func_ov002_021b4040
    and r1, r0, #0xff
    cmp r1, r5
    bne .L_218
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    ands r8, r0, #0xff
    mov r1, #0x0
    add r0, sp, #0x10
    str r1, [r0]
    str r1, [r0, #0x4]
    str r1, [r0, #0x8]
    str r1, [r0, #0xc]
    str r1, [r0, #0x10]
    str r1, [r0, #0x14]
    ldrh r1, [sp, #0x14]
    ldr r0, _LIT4
    ldr r3, [r9]
    and r1, r1, r0
    mov r0, r3, lsl #0x12
    mov r3, r3, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r3, r3, lsl #0x1
    add r0, r3, r0, lsr #0x1f
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x17
    orr r0, r1, r0, lsr #0x11
    ldrh r2, [sp, #0x12]
    strh r0, [sp, #0x14]
    ldr r0, [sp, #0xc]
    bic r1, r2, #0x1
    orr r0, r1, r0
    strh r0, [sp, #0x12]
    ldrh r1, [sp, #0x12]
    mov r0, r6, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x3e
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x1a
    strh r0, [sp, #0x12]
    ldrh r0, [sp, #0x12]
    strh r7, [sp, #0x10]
    bic r0, r0, #0x3000
    orr r0, r0, #0x1000
    strh r0, [sp, #0x12]
    bmi .L_15c
    ldr r0, [sp, #0x4]
    mov r1, #0x14
    mla r0, r8, r1, r0
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_178
.L_15c:
    add r0, sp, #0x10
    mov r1, r5
    mov r2, r6
    bl func_ov002_021de3c0
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_178:
    ldrh r0, [sl, #0x38]
    cmp r0, #0x0
    bne .L_1bc
    add r0, sp, #0x10
    mov r1, r5
    mov r2, r6
    mov r3, r5
    str r8, [sp]
    bl func_ov002_021dec64
    mov r0, r5
    mov r1, r8
    mov r2, #0x14
    mov r3, #0x1
    bl func_ov002_021e2ca4
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1bc:
    ldr r0, [sl, #0x40]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    beq .L_270
    mov r0, r7
    bl func_0202b86c
    cmp r0, #0x4
    bne .L_1f8
    add r0, sp, #0x10
    mov r1, r5
    mov r2, r6
    mov r3, r5
    str r8, [sp]
    bl func_ov002_021dec64
    b .L_20c
.L_1f8:
    mov r2, #0x0
    mov r0, r5
    mov r1, r6
    mov r3, r2
    bl func_ov002_021deb3c
.L_20c:
    add sp, sp, #0x28
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_218:
    mov r0, r5
    mov r1, r6
    mov r2, r4
    mov r3, #0x1
    bl func_ov002_021d5a90
    mov r0, r5
    bl func_ov002_021bcf50
    cmp r0, #0x0
    movlt r0, #0x0
    blt .L_248
    mov r0, r5
    bl func_ov002_021bcf50
.L_248:
    and r0, r0, #0xff
    orr r0, fp, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    str r0, [sp]
    mov r0, r5
    mov r1, r6
    mov r2, r4
    mov r3, #0x5
    bl func_ov002_021d58dc
.L_270:
    add r9, r9, #0x14
    add sl, sl, #0x14
    add r6, r6, #0x1
    cmp r6, #0x4
    ble .L_54
    ldr r0, [sp, #0x8]
    add r0, r0, #0x1
    str r0, [sp, #0x8]
    cmp r0, #0x2
    blt .L_10
    mov r0, #0x0
    add sp, sp, #0x28
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00001472
_LIT4: .word 0xffff803f
