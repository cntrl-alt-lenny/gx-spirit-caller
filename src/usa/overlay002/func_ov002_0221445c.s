; func_ov002_0221445c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d0d8c
        .extern func_ov002_0220e428
        .extern func_ov002_0223de48
        .extern func_ov002_0226b13c
        .global func_ov002_0221445c
        .arm
func_ov002_0221445c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r1, [r4, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_ab4
    ldr r0, _LIT0
    ldr r0, [r0, #0x5a8]
    cmp r0, #0x7f
    beq .L_a94
    cmp r0, #0x80
    bne .L_ab4
    ldrh r0, [r4, #0x2]
    mov r2, #0x3
    mov r3, #0x1
    mov r1, r0, lsl #0x1a
    mov r4, r0, lsl #0x1f
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_0226b13c
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_a94:
    ldr r0, _LIT1
    ldrh r0, [r0, #0xb2]
    cmp r0, #0x2
    bcc .L_aac
    mov r0, r4
    bl func_ov002_0220e428
.L_aac:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_ab4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d0d8c
