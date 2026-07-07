; func_ov002_02203a9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021b3dec
        .extern func_ov002_021bbe70
        .extern func_ov002_021c317c
        .extern func_ov002_021c8400
        .extern func_ov002_021ca5b8
        .global func_ov002_02203a9c
        .arm
func_ov002_02203a9c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r0
    bl func_ov002_021ca5b8
    cmp r0, #0x0
    beq .L_dc
    ldrh r0, [sl, #0x2]
    ldr r2, _LIT0
    mov r1, #0xb
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b3dec
    cmp r0, #0x0
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x1f
    beq .L_58
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbe70
    b .L_60
.L_58:
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c317c
.L_60:
    mov r9, r0
    cmp r9, #0x0
    beq .L_dc
    ldr r4, _LIT1
    ldr fp, _LIT2
    mov r5, #0x0
.L_78:
    and r0, r5, #0x1
    mla r8, r0, fp, r4
    mov r6, #0x0
    add r7, r8, #0x30
.L_88:
    mov r0, r5
    mov r1, r6
    bl func_ov002_021c8400
    ldr r1, [r7]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    ldrneh r1, [r8, #0x38]
    cmpne r1, #0x0
    cmpne r0, #0x0
    beq .L_bc
    cmp r0, r9
    movle r0, #0x2
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_bc:
    add r6, r6, #0x1
    cmp r6, #0x5
    add r7, r7, #0x14
    add r8, r8, #0x14
    blt .L_88
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_78
.L_dc:
    ldrh r0, [sl, #0x2]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1e
    cmp r0, #0x3
    moveq r0, #0x0
    movne r0, #0x3
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000014a0
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
