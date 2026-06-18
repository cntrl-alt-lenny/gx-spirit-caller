; func_ov002_021afbd4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022cdc78
        .extern data_ov002_022cdc88
        .extern func_ov002_021c988c
        .global func_ov002_021afbd4
        .arm
func_ov002_021afbd4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r4, _LIT0
    mov r5, r0
    ldr r0, _LIT1
    ldr r1, [r4, r5, lsl #0x2]
    ldr r0, [r0, #0x4]
    mov r1, r1, lsl #0x12
    cmp r0, #0x4
    mov r0, r1, lsr #0x1f
    bne .L_54
    ldr r1, _LIT2
    ldr r1, [r1, #0x4]
    eor r1, r1, #0x1
    cmp r0, r1
    bne .L_54
    mov r2, r5
    mov r1, #0xf
    bl func_ov002_021c988c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
.L_54:
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    cmp r0, #0x4a
    moveq r0, #0x0
    ldrne r0, [r4, r5, lsl #0x2]
    movne r0, r0, lsl #0x13
    movne r0, r0, lsr #0x13
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cdc88
_LIT1: .word data_ov002_022cdc78
_LIT2: .word data_ov002_022cd73c
