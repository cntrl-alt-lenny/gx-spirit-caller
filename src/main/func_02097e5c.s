; func_02097e5c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02097848
        .global func_02097e5c
        .arm
func_02097e5c:
    stmdb sp!, {r4, lr}
    ldr r2, [r1]
    mov r4, r0
    str r2, [r4, #0x8]
    add r3, r4, #0x30
    ldmia r1, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    mov r0, r4
    mov r1, #0x2
    bl func_02097848
    cmp r0, #0x0
    ldrne r1, [r4, #0xc]
    moveq r0, #0x0
    orrne r1, r1, #0x20
    movne r0, #0x1
    strne r1, [r4, #0xc]
    ldmia sp!, {r4, lr}
    bx lr
