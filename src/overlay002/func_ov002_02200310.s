; func_ov002_02200310 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern func_ov002_021c1ef0
        .global func_ov002_02200310
        .arm
func_ov002_02200310:
    stmdb sp!, {r3, lr}
    ldrh r3, [r0, #0x2]
    mov r1, r3, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x12
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r1, [r0, #0x14]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r2, _LIT0
    mov r1, r3, lsl #0x1f
    mov r3, r1, lsr #0x1f
    ldr r1, [r2]
    rsb r3, r3, #0x1
    cmp r1, r3
    movne r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r2, [r2, #0x1c]
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022cd3f4
