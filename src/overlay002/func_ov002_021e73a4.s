; func_ov002_021e73a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_021e3dac
        .extern func_ov002_021e4ba8
        .extern func_ov002_021e71a4
        .extern func_ov002_022465d4
        .extern func_ov002_0225702c
        .global func_ov002_021e73a4
        .arm
func_ov002_021e73a4:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r1, [r0, #0x598]
    cmp r1, #0x0
    beq .L_21c
    bl func_ov002_021e3dac
    ldmia sp!, {r3, pc}
.L_21c:
    ldr r0, [r0, #0x5a0]
    cmp r0, #0x0
    beq .L_230
    bl func_ov002_021e4ba8
    ldmia sp!, {r3, pc}
.L_230:
    bl func_ov002_0225702c
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r3, pc}
    ldr r0, _LIT0
    ldr r1, [r0, #0x490]
    cmp r1, #0x0
    beq .L_258
    bl func_ov002_021e71a4
    ldmia sp!, {r3, pc}
.L_258:
    ldr r0, [r0, #0x688]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    bl func_ov002_022465d4
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce288
