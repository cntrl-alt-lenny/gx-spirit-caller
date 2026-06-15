; func_02044c60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02044610
        .global func_02044c60
        .arm
func_02044c60:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x18
    mov r4, r0
    add r0, sp, #0x0
    bl func_02044610
    add r0, sp, #0x0
    ldmia r0, {r2, r3}
    stmia r4, {r2, r3}
    add r1, sp, #0x8
    add r0, r4, #0x8
    ldmia r1, {r2, r3}
    stmia r0, {r2, r3}
    ldr r2, [sp]
    ldr r1, [sp, #0x4]
    mov r0, #0x0
    cmp r1, r0
    cmpeq r2, r0
    streq r0, [r4, #0x10]
    movne r0, #0x1
    strne r0, [r4, #0x10]
    add sp, sp, #0x18
    ldmia sp!, {r4, pc}
