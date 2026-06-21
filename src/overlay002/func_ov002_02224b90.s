; func_ov002_02224b90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d016c
        .extern func_ov002_021e104c
        .extern func_ov002_021e276c
        .global func_ov002_02224b90
        .arm
func_ov002_02224b90:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x4]
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0x2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e104c
    cmp r0, #0x0
    beq .L_1f8
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT0
    mov r3, #0x0
    mov r2, r1, lsl #0x1f
    ldr r1, [r0, #0xcec]
    mov r0, r2, lsr #0x1f
    cmp r1, r2, lsr #0x1f
    moveq r1, #0x1
    movne r1, #0x0
    add r1, r1, #0x3
    and r1, r1, #0xff
    mov r1, r1, lsl #0x4
    orr r1, r1, #0x1
    mov r2, r1, lsl #0x10
    ldrh r1, [r4]
    mov r2, r2, lsr #0x10
    bl func_ov002_021e276c
.L_1f8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022d016c
