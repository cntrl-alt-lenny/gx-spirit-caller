; func_0206c7c0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02070d34
        .extern func_02070f78
        .extern func_02092748
        .extern func_020927b8
        .global func_0206c7c0
        .arm
func_0206c7c0:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    ldr r4, [r7, #0x4]
    mov r5, #0x0
    ldr r6, [r4, #0x64]
    add r0, r6, #0xe0
    bl func_020927b8
    ldrh r0, [r7, #0x10]
    ldrh r1, [r7, #0x12]
    ldr r2, [r7, #0x14]
    bl func_02070f78
    mov r0, r5
    str r0, [r6, #0xf8]
    ldrsb r0, [r7, #0xc]
    cmp r0, #0x0
    beq .L_518
    cmp r0, #0x4
    bne .L_520
.L_518:
    bl func_02070d34
    mov r5, r0
.L_520:
    add r0, r6, #0xe0
    bl func_02092748
    cmp r5, #0x0
    ldrnesh r1, [r4, #0x70]
    mvnne r0, #0x4b
    moveq r0, #0x0
    orrne r1, r1, #0x40
    strneh r1, [r4, #0x70]
    ldreqsh r1, [r4, #0x70]
    orreq r1, r1, #0x4
    streqh r1, [r4, #0x70]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
