; func_ov002_0221c6e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021af9d0
        .extern func_ov002_021afb74
        .extern func_ov002_021d7d0c
        .extern func_ov002_021e276c
        .extern func_ov002_0225368c
        .global func_ov002_0221c6e8
        .arm
func_ov002_0221c6e8:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0xcf8]
    cmp r0, #0x5
    beq .L_16c
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021e276c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_16c:
    ldr r0, _LIT1
    ldr r0, [r0, #0x5a8]
    cmp r0, #0x7e
    beq .L_1f0
    cmp r0, #0x7f
    beq .L_1cc
    cmp r0, #0x80
    bne .L_214
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225368c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0x4d
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_1cc:
    ldrh r0, [r4, #0x2]
    ldrh r2, [r4]
    mov r1, #0x6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021af9d0
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_1f0:
    bl func_ov002_021afb74
    ldrh r1, [r4, #0x2]
    mov r2, r0
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021d7d0c
    mov r0, #0x78
    ldmia sp!, {r4, pc}
.L_214:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022ce288
