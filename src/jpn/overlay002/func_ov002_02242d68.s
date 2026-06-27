; func_ov002_02242d68 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_0223f59c
        .global func_ov002_02242d68
        .arm
func_ov002_02242d68:
    stmdb sp!, {r3, lr}
    ldrh r2, [r0, #0x2]
    mov r3, r2, lsl #0x12
    mov r3, r3, lsr #0x1e
    cmp r3, #0x1
    moveq r2, r2, lsl #0x14
    moveq r2, r2, lsr #0x1a
    cmpeq r2, #0x5
    moveq r0, #0x1
    ldmeqia sp!, {r3, pc}
    ldrh r3, [r0]
    ldr r2, _LIT0
    cmp r3, r2
    ldrne r2, _LIT1
    cmpne r3, r2
    bne .L_48
    bl func_ov002_0223f59c
    ldmia sp!, {r3, pc}
.L_48:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word 0x00001503
_LIT1: .word 0x00001694
