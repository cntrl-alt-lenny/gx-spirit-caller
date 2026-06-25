; func_02080c50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02080ff4
        .extern func_020813b0
        .global func_02080c50
        .arm
func_02080c50:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4c
    ldr r7, [sp, #0x74]
    ldrb r5, [r0, #0xc]
    ldr r6, [r1]
    ldr r4, [r7]
    ldr r9, [r6, #0x8]
    mov r8, r5, lsl #0x6
    ldrb r4, [r4, #0x1]
    mov r5, r8, asr #0x2
    add r5, r8, r5, lsr #0x1d
    ldrb r9, [r9, #0x1]
    ldr r8, [r0, #0x4]
    ldr r6, [r0, #0x8]
    str r2, [sp, #0x8]
    str r3, [sp, #0xc]
    cmp r4, #0x0
    mov r5, r5, asr #0x3
    addeq sp, sp, #0x4c
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    adds r3, r2, r4
    addmi sp, sp, #0x4c
    ldmmiia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, [sp, #0xc]
    adds r2, r2, r9
    addmi sp, sp, #0x4c
    ldmmiia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr sl, [sp, #0x8]
    add r3, r3, #0x7
    cmp sl, #0x0
    movle sl, #0x0
    strle sl, [sp, #0x10]
    movgt sl, sl, lsr #0x3
    strgt sl, [sp, #0x10]
    ldr sl, [sp, #0xc]
    add r2, r2, #0x7
    cmp sl, #0x0
    movle sl, #0x0
    mov fp, r2, lsr #0x3
    mov r3, r3, lsr #0x3
    movgt sl, sl, lsr #0x3
    cmp r3, r8
    movcs r3, r8
    cmp fp, r6
    ldr r2, [sp, #0x10]
    movcs fp, r6
    subs r8, r3, r2
    addmi sp, sp, #0x4c
    sub r3, fp, sl
    ldmmiia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r3, #0x0
    addlt sp, sp, #0x4c
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r2, [sp, #0x8]
    ldr r6, [r0]
    cmp r2, #0x0
    andge r2, r2, #0x7
    strge r2, [sp, #0x8]
    ldr r2, [sp, #0xc]
    ldr fp, [sp, #0x8]
    cmp r2, #0x0
    andge r2, r2, #0x7
    strge r2, [sp, #0xc]
    sub r8, fp, r8, lsl #0x3
    ldr fp, [sp, #0xc]
    ldr r2, [sp, #0x70]
    sub r3, fp, r3, lsl #0x3
    str r3, [sp, #0x14]
    ldr r3, [r7, #0x4]
    sub r2, r2, #0x1
    str r3, [sp, #0x28]
    str r2, [sp, #0x48]
    str r9, [sp, #0x38]
    str r4, [sp, #0x34]
    ldr r4, [r1]
    ldr r2, [sp, #0x14]
    mov r3, fp
    cmp r3, r2
    ldr r2, [r4, #0x8]
    ldrb r3, [r2, #0x6]
    str r3, [sp, #0x40]
    ldrb r2, [r0, #0xc]
    str r2, [sp, #0x44]
    ldr r1, [r1]
    ldr r1, [r1, #0x8]
    ldrb r1, [r1]
    mul r1, r3, r1
    str r1, [sp, #0x3c]
    ldr r1, [r0, #0x10]
    str r1, [sp, #0x20]
    ldr r1, [r0, #0x4]
    ldr r0, [r0, #0x8]
    ldrb fp, [sp, #0x20]
    ldrb r4, [sp, #0x21]
    str r1, [sp, #0x1c]
    str r0, [sp, #0x18]
    addle sp, sp, #0x4c
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_188:
    ldr r0, [sp, #0xc]
    ldr r7, [sp, #0x10]
    str r0, [sp, #0x30]
    ldr r0, [sp, #0x8]
    cmp r0, r8
    mov r9, r0
    ble .L_1e4
.L_1a4:
    ldr r2, [sp, #0x1c]
    str fp, [sp]
    ldr r3, [sp, #0x18]
    mov r0, r7
    mov r1, sl
    str r4, [sp, #0x4]
    bl func_020813b0
    mla r1, r0, r5, r6
    add r0, sp, #0x24
    str r9, [sp, #0x2c]
    str r1, [sp, #0x24]
    bl func_02080ff4
    sub r9, r9, #0x8
    add r7, r7, #0x1
    cmp r9, r8
    bgt .L_1a4
.L_1e4:
    ldr r0, [sp, #0xc]
    add sl, sl, #0x1
    sub r1, r0, #0x8
    ldr r0, [sp, #0x14]
    str r1, [sp, #0xc]
    cmp r1, r0
    bgt .L_188
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
