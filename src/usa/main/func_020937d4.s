; func_020937d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02096264
        .global func_020937d4
        .arm
func_020937d4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0, lsl #0x8
    mov r5, #0xc
    mov r4, #0x0
.L_90:
    mov r0, r5
    mov r1, r6
    mov r2, r4
    bl func_02096264
    cmp r0, #0x0
    bne .L_90
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
