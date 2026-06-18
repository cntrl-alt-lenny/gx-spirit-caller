; func_ov002_022065a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf17c
        .extern func_ov002_0223f6c4
        .extern func_ov002_022536e8
        .global func_ov002_022065a0
        .arm
func_ov002_022065a0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r3, [r4, #0x2]
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r3, r3, lsl #0x1f
    mov r3, r3, lsr #0x1f
    and r3, r3, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x0
    bne .L_58
    bl func_ov002_0223f6c4
    ldrh r3, [r4, #0x2]
    mov r2, r0
    ldrh r1, [r4]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022536e8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_58:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf17c
