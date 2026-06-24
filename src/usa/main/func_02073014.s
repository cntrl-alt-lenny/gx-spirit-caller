; func_02073014 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219edf0
        .extern data_0219ee3c
        .extern func_02073230
        .global func_02073014
        .arm
func_02073014:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov sl, r0
    mov r0, #0x45
    strb r0, [sl, #-20]
    mov r5, #0x0
    ldr r0, _LIT0
    strb r5, [sl, #-19]
    ldrh r7, [r0]
    ldr r6, [sp, #0x30]
    ldrb r4, [sp, #0x34]
    add r7, r7, #0x1
    strh r7, [r0]
    ldrh r9, [r0]
    mov r0, r6, lsr #0x10
    mov r7, #0x80
    mov r8, r9, asr #0x8
    orr r8, r8, r9, lsl #0x8
    strh r8, [sl, #-16]
    strb r7, [sl, #-12]
    ldr r7, _LIT1
    strb r4, [sl, #-11]
    ldr r8, [r7]
    mov r4, r0, lsl #0x10
    mov r0, r8, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r8, r0, lsr #0x10
    mov r0, r8, asr #0x8
    orr r0, r0, r8, lsl #0x8
    strh r0, [sl, #-8]
    ldr r0, [r7]
    mov r8, r4, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r7, r0, lsr #0x10
    mov r4, r7, asr #0x8
    mov r0, r6, lsl #0x10
    orr r9, r4, r7, lsl #0x8
    mov r7, r8, asr #0x8
    mov r4, r0, lsr #0x10
    mov r0, r4, asr #0x8
    strh r9, [sl, #-6]
    orr r7, r7, r8, lsl #0x8
    ldr fp, _LIT2
    mov r9, r1
    strh r7, [sl, #-4]
    orr r0, r0, r4, lsl #0x8
    mov r8, r2
    mov r7, r3
    strh r0, [sl, #-2]
    cmp r9, fp
    bls .L_178
    mov r4, sl
    cmp r9, fp
    bls .L_118
    str r5, [sp, #0x8]
.L_dc:
    ldr r1, [sp, #0x8]
    mov r0, sl
    mov r2, r4
    mov r3, fp
    str r6, [sp]
    orr ip, r5, #0x2000
    str ip, [sp, #0x4]
    bl func_02073230
    add r0, r5, #0xb9
    sub r9, r9, fp
    mov r0, r0, lsl #0x10
    cmp r9, fp
    add r4, r4, fp
    mov r5, r0, lsr #0x10
    bhi .L_dc
.L_118:
    cmp r9, #0x0
    beq .L_178
    cmp r7, #0x0
    beq .L_14c
    mov r0, sl
    mov r2, r4
    mov r3, r9
    str r6, [sp]
    orr r4, r5, #0x2000
    mov r1, #0x0
    str r4, [sp, #0x4]
    bl func_02073230
    b .L_168
.L_14c:
    str r6, [sp]
    mov r0, sl
    mov r2, r4
    mov r3, r9
    mov r1, #0x0
    str r5, [sp, #0x4]
    bl func_02073230
.L_168:
    add r0, r5, r9, lsr #0x3
    mov r0, r0, lsl #0x10
    mov r5, r0, lsr #0x10
    mov r9, #0x0
.L_178:
    ldr r0, _LIT2
    add r1, r9, r7
    cmp r1, r0
    bls .L_1d8
    mov fp, #0x0
.L_18c:
    ldr r0, _LIT2
    mov r1, r9
    sub r4, r0, r9
    mov r0, sl
    mov r2, r8
    mov r3, r4
    str r6, [sp]
    orr r9, r5, #0x2000
    str r9, [sp, #0x4]
    bl func_02073230
    add r0, r5, #0xb9
    mov r1, r0, lsl #0x10
    ldr r0, _LIT2
    sub r7, r7, r4
    mov r9, fp
    cmp r7, r0
    add r8, r8, r4
    mov r5, r1, lsr #0x10
    bhi .L_18c
.L_1d8:
    adds r0, r9, r7
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    str r6, [sp]
    mov r0, sl
    mov r1, r9
    mov r2, r8
    mov r3, r7
    str r5, [sp, #0x4]
    bl func_02073230
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word data_0219edf0
_LIT1: .word data_0219ee3c
_LIT2: .word 0x000005c8
