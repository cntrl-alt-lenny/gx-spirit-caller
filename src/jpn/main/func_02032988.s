; func_02032988 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02032988
        .arm
func_02032988:
    stmdb sp!, {r3, lr}
    ldr r1, [r1, #0xed0]
    mov r2, #0x1
    cmp r1, #0x0
    beq .L_324
    blx r1
    mov r2, r0
.L_324:
    mov r0, r2
    ldmia sp!, {r3, pc}
