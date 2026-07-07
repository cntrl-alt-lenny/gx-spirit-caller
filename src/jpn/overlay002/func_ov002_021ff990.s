; func_ov002_021ff990 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf09c
        .extern func_ov002_021b3538
        .extern func_ov002_021bc1a8
        .extern func_ov002_021bc5ac
        .extern func_ov002_021bc7e8
        .extern func_ov002_021ca1d8
        .global func_ov002_021ff990
        .arm
func_ov002_021ff990:
    stmdb sp!, {r4, r5, r6, lr}
    ldrh r2, [r0, #0x2]
    mov r0, r2, lsl #0x1f
    mov r1, r2, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r2, r2, lsl #0x11
    mov r1, r1, lsr #0x1b
    eor r4, r0, r2, lsr #0x1f
    bl func_ov002_021b3538
    ldr r1, _LIT0
    cmp r0, r1
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r1, r0, asr #0x8
    and r5, r0, #0xff
    and r6, r1, #0xff
    mov r0, r4
    mov r1, r5
    mov r2, r6
    bl func_ov002_021bc7e8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r4
    bl func_ov002_021bc5ac
    cmp r0, #0x0
    bne .L_90
    cmp r5, r4
    bne .L_88
    mov r0, r5
    mov r1, r6
    bl func_ov002_021bc1a8
    cmp r0, #0x0
    bne .L_90
.L_88:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_90:
    mov r0, r4
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r0, _LIT1
    and r1, r4, #0x1
    mul r2, r1, r0
    ldr r0, _LIT2
    ldr r0, [r0, r2]
    cmp r0, #0x0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x0000ffff
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf09c
