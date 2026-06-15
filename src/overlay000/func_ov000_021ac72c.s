; func_ov000_021ac72c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov000_021ac72c
        .arm
func_ov000_021ac72c:
    stmdb sp!, {r3, lr}
    ldr r1, [r0]
    mov r1, r1, lsl #0x1e
    movs r1, r1, lsr #0x1f
    ldrne r1, [r0, #0x10]
    cmpne r1, #0x0
    ldmeqia sp!, {r3, pc}
    blx r1
    ldmia sp!, {r3, pc}
