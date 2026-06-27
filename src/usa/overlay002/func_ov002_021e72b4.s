; func_ov002_021e72b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_ov002_021e3cbc
        .extern func_ov002_021e4ab8
        .extern func_ov002_021e70b4
        .extern func_ov002_022464ec
        .extern func_ov002_02256f44
        .global func_ov002_021e72b4
        .arm
func_ov002_021e72b4:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r1, [r0, #0x598]
    cmp r1, #0x0
    beq .L_3e14
    bl func_ov002_021e3cbc
    ldmia sp!, {r3, pc}
.L_3e14:
    ldr r0, [r0, #0x5a0]
    cmp r0, #0x0
    beq .L_3e28
    bl func_ov002_021e4ab8
    ldmia sp!, {r3, pc}
.L_3e28:
    bl func_ov002_02256f44
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, pc}
    ldr r0, _LIT0
    ldr r1, [r0, #0x490]
    cmp r1, #0x0
    beq .L_3e50
    bl func_ov002_021e70b4
    ldmia sp!, {r3, pc}
.L_3e50:
    ldr r0, [r0, #0x688]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov002_022464ec
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce1a8
