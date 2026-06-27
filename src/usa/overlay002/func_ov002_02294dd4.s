; func_ov002_02294dd4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf1a8
        .extern func_ov002_021bbe70
        .extern func_ov002_021c3a04
        .extern func_ov002_021c3b70
        .extern func_ov002_02280870
        .global func_ov002_02294dd4
        .arm
func_ov002_02294dd4:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbe70
    cmp r0, #0x2
    blt .L_40
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3a04
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
.L_40:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    mov r1, r1, lsr #0x11
    tst r1, #0x1
    bne .L_80
    mov r1, #0x5
    bl func_ov002_021c3b70
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, pc}
.L_80:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02280870
    cmp r0, #0x0
    movlt r0, #0x1
    movge r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word 0x000019a5
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a8
