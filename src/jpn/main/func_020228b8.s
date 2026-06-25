; func_020228b8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c67b4
        .extern func_020221d0
        .extern func_0202246c
        .extern func_0202252c
        .extern func_020225b4
        .global func_020228b8
        .arm
func_020228b8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x20
    mov r8, r1
    mov r9, r0
    mov r7, r2
    bl func_020221d0
    mov r4, r0
    ldrsh r0, [r8, #0xc]
    add r1, sp, #0x4
    bl func_020225b4
    cmp r0, #0x0
    addeq sp, sp, #0x20
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r6, [r0]
    mov r0, r9
    ldr r3, [r6]
    ldr r1, [r6, #0x4]
    mov r5, r3, lsr #0x14
    mov r2, r1, lsl #0x10
    mov r3, r3, lsl #0x10
    and r1, r5, #0xf
    mov r2, r2, lsr #0x10
    mov r5, r3, asr #0x10
    bl func_0202246c
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0xc
    str r0, [sp, #0x14]
    ldr r0, [r6, #0x4]
    ldr r1, [r6]
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x14
    mov r2, r0, lsl #0x10
    mov r0, r9
    and r1, r1, #0xf
    mov r2, r2, lsr #0x10
    bl func_0202246c
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0xc
    str r0, [sp, #0x18]
    ldr r1, [r6]
    mov r0, r9
    mov r1, r1, lsr #0x14
    and r1, r1, #0xf
    ldr r2, [r6, #0x8]
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_0202246c
    mov r0, r0, lsl #0x10
    mov r0, r0, asr #0xc
    str r0, [sp, #0x1c]
    cmp r5, #0x0
    blt .L_42c
    ldr r0, [sp, #0x4]
    sub r0, r4, r0
    cmp r0, r5
    blt .L_3fc
    ldrsb r0, [r8, #0xe]
    cmp r0, #0x1
    bne .L_3c8
    mov r0, #0x0
    str r0, [sp, #0x14]
    str r0, [sp, #0x18]
    str r0, [sp, #0x1c]
.L_3c8:
    add r3, sp, #0x14
    ldmia r3, {r0, r1, r2}
    stmia r8, {r0, r1, r2}
    ldmia r3, {r0, r1, r2}
    stmia r7, {r0, r1, r2}
    ldrsh r0, [r8, #0xc]
    bl func_0202252c
    mvn r0, #0x0
    strh r0, [r8, #0xc]
    ldrb r0, [r8, #0xf]
    bic r0, r0, #0x1
    strb r0, [r8, #0xf]
    b .L_42c
.L_3fc:
    add r1, sp, #0x8
    str r1, [sp]
    ldrsb r4, [r8, #0xe]
    ldr r2, _LIT0
    add r3, sp, #0x14
    ldr r4, [r2, r4, lsl #0x2]
    mov r1, r5
    mov r2, r8
    blx r4
    add r0, sp, #0x8
    ldmia r0, {r0, r1, r2}
    stmia r7, {r0, r1, r2}
.L_42c:
    mov r0, #0x1
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_020c67b4
