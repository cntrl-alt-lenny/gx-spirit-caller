; func_ov002_022056ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_022055fc
        .global func_ov002_022056ac
        .arm
func_ov002_022056ac:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl func_ov002_022055fc
    cmp r0, #0x0
    beq .L_ec
    ldr r0, [r4, #0x14]
    mov r1, r0, lsl #0xe
    movs r1, r1, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r0, lsl #0x11
    movs r0, r0, lsr #0x1f
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, pc}
.L_ec:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
