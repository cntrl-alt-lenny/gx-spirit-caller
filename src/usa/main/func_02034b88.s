; func_02034b88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b200
        .extern func_02034adc
        .extern func_02036540
        .extern func_020372d8
        .global func_02034b88
        .arm
func_02034b88:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldrh r1, [r1, #0x12]
    tst r1, #0x8000
    ldmeqia sp!, {r3, pc}
    cmp r0, #0x0
    bne .L_180
    mov r0, #0x0
    bl func_020372d8
    cmp r0, #0x0
    bne .L_188
.L_180:
    bl func_02034adc
    ldmia sp!, {r3, pc}
.L_188:
    ldr r0, _LIT1
    mov r1, #0x10
    bl func_02036540
    ldr r0, _LIT0
    ldrh r1, [r0, #0x12]
    orr r1, r1, #0x2000
    strh r1, [r0, #0x12]
    ldmia sp!, {r3, pc}
_LIT0: .word data_0219b200
_LIT1: .word 0x08f00004
