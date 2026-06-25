; func_ov002_02239070 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_ov002_021ca1d8
        .extern func_ov002_021dec2c
        .extern func_ov002_02211a74
        .extern func_ov002_022575f0
        .global func_ov002_02239070
        .arm
func_ov002_02239070:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r3, [r2, #0x5a8]
    cmp r3, #0x80
    bne .L_5bc
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r0, r4
    bl func_ov002_022575f0
    mov r1, r0
    mov r0, r4
    bl func_ov002_021dec2c
    cmp r0, #0x0
    movne r0, #0x7f
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
.L_5bc:
    add r3, r3, #0x1
    str r3, [r2, #0x5a8]
    bl func_ov002_02211a74
    cmp r0, #0x0
    subne r0, r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
