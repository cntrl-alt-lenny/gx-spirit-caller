; func_02024594 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020259bc
        .extern func_0202649c
        .global func_02024594
        .arm
func_02024594:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    add r1, r4, #0x100
    ldrh r1, [r1, #0x6a]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    beq .L_a8
    bl func_020259bc
    b .L_ac
.L_a8:
    bl func_0202649c
.L_ac:
    mov r0, #0x0
    str r0, [r4]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
