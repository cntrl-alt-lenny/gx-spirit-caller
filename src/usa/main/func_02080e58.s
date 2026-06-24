; func_02080e58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02080ff4
        .global func_02080e58
        .arm
func_02080e58:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x2c
    ldr r4, [sp, #0x54]
    ldrb r5, [r0, #0xc]
    str r4, [sp, #0x54]
    ldr r4, [r4]
    ldr r6, [r1]
    mov r7, r5, lsl #0x6
    ldrb r4, [r4, #0x1]
    mov r5, r7, asr #0x2
    add r5, r7, r5, lsr #0x1d
    cmp r4, #0x0
    ldr r6, [r6, #0x8]
    mov r9, r3
    ldr r8, [r0, #0x4]
    ldr r7, [r0, #0x8]
    mov sl, r2
    mov r5, r5, asr #0x3
    addeq sp, sp, #0x2c
    ldr lr, [r0]
    ldrb r3, [r6, #0x1]
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    adds r6, sl, r4
    addmi sp, sp, #0x2c
    ldmmiia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    adds r2, r9, r3
    addmi sp, sp, #0x2c
    ldmmiia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp sl, #0x0
    movle fp, #0x0
    add r6, r6, #0x7
    movgt fp, sl, lsr #0x3
    cmp r9, #0x0
    movle ip, #0x0
    add r2, r2, #0x7
    mov r6, r6, lsr #0x3
    movgt ip, r9, lsr #0x3
    cmp r6, r8
    movcs r6, r8
    mov r2, r2, lsr #0x3
    cmp r2, r7
    movcs r2, r7
    subs r7, r6, fp
    addmi sp, sp, #0x2c
    sub r2, r2, ip
    ldmmiia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r2, #0x0
    addlt sp, sp, #0x2c
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r6, [r0, #0x10]
    cmp sl, #0x0
    sub r8, r6, r7
    mul r8, r5, r8
    mla fp, r6, ip, fp
    andge sl, sl, #0x7
    str r8, [sp]
    ldr r8, [sp, #0x54]
    mla r6, r5, fp, lr
    ldr ip, [r8, #0x4]
    ldr fp, [sp, #0x50]
    cmp r9, #0x0
    sub r8, fp, #0x1
    andge r9, r9, #0x7
    sub fp, r9, r2, lsl #0x3
    str ip, [sp, #0x8]
    str r4, [sp, #0x14]
    str r8, [sp, #0x28]
    str r3, [sp, #0x18]
    ldr r3, [r1]
    cmp r9, fp
    ldr r2, [r3, #0x8]
    sub r7, sl, r7, lsl #0x3
    ldrb r2, [r2, #0x6]
    str r2, [sp, #0x20]
    ldrb r0, [r0, #0xc]
    str r0, [sp, #0x24]
    ldr r0, [r1]
    ldr r0, [r0, #0x8]
    ldrb r0, [r0]
    mul r0, r2, r0
    str r0, [sp, #0x1c]
    addle sp, sp, #0x2c
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r4, sp, #0x4
.L_358:
    mov r8, sl
    str r9, [sp, #0x10]
    cmp sl, r7
    ble .L_388
.L_368:
    mov r0, r4
    str r6, [sp, #0x4]
    str r8, [sp, #0xc]
    bl func_02080ff4
    sub r8, r8, #0x8
    cmp r8, r7
    add r6, r6, r5
    bgt .L_368
.L_388:
    ldr r0, [sp]
    sub r9, r9, #0x8
    cmp r9, fp
    add r6, r6, r0
    bgt .L_358
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
