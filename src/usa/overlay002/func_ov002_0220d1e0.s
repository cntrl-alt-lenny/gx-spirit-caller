; func_ov002_0220d1e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf09c
        .extern func_ov002_021bb83c
        .extern func_ov002_021bc7e8
        .extern func_ov002_021ca1d8
        .extern func_ov002_0223f5dc
        .extern func_ov002_02253600
        .global func_ov002_0220d1e0
        .arm
func_ov002_0220d1e0:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, _LIT0
    bl func_ov002_021bb83c
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    mov r0, r1, lsl #0x1f
    mov r2, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r0
    mov r2, r2, lsr #0x1b
    bl func_ov002_021bc7e8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    bne .L_1c0
    mov r0, r4
    bl func_ov002_0223f5dc
    ldrh r3, [r4, #0x2]
    mov r2, r0
    ldrh r1, [r4]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02253600
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_1c0:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00001a77
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf09c
