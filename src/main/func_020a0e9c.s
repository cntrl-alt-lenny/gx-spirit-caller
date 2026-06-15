; func_020a0e9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020977c0
        .extern func_02097f10
        .extern func_02097ff0
        .extern func_02098104
        .extern func_02098388
        .global func_020a0e9c
        .arm
func_020a0e9c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4c
    ldr r5, [r0, #0x14]
    ldr r4, [r0, #0x10]
    add r0, sp, #0x4
    bl func_02098388
    ldr r1, [r5, #0x14]
    add r0, r5, #0x10
    ldr r5, [r4]
    bl func_020977c0
    mvn r1, #0x0
    str r1, [sp]
    ldr r2, [r4, #0x4]
    mov r1, r0
    add r3, r5, r2
    add r0, sp, #0x4
    mov r2, r5
    bl func_02098104
    cmp r0, #0x0
    beq .L_54c
    ldr r1, [r4, #0x8]
    ldr r2, [r4, #0x4]
    add r0, sp, #0x4
    bl func_02097f10
    ldr r1, [r4, #0x4]
    cmp r1, r0
    moveq r0, #0x2
    streq r0, [r4, #0xc]
    add r0, sp, #0x4
    bl func_02097ff0
.L_54c:
    ldr r0, [r4, #0xc]
    cmp r0, #0x2
    movne r0, #0x0
    strne r0, [r4]
    movne r0, #0x2
    strne r0, [r4, #0xc]
    add sp, sp, #0x4c
    ldmia sp!, {r4, r5, lr}
    bx lr
