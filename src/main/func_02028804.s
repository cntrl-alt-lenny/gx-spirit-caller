; func_02028804 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02029458
        .extern func_020298f8
        .global func_02028804
        .arm
func_02028804:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    add r1, r4, #0x100
    ldrh r1, [r1, #0x9a]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    beq .L_34
    bl func_02029458
    b .L_38
.L_34:
    bl func_020298f8
.L_38:
    mov r0, #0x0
    str r0, [r4]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
