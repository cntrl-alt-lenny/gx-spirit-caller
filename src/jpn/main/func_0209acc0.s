; func_0209acc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02096264
        .global func_0209acc0
        .arm
func_0209acc0:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, #0x8
    mov r4, #0x0
.L_340:
    mov r0, r5
    mov r1, r6
    mov r2, r4
    bl func_02096264
    cmp r0, #0x0
    bne .L_340
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
