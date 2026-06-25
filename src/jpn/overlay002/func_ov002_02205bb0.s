; func_ov002_02205bb0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d008c
        .extern func_ov002_021baf88
        .extern func_ov002_022058e8
        .global func_ov002_02205bb0
        .arm
func_ov002_02205bb0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r4, r1
    mov r0, r0, lsl #0x1a
    mov r0, r0, lsr #0x1b
    cmp r0, #0x5
    bcc .L_44
    ldr r0, _LIT0
    ldr r0, [r0, #0xcf8]
    cmp r0, #0x2
    bne .L_44
    ldr r0, _LIT1
    bl func_ov002_021baf88
    cmp r0, #0x0
    moveq r0, #0x2
    ldmeqia sp!, {r3, r4, r5, pc}
.L_44:
    mov r0, r5
    mov r1, r4
    bl func_ov002_022058e8
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d008c
_LIT1: .word 0x000013f2
