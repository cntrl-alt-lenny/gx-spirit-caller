; func_ov002_022a59ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bef80
        .extern data_02104f4c
        .extern data_ov002_022d0f7c
        .extern data_ov002_022d0f98
        .extern func_0207ef90
        .extern func_0207f05c
        .extern func_0208b0f0
        .extern func_020b3870
        .extern func_ov002_022a3b84
        .extern func_ov002_022a4250
        .global func_ov002_022a59ec
        .arm
func_ov002_022a59ec:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x30
    mov r4, r0
    ldr r1, [r4]
    cmp r1, #0xa
    addls pc, pc, r1, lsl #0x2
    b .L_310
    b .L_310
    b .L_48
    b .L_54
    b .L_310
    b .L_310
    b .L_60
    b .L_310
    b .L_310
    b .L_310
    b .L_310
    b .L_174
.L_48:
    bl func_ov002_022a3b84
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_54:
    bl func_ov002_022a4250
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_60:
    ldr r0, [r4, #0x8]
    ldr r5, _LIT0
    cmp r0, #0x20
    movge r0, #0x20
    mov r0, r0, lsl #0xa
    mov r0, r0, asr #0x4
    mov r0, r0, lsl #0x1
    add r1, r0, #0x1
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1
    ldrsh r0, [r0, r1]
    ldr r2, _LIT2
    str r5, [sp, #0x8]
    mov r0, r0, lsl #0x7
    mov r0, r0, asr #0xc
    sub r0, r0, #0x20
    sub r1, r0, #0x28
    strh r2, [sp, #0xc]
    cmp r1, r5, asr #0x18
    ble .L_110
    ldr r1, _LIT3
    sub r0, r0, #0x28
    ldr r1, [r1, #0x4]
    and r0, r0, #0xff
    mov r1, r1, lsl #0x1b
    mov r1, r1, lsr #0x1e
    mov r2, r1, lsr #0x1f
    rsb r1, r2, r1, lsl #0x1f
    adds r1, r2, r1, ror #0x1f
    mvnne r3, #0xb
    moveq r3, #0xc
    ldr r2, [sp, #0x8]
    ldr r1, _LIT4
    add r3, r3, #0x60
    and r1, r2, r1
    orr r0, r1, r0
    mov r2, r3, lsl #0x17
    orr r3, r0, r2, lsr #0x7
    ldr r0, _LIT5
    add r1, sp, #0x8
    mov r2, #0x1
    str r3, [sp, #0x8]
    bl func_0207f05c
    b .L_15c
.L_110:
    ldrh r2, [sp, #0xc]
    add r3, r0, #0xe0
    ldr r1, _LIT4
    and r0, r2, r5, asr #0x14
    orr r0, r0, #0x23c
    strh r0, [sp, #0xc]
    and r2, r5, r1
    and r1, r3, #0xff
    orr r1, r2, r1
    ldrh r0, [sp, #0xc]
    orr r1, r1, #0x600000
    bic r5, r1, #0xc00
    bic r3, r0, #0xf000
    ldr r0, _LIT6
    add r1, sp, #0x8
    mov r2, #0x1
    str r5, [sp, #0x8]
    strh r3, [sp, #0xc]
    bl func_0207f05c
.L_15c:
    ldr r0, [r4, #0x8]
    add sp, sp, #0x30
    cmp r0, #0x30
    movge r0, #0x0
    strge r0, [r4]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_174:
    ldr r2, [r4, #0x8]
    ldr r1, _LIT3
    mov r0, r2, asr #0x1
    add r0, r2, r0, lsr #0x1e
    ldr r2, [r1, #0x4]
    mov r3, r0, asr #0x2
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsl #0x1d
    rsb r0, r1, r3, lsl #0x1e
    mov r2, r2, lsr #0x1d
    cmp r2, #0x4
    add r5, r1, r0, ror #0x1e
    mov r6, #0x20
    cmpne r2, #0x5
    bne .L_1c0
    mov r1, r3, lsr #0x1f
    rsb r0, r1, r3, lsl #0x1f
    add r5, r1, r0, ror #0x1f
    mov r6, #0x40
.L_1c0:
    cmp r6, #0x20
    ldreq r0, _LIT7
    movne r0, #-1073741824
    orr r1, r0, #0x2000
    mov r0, #0x1000
    str r1, [sp]
    strh r0, [sp, #0x4]
    ldr r0, [r4, #0x8]
    cmp r0, #0x10
    bge .L_22c
    add r1, r0, #0x1
    mov r0, #0x10000
    bl func_020b3870
    mov r2, r0
    add r0, sp, #0x20
    mov r1, #0x1000
    bl func_0208b0f0
    ldr r0, _LIT5
    add r1, sp, #0x20
    bl func_0207ef90
    ldr r2, [sp]
    ldr r1, _LIT8
    and r1, r2, r1
    orr r1, r1, #0x100
    orr r0, r1, r0, lsl #0x19
    str r0, [sp]
    b .L_274
.L_22c:
    cmp r0, #0x50
    ble .L_274
    rsb r1, r0, #0x61
    mov r0, #0x10000
    bl func_020b3870
    mov r2, r0
    add r0, sp, #0x10
    mov r1, #0x1000
    bl func_0208b0f0
    ldr r0, _LIT5
    add r1, sp, #0x10
    bl func_0207ef90
    ldr r2, [sp]
    ldr r1, _LIT8
    and r1, r2, r1
    orr r1, r1, #0x100
    orr r0, r1, r0, lsl #0x19
    str r0, [sp]
.L_274:
    add r0, r6, r6, lsr #0x1f
    mov r0, r0, asr #0x1
    rsb r0, r0, #0x4e
    mov r8, r5, lsl #0x1
    mov r5, #0x400
    mov sl, r6, lsl #0x6
    ldr fp, _LIT4
    and r9, r0, #0xff
    mov r6, #0x0
    mov r7, #0x40
    rsb r5, r5, #0x0
.L_2a0:
    mul r0, sl, r8
    ldr r2, [sp]
    ldrh r1, [sp, #0x4]
    and r2, r2, fp
    orr r3, r2, r9
    add r0, r0, #0x3980
    and r2, r1, r5
    add r1, r0, #0x8000
    mov r0, r7, lsl #0x17
    orr r0, r3, r0, lsr #0x7
    str r0, [sp]
    mov r0, r1, asr #0x6
    add r0, r1, r0, lsr #0x19
    orr r2, r2, r0, asr #0x7
    strh r2, [sp, #0x4]
    ldr r0, _LIT5
    add r1, sp, #0x0
    mov r2, #0x1
    bl func_0207f05c
    add r6, r6, #0x1
    cmp r6, #0x2
    add r7, r7, #0x40
    add r8, r8, #0x1
    blt .L_2a0
    ldr r0, [r4, #0x8]
    cmp r0, #0x60
    movge r0, #0x0
    strge r0, [r4]
.L_310:
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0xc0002000
_LIT1: .word data_020bef80
_LIT2: .word 0x00007593
_LIT3: .word data_02104f4c
_LIT4: .word 0xfe00ff00
_LIT5: .word data_ov002_022d0f98
_LIT6: .word data_ov002_022d0f7c
_LIT7: .word 0xc0004000
_LIT8: .word 0xc1fffcff
