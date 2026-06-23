; func_0209a760 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0209a760
        .arm
func_0209a760:
    stmdb sp!, {r4, lr}
    movs r4, r0
    ldmeqia sp!, {r4, lr}
    bxeq lr
.L_10:
    ldr r0, [r4, #0x4]
    ldr r1, [r4]
    blx r1
    ldr r4, [r4, #0x8]
    cmp r4, #0x0
    bne .L_10
    ldmia sp!, {r4, lr}
    bx lr
