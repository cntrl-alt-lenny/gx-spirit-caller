; func_02033b10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02033a30
        .extern func_02033a70
        .extern func_020530fc
        .global func_02033b10
        .arm
func_02033b10:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r6, r3
    mov r3, #0xc
    mul r4, r6, r3
    mov r7, r1
    mov r8, r0
    add r0, r7, r4
    mov r9, r2
    bl func_020530fc
    cmp r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r8
    mov r1, r6
    bl func_02033a30
    cmp r0, #0x0
    blt .L_74
    ldr r1, [r8, #0xc]
    ldr r2, [r8, #0x10]
    add r1, r1, r0, lsl #0x2
    cmp r2, #0x0
    addne r0, r0, r0, lsl #0x6
    addne r2, r2, r0, lsl #0x2
    mvn r5, #0x0
    moveq r2, #0x0
    mov r0, r8
    add r3, r7, r4
    str r5, [sp]
    bl func_02033a70
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_74:
    ldrsb r5, [r8, #0x3]
    cmp r5, r9
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, [r8, #0xc]
    mov ip, r5, lsl #0x2
    strb r6, [r0, r5, lsl #0x2]
    ldr r1, [r8, #0x10]
    ldr r3, [r8, #0xc]
    cmp r1, #0x0
    addne r0, r5, r5, lsl #0x6
    addne r2, r1, r0, lsl #0x2
    ldr r6, [sp, #0x20]
    add r1, r3, ip
    moveq r2, #0x0
    mov r0, r8
    add r3, r7, r4
    str r6, [sp]
    bl func_02033a70
    cmp r0, #0x0
    addne r0, r5, #0x1
    strneb r0, [r8, #0x3]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
