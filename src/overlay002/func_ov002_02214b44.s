; func_ov002_02214b44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cdc78
        .extern data_ov002_022ce288
        .extern func_ov002_021ae400
        .extern func_ov002_021d479c
        .extern func_ov002_021e2818
        .extern func_ov002_021e286c
        .extern func_ov002_021e2b1c
        .extern func_ov002_0225368c
        .global func_ov002_02214b44
        .arm
func_ov002_02214b44:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0x5a8]
    cmp r0, #0x7f
    beq .L_d4
    cmp r0, #0x80
    bne .L_104
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225368c
    cmp r0, #0x0
    ldrh r0, [r4, #0x2]
    bne .L_70
    mov r0, r0, lsl #0x1f
    mov r1, #0xd
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_70:
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e286c
    ldrh r0, [r4, #0x2]
    mov r3, #0x0
    mov r0, r0, lsl #0x1f
    movs r0, r0, lsr #0x1f
    ldr r0, _LIT1
    movne r1, #0x8000
    moveq r1, #0x0
    ldr r2, [r0, #0x10]
    orr r1, r1, #0x57
    mov r0, r1, lsl #0x10
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    mov r1, r1, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r1, #0xd
    bl func_ov002_021d479c
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_d4:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e2818
    mov r0, #0x1e
    bl func_ov002_021e2b1c
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e2818
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_104:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cdc78
