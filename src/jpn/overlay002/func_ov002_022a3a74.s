; func_ov002_022a3a74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bee8c
        .extern data_ov002_022d0ed4
        .extern data_ov002_022d0ee4
        .extern func_020371b8
        .extern func_0208b008
        .extern func_0208b014
        .extern func_0208b020
        .extern func_0208e230
        .extern func_0208e2f4
        .extern func_0208e334
        .extern func_ov002_022a567c
        .global func_ov002_022a3a74
        .arm
func_ov002_022a3a74:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x18
    mov r6, r0
    ldr r1, [r6, #0x8]
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b .L_3a8
    b .L_38
    b .L_15c
    b .L_1b4
    b .L_274
    b .L_2cc
    b .L_300
    b .L_39c
.L_38:
    ldr r0, [r6, #0xc]
    cmp r0, #0x0
    bne .L_58
    mov r0, #0x8a
    sub r1, r0, #0x8b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
.L_58:
    ldr r4, [r6, #0xc]
    ldr r3, _LIT0
    mov r1, r4, lsl #0x10
    mov r0, r1, asr #0x2
    add r0, r1, r0, lsr #0x1d
    mov r0, r0, lsl #0xd
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x4
    mov r2, r0, lsl #0x1
    rsb r5, r4, #0x10
    add r0, r5, r5, lsl #0x1
    mov lr, r0, lsl #0xa
    mov r0, lr, asr #0x3
    add r0, lr, r0, lsr #0x1c
    add r7, r4, #0x1
    mov lr, r0, asr #0x4
    str r7, [r6, #0xc]
    add r1, r2, #0x1
    mov ip, r2, lsl #0x1
    mov r2, r1, lsl #0x1
    ldrsh r1, [r3, ip]
    ldrsh r2, [r3, r2]
    add r0, sp, #0x8
    rsb r7, lr, #0x1000
    bl func_0208b014
    add r0, sp, #0x8
    mov r2, r7
    mov r1, r0
    mov r3, r7
    bl func_0208b020
    mov r2, #0x0
    str r2, [sp]
    sub r2, r2, #0x38
    str r2, [sp, #0x4]
    ldr r0, _LIT1
    add r1, sp, #0x8
    mov r2, #0x80
    mov r3, #0x14
    bl func_0208e334
    ldr r0, _LIT2
    mov r3, r4
    mov r1, #0x4
    mov r2, #0x3f
    str r5, [sp]
    bl func_0208e230
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x4
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    ldr r0, [r6, #0xc]
    cmp r0, #0x10
    addle sp, sp, #0x18
    ldmleia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, [r6, #0x8]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r6, #0x8]
    add sp, sp, #0x18
    str r0, [r6, #0xc]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_15c:
    ldr r3, [r6, #0xc]
    ldr r0, _LIT2
    mov r2, r3, lsr #0x1f
    rsb r1, r2, r3, lsl #0x1d
    add r1, r2, r1, ror #0x1d
    add r2, r3, #0x1
    mov r1, r1, lsl #0x1
    str r2, [r6, #0xc]
    rsb r2, r1, #0x10
    mov r1, #0x4
    bl func_0208e2f4
    ldr r0, [r6, #0xc]
    cmp r0, #0x10
    addlt sp, sp, #0x18
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, [r6, #0x8]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r6, #0x8]
    add sp, sp, #0x18
    str r0, [r6, #0xc]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1b4:
    ldr r1, [r6, #0xc]
    add r0, sp, #0x8
    add r4, r1, #0x1
    rsb r5, r4, #0x10
    add r1, r5, r5, lsl #0x1
    mov r2, r1, lsl #0xa
    mov r1, r2, asr #0x3
    add r1, r2, r1, lsr #0x1c
    mov r1, r1, asr #0x4
    rsb r1, r1, #0x1000
    mov r2, r1
    str r4, [r6, #0xc]
    bl func_0208b008
    mov r2, #0x0
    ldr r0, _LIT3
    add r1, sp, #0x8
    str r2, [sp]
    sub ip, r2, #0x60
    mov r2, #0x80
    mov r3, #0x14
    str ip, [sp, #0x4]
    bl func_0208e334
    ldr r0, _LIT2
    mov r3, r4
    mov r1, #0x8
    mov r2, #0x3f
    str r5, [sp]
    bl func_0208e230
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, [r2]
    and r1, r1, #0x1f00
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    orr r0, r3, #0x8
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
    ldr r0, [r6, #0xc]
    cmp r0, #0x10
    addlt sp, sp, #0x18
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, [r6, #0x8]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r6, #0x8]
    add sp, sp, #0x18
    str r0, [r6, #0xc]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_274:
    ldr r3, [r6, #0xc]
    ldr r0, _LIT2
    mov r2, r3, lsr #0x1f
    rsb r1, r2, r3, lsl #0x1d
    add r1, r2, r1, ror #0x1d
    add r2, r3, #0x1
    mov r1, r1, lsl #0x1
    str r2, [r6, #0xc]
    rsb r2, r1, #0x10
    mov r1, #0x8
    bl func_0208e2f4
    ldr r0, [r6, #0xc]
    cmp r0, #0x10
    addlt sp, sp, #0x18
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, [r6, #0x8]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r6, #0x8]
    add sp, sp, #0x18
    str r0, [r6, #0xc]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2cc:
    ldr r0, [r6, #0xc]
    add r0, r0, #0x1
    cmp r0, #0x20
    addlt sp, sp, #0x18
    str r0, [r6, #0xc]
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, [r6, #0x8]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r6, #0x8]
    add sp, sp, #0x18
    str r0, [r6, #0xc]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_300:
    ldr r0, [r6, #0xc]
    mov r1, #0x1000
    add r4, r0, #0x1
    mov r2, r4, lsl #0x8
    mov r0, r2, asr #0x3
    add r3, r2, r0, lsr #0x1c
    add r0, sp, #0x8
    mov r2, r1
    str r4, [r6, #0xc]
    mov r5, r3, asr #0x4
    bl func_0208b008
    ldr r0, _LIT1
    add r1, sp, #0x8
    str r5, [sp]
    mvn r4, #0x37
    mov r2, #0x80
    mov r3, #0x14
    str r4, [sp, #0x4]
    bl func_0208e334
    rsb r0, r5, #0x0
    str r0, [sp]
    mvn r2, #0x5f
    str r2, [sp, #0x4]
    ldr r0, _LIT3
    add r1, sp, #0x8
    mov r2, #0x80
    mov r3, #0x14
    bl func_0208e334
    ldr r0, [r6, #0xc]
    cmp r0, #0x10
    addlt sp, sp, #0x18
    ldmltia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, [r6, #0x8]
    mov r0, #0x0
    add r1, r1, #0x1
    str r1, [r6, #0x8]
    add sp, sp, #0x18
    str r0, [r6, #0xc]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_39c:
    mov r1, #0x2
    mov r2, #0x0
    bl func_ov002_022a567c
.L_3a8:
    add sp, sp, #0x18
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_020bee8c
_LIT1: .word data_ov002_022d0ed4
_LIT2: .word 0x04000050
_LIT3: .word data_ov002_022d0ee4
