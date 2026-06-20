; func_ov002_022930ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_ov002_021b9ecc
        .extern func_ov002_021c1a2c
        .extern func_ov002_021c1e44
        .extern func_ov002_021c8470
        .extern func_ov002_022575c8
        .extern func_ov002_0228c460
        .global func_ov002_022930ec
        .arm
func_ov002_022930ec:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0228c460
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r7, _LIT0
    ldr r8, _LIT1
    ldr r6, _LIT2
    mov r4, #0x0
.L_34:
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r2, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_022575c8
    cmp r0, #0x0
    beq .L_e8
    ldrh r1, [r5, #0x2]
    mov r0, r5
    mov r2, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021c1e44
    cmp r0, #0x0
    bne .L_e8
    ldrh r0, [r5, #0x2]
    ldrh r2, [r5]
    mov r1, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021c1a2c
    cmp r0, #0x0
    beq .L_e8
    ldrh r0, [r5, #0x2]
    mov r1, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021b9ecc
    cmp r0, r8
    cmpne r0, r7
    beq .L_e8
    ldrh r0, [r5, #0x2]
    mov r1, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021c8470
    cmp r0, r6
    movge r0, #0x1
    ldmgeia sp!, {r4, r5, r6, r7, r8, pc}
.L_e8:
    add r4, r4, #0x1
    cmp r4, #0x5
    blt .L_34
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00001596
_LIT1: .word 0x000013c3
_LIT2: .word 0x00000708
