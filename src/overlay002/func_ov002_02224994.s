; func_ov002_02224994 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d0e6c
        .extern func_ov002_021de4b0
        .extern func_ov002_0226b258
        .global func_ov002_02224994
        .arm
func_ov002_02224994:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7f
    beq .L_5cc
    cmp r1, #0x80
    bne .L_600
    ldrh r0, [r0, #0x2]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_0226b258
    mov r0, #0x7f
    ldmia sp!, {r3, pc}
.L_5cc:
    ldr r1, _LIT1
    ldrh r2, [r1, #0xb0]
    cmp r2, #0x6
    moveq r0, #0x80
    ldmeqia sp!, {r3, pc}
    ldrh r1, [r0, #0x2]
    sub r2, r2, #0x1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021de4b0
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_600:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d0e6c
