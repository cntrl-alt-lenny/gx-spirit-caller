; func_ov002_0220572c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf09c
        .extern func_ov002_021bbdcc
        .extern func_ov002_021ca55c
        .extern func_ov002_021ff1d8
        .global func_ov002_0220572c
        .arm
func_ov002_0220572c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh lr, [r4, #0x2]
    ldr r2, _LIT0
    ldr r3, _LIT1
    mov r1, lr, lsl #0x1f
    mov r1, r1, lsr #0x1f
    and ip, r1, #0x1
    mul r2, ip, r2
    ldr r2, [r3, r2]
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    mov r2, lr, lsl #0x14
    mov r2, r2, lsr #0x1a
    cmp r2, #0x23
    beq .L_88
    bl func_ov002_021ff1d8
    cmp r0, #0x0
    bne .L_68
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbdcc
    cmp r0, #0x0
    beq .L_88
.L_68:
    ldrh r0, [r4, #0x2]
    mov r1, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca55c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_88:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
