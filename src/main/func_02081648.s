; func_02081648 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207feec
        .extern func_020816f4
        .global func_02081648
        .arm
func_02081648:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x18
    ldr r4, [sp, #0x34]
    mov r8, r0
    str r4, [sp]
    mov r7, r1
    mov r6, r2
    mov r5, r3
    ldr r4, [sp, #0x30]
    ldr r1, [r8, #0x4]
    ldr r2, [r8, #0x8]
    ldr r3, [r8, #0xc]
    add r0, sp, #0xc
    bl func_0207feec
    ands r0, r4, #0x10
    ldrne r0, [sp, #0xc]
    addne r0, r0, #0x1
    addne r0, r0, r0, lsr #0x1f
    subne r7, r7, r0, asr #0x1
    bne .L_20c
    ands r0, r4, #0x20
    ldrne r0, [sp, #0xc]
    subne r7, r7, r0
.L_20c:
    ands r0, r4, #0x2
    ldrne r0, [sp, #0x10]
    addne r0, r0, #0x1
    addne r0, r0, r0, lsr #0x1f
    subne r6, r6, r0, asr #0x1
    bne .L_230
    ands r0, r4, #0x4
    ldrne r0, [sp, #0x10]
    subne r6, r6, r0
.L_230:
    str r5, [sp]
    ldr r0, [sp, #0x34]
    str r4, [sp, #0x4]
    str r0, [sp, #0x8]
    ldr r3, [sp, #0xc]
    mov r0, r8
    mov r1, r7
    mov r2, r6
    bl func_020816f4
    add sp, sp, #0x18
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
