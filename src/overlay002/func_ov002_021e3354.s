; func_ov002_021e3354 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021e2e80
        .extern func_ov002_02257b48
        .global func_ov002_021e3354
        .arm
func_ov002_021e3354:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x18
    add r6, sp, #0x0
    mov r7, #0x0
    str r7, [r6]
    ldrh r4, [sp, #0x2]
    and r3, r0, #-2147483648
    mov r3, r3, lsr #0x1f
    bic r4, r4, #0x1
    and r3, r3, #0x1
    orr r3, r4, r3
    strh r3, [sp, #0x2]
    and r4, r0, #0xe00000
    and r3, r0, #0x1000000
    mov r4, r4, lsr #0x15
    mov r3, r3, lsr #0x18
    ldrh r5, [sp, #0x2]
    mov r4, r4, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r9, r4, lsr #0x10
    and r4, r0, #0x1f0000
    mov r4, r4, lsr #0x10
    mov r8, r4, lsl #0x10
    mov r3, r3, lsr #0x10
    mov r4, r1
    bic r5, r5, #0x4000
    mov r1, r3, lsl #0x1f
    orr r1, r5, r1, lsr #0x11
    strh r1, [sp, #0x2]
    ldrh r5, [sp, #0x2]
    str r7, [r6, #0x4]
    mov r1, r9, lsl #0x1e
    bic r5, r5, #0x3000
    orr r1, r5, r1, lsr #0x12
    strh r1, [sp, #0x2]
    mov r8, r8, lsr #0x10
    ldrh r3, [sp, #0x4]
    ldr r1, _LIT0
    ldrh r9, [sp, #0x2]
    mov r5, r8, lsl #0x1b
    and r3, r3, r1
    bic r8, r9, #0x3e
    orr r5, r8, r5, lsr #0x1a
    mov r1, r4, lsl #0x17
    orr r1, r3, r1, lsr #0x11
    ldr r8, _LIT1
    str r7, [r6, #0x8]
    str r7, [r6, #0xc]
    str r7, [r6, #0x10]
    str r7, [r6, #0x14]
    strh r5, [sp, #0x2]
    strh r1, [sp, #0x4]
    strh r0, [sp]
    ldr r0, [r8, #0x5d4]
    mov r9, r2
    cmp r0, #0x0
    beq .L_3f8
    bls .L_3f8
    mov r5, r8
    mov sl, r8
.L_328:
    ldrh r3, [sp, #0x2]
    ldrb r1, [r8, #0x5dc]
    add r0, r5, r7, lsl #0x2
    ldr r2, [r0, #0x5fc]
    bic r3, r3, #0xfc0
    mov r0, r1, lsl #0x1a
    orr r3, r3, r0, lsr #0x14
    mov r0, r6
    mov r1, r9
    strh r3, [sp, #0x2]
    str r2, [sp, #0x14]
    bl func_ov002_02257b48
    cmp r0, #0x0
    beq .L_3e4
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
    mov r0, #0x1
    bl func_ov002_021e2e80
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_3e4:
    ldr r0, [sl, #0x5d4]
    add r7, r7, #0x1
    cmp r7, r0
    add r8, r8, #0x1
    bcc .L_328
.L_3f8:
    ldrh r5, [sp, #0x2]
    ldrh r0, [sp]
    mov r2, r4
    mov r3, r5, lsl #0x1f
    mov r1, r5, lsl #0x11
    mov r4, r5, lsl #0x12
    mov r3, r3, lsr #0x1f
    mov r1, r1, lsr #0x1f
    mov r5, r5, lsl #0x1a
    mov r4, r4, lsr #0x1e
    mov r3, r3, lsl #0x1f
    mov r1, r1, lsl #0x18
    mov r5, r5, lsr #0x1b
    mov r4, r4, lsl #0x15
    mov r5, r5, lsl #0x10
    and r3, r3, #-2147483648
    and r1, r1, #0x1000000
    and r4, r4, #0xe00000
    orr r1, r3, r1
    and r3, r5, #0x1f0000
    orr r1, r4, r1
    orr r1, r3, r1
    orr r1, r0, r1
    mov r0, #0x1
    mov r3, #0x0
    bl func_ov002_021e2e80
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0xffff803f
_LIT1: .word data_ov002_022ce288
