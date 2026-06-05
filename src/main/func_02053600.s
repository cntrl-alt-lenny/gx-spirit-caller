; func_02053600 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0205362c
        .extern func_020536a0
        .global func_02053600
        .arm
func_02053600:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    bl func_020536a0
    bic r1, r0, #0x3
    mov r0, r5
    orr r1, r1, r4
    bl func_0205362c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
