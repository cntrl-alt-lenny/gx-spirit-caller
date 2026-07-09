; func_ov002_021e302c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_ov002_021e2d90
        .extern func_ov002_02257a60
        .global func_ov002_021e302c
        .arm
func_ov002_021e302c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x18
    add r7, sp, #0x0
    mov r8, #0x0
    str r8, [r7]
    ldrh r3, [sp, #0x2]
    and r2, r0, #-2147483648
    mov r2, r2, lsr #0x1f
    and r4, r0, #0xe00000
    mov r4, r4, lsr #0x15
    mov r4, r4, lsl #0x10
    mov r6, r4, lsr #0x10
    and r4, r0, #0x1f0000
    mov r4, r4, lsr #0x10
    mov r5, r4, lsl #0x10
    bic r3, r3, #0x1
    and r2, r2, #0x1
    orr r2, r3, r2
    strh r2, [sp, #0x2]
    and r2, r0, #0x1000000
    mov r2, r2, lsr #0x18
    ldrh r3, [sp, #0x2]
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    mov r4, r1
    bic r3, r3, #0x4000
    mov r1, r2, lsl #0x1f
    orr r1, r3, r1, lsr #0x11
    strh r1, [sp, #0x2]
    ldrh r3, [sp, #0x2]
    str r8, [r7, #0x4]
    mov r1, r6, lsl #0x1e
    bic r3, r3, #0x3000
    orr r1, r3, r1, lsr #0x12
    strh r1, [sp, #0x2]
    mov r5, r5, lsr #0x10
    ldrh r2, [sp, #0x4]
    ldr r1, _LIT0
    ldrh r6, [sp, #0x2]
    mov r3, r5, lsl #0x1b
    and r2, r2, r1
    bic r5, r6, #0x3e
    mov r1, r4, lsl #0x17
    orr r3, r5, r3, lsr #0x1a
    orr r1, r2, r1, lsr #0x11
    ldr r9, _LIT1
    str r8, [r7, #0x8]
    str r8, [r7, #0xc]
    str r8, [r7, #0x10]
    str r8, [r7, #0x14]
    strh r3, [sp, #0x2]
    strh r1, [sp, #0x4]
    strh r0, [sp]
    ldr r0, [r9, #0x5d4]
    cmp r0, #0x0
    beq .L_1c0
    bls .L_1c0
    mov r6, r9
    mov sl, r9
    mov r5, r8
.L_f0:
    ldrh r3, [sp, #0x2]
    ldrb r1, [r9, #0x5dc]
    add r0, r6, r8, lsl #0x2
    ldr r2, [r0, #0x5fc]
    bic r3, r3, #0xfc0
    mov r0, r1, lsl #0x1a
    orr r3, r3, r0, lsr #0x14
    mov r0, r7
    mov r1, r5
    strh r3, [sp, #0x2]
    str r2, [sp, #0x14]
    bl func_ov002_02257a60
    cmp r0, #0x0
    beq .L_1ac
    ldrh r8, [sp, #0x2]
    ldrh r1, [sp]
    ldr r3, [sp, #0x14]
    mov r2, r8, lsl #0x1f
    mov r0, r8, lsl #0x14
    mov r5, r8, lsl #0x11
    mov r7, r8, lsl #0x12
    mov r6, r5, lsr #0x1f
    mov r2, r2, lsr #0x1f
    mov r5, r2, lsl #0x1f
    mov r0, r0, lsr #0x1a
    mov r2, r0, lsl #0x19
    mov r8, r8, lsl #0x1a
    mov r0, r7, lsr #0x1e
    mov r6, r6, lsl #0x18
    and r5, r5, #-2147483648
    and r2, r2, #0x7e000000
    mov r8, r8, lsr #0x1b
    mov r7, r0, lsl #0x15
    orr r2, r5, r2
    and r6, r6, #0x1000000
    mov r0, r8, lsl #0x10
    orr r2, r6, r2
    and r5, r7, #0xe00000
    and r6, r0, #0x1f0000
    orr r0, r5, r2
    orr r0, r6, r0
    orr r1, r1, r0
    mov r2, r4
    mov r0, #0x0
    bl func_ov002_021e2d90
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1ac:
    ldr r0, [sl, #0x5d4]
    add r8, r8, #0x1
    cmp r8, r0
    add r9, r9, #0x1
    bcc .L_f0
.L_1c0:
    ldrh r6, [sp, #0x2]
    mov r0, #0x0
    ldrh r1, [sp]
    mov r3, r6, lsl #0x1f
    mov r2, r6, lsl #0x11
    mov r5, r6, lsl #0x12
    mov r3, r3, lsr #0x1f
    mov r2, r2, lsr #0x1f
    mov r6, r6, lsl #0x1a
    mov r5, r5, lsr #0x1e
    mov r3, r3, lsl #0x1f
    mov r2, r2, lsl #0x18
    mov r6, r6, lsr #0x1b
    mov r5, r5, lsl #0x15
    mov r6, r6, lsl #0x10
    and r3, r3, #-2147483648
    and r2, r2, #0x1000000
    and r5, r5, #0xe00000
    orr r2, r3, r2
    and r3, r6, #0x1f0000
    orr r2, r5, r2
    orr r5, r3, r2
    mov r2, r4
    mov r3, r0
    orr r1, r1, r5
    bl func_ov002_021e2d90
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0xffff803f
_LIT1: .word data_ov002_022ce1a8
