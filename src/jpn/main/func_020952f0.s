; func_020952f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02096264
        .global func_020952f0
        .arm
func_020952f0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, #0x7
    mov r4, #0x0
.L_10:
    mov r0, r5
    mov r1, r4
    mov r2, r4
    bl func_02096264
    cmp r0, #0x0
    blt .L_10
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
