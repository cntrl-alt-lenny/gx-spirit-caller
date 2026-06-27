; func_ov002_02230f04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021ba230
        .extern func_ov002_021bc538
        .extern func_ov002_021ca1d8
        .extern func_ov002_0227acc8
        .global func_ov002_02230f04
        .arm
func_ov002_02230f04:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5, #0x8]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ba230
    ldrh r1, [r5, #0x2]
    mov r4, r0
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    cmp r4, #0x0
    blt .L_d60
    ldrh r0, [r5, #0x2]
    ldr r3, _LIT0
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x3a0
    add r1, r1, r4, lsl #0x2
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_0227acc8
.L_d60:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
