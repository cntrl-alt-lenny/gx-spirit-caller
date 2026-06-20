; func_ov002_0229d5c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bef80
        .extern data_ov002_022d0f98
        .extern data_ov002_022d100c
        .extern data_ov002_022d1014
        .extern func_0207ef90
        .extern func_0207f05c
        .extern func_0208b0fc
        .extern func_0208b108
        .extern func_0208e318
        .extern func_020b3870
        .extern func_ov002_0229d0b0
        .extern func_ov002_0229d2c8
        .global func_ov002_0229d5c0
        .arm
func_ov002_0229d5c0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x2c
    mov r5, r0
    ldrsb r0, [r5]
    cmp r0, #0x0
    addeq sp, sp, #0x2c
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldrsb r0, [r5, #0x3]
    mov r2, r0, lsr #0x1f
    rsb r1, r2, r0, lsl #0x1d
    add r1, r2, r1, ror #0x1d
    cmp r1, #0x4
    addeq sp, sp, #0x2c
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldrsb r1, [r5, #0x2]
    ldrsh r8, [r5, #0x6]
    ldrsh r6, [r5, #0x8]
    mov r3, r1, lsr #0x1f
    rsb r2, r3, r1, lsl #0x1d
    mov r4, #0x0
    mov r7, r4
    sub r8, r8, #0x10
    sub r9, r6, #0x10
    adds r2, r3, r2, ror #0x1d
    bne .L_358
    ldrh r2, [r5, #0xa]
    mov r2, r2, lsl #0x11
    mov r2, r2, lsr #0x1f
    cmp r0, r2, lsl #0x3
    bne .L_358
    cmp r1, #0x8
    beq .L_330
    cmp r1, #0x10
    beq .L_328
    cmp r1, #0x18
    beq .L_344
    b .L_3e0
.L_328:
    orr r4, r4, #0x30000000
    b .L_3e0
.L_330:
    ldr r0, _LIT0
    orr r4, r4, #0x100
    sub r8, r8, #0x1
    ldr r7, [r0]
    b .L_3e0
.L_344:
    ldr r0, _LIT0
    orr r4, r4, #0x100
    sub r9, r9, #0x1
    ldr r7, [r0, #0x4]
    b .L_3e0
.L_358:
    mov r0, r1, lsl #0xb
    mov r0, r0, asr #0x4
    mov r1, r0, lsl #0x1
    add r0, r1, #0x1
    ldr r2, _LIT1
    mov r1, r1, lsl #0x1
    mov r0, r0, lsl #0x1
    ldrsh r1, [r2, r1]
    ldrsh r2, [r2, r0]
    add r0, sp, #0x1c
    bl func_0208b0fc
    ldrsb r1, [r5, #0x3]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1d
    mov r1, r1, lsr #0x11
    mov r1, r1, asr #0x4
    mov r1, r1, lsl #0x1
    add r1, r1, #0x1
    mov r1, r1, lsl #0x1
    ldrsh r1, [r0, r1]
    mov r0, #0x1000000
    cmp r1, #0x0
    rsblt r1, r1, #0x0
    bl func_020b3870
    mov r2, r0
    add r0, sp, #0x1c
    add r1, sp, #0xc
    mov r3, #0x1000
    bl func_0208b108
    ldr r0, _LIT2
    add r1, sp, #0xc
    orr r4, r4, #0x100
    bl func_0207ef90
    mov r7, r0
.L_3e0:
    ldrsb r0, [r5, #0x3]
    add r0, r0, #0x4
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1c
    add r0, r1, r0, ror #0x1c
    cmp r0, #0x8
    movlt r1, #0x0
    ldrge r1, [r5, #0xc]
    ldr r0, _LIT3
    bl func_ov002_0229d0b0
    mov r6, r0
    mov r0, r5
    bl func_ov002_0229d2c8
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    cmp r4, #0x100
    rsb r0, r0, #0x2
    cmpne r4, #0x300
    bne .L_458
    mov r1, r7, lsl #0x19
    and r2, r9, #0xff
    orr r1, r1, #0x2000
    orr r1, r2, r1
    mov r2, r8, lsl #0x17
    orr r1, r1, #-2147483648
    orr r1, r1, r2, lsr #0x7
    orr r1, r4, r1
    str r1, [sp, #0x4]
    b .L_474
.L_458:
    and r1, r9, #0xff
    orr r1, r1, #0x2000
    mov r2, r8, lsl #0x17
    orr r1, r1, #-2147483648
    orr r1, r1, r2, lsr #0x7
    orr r1, r4, r1
    str r1, [sp, #0x4]
.L_474:
    mov r0, r0, lsl #0xa
    orr r0, r0, r6, lsr #0x7
    strh r0, [sp, #0x8]
    ldr r0, [r5, #0x10]
    cmp r0, #0x0
    beq .L_4c8
    subs r3, r0, #0x10
    ldr r1, [sp, #0x4]
    ldrh r0, [sp, #0x8]
    bic r1, r1, #0xc00
    orr r2, r1, #0x400
    bic r1, r0, #0xf000
    rsbmi r3, r3, #0x0
    str r2, [sp, #0x4]
    strh r1, [sp, #0x8]
    rsb r4, r3, #0x10
    ldr r0, _LIT4
    mov r1, #0x0
    mov r2, #0x3f
    str r4, [sp]
    bl func_0208e318
.L_4c8:
    ldr r0, _LIT2
    add r1, sp, #0x4
    mov r2, #0x1
    bl func_0207f05c
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022d100c
_LIT1: .word data_020bef80
_LIT2: .word data_ov002_022d0f98
_LIT3: .word data_ov002_022d1014
_LIT4: .word 0x04001050
