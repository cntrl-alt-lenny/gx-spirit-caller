; func_ov002_02220ab0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d0d8c
        .extern func_ov002_021de318
        .extern func_ov002_0225761c
        .extern func_ov002_0226b168
        .global func_ov002_02220ab0
        .arm
func_ov002_02220ab0:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7f
    beq .L_40
    cmp r1, #0x80
    bne .L_64
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_0226b168
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_40:
    ldr r1, _LIT1
    ldrh r1, [r1, #0xb0]
    strh r1, [r4, #0x8]
    bl func_ov002_0225761c
    mov r1, r0
    mov r0, r4
    bl func_ov002_021de318
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_64:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d0d8c
