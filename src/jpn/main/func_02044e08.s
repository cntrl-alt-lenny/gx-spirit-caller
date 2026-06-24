; func_02044e08 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020444d8
        .extern func_020445c0
        .global func_02044e08
        .arm
func_02044e08:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    mov r5, r0
    add r0, sp, #0x0
    mov r4, r1
    bl func_020445c0
    add ip, r5, #0x8
    ldmia ip, {r2, r3}
    stmia r5, {r2, r3}
    add r1, sp, #0x8
    ldmia r1, {r2, r3}
    mov r0, r5
    mov r1, r4
    stmia ip, {r2, r3}
    bl func_020444d8
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
