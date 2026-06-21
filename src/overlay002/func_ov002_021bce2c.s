; func_ov002_021bce2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021bb068
        .extern func_ov002_021bc8c8
        .extern func_ov002_021c8940
        .global func_ov002_021bce2c
        .arm
func_ov002_021bce2c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r0, _LIT0
    mov r9, r1
    mov r6, #0x0
    bl func_ov002_021bb068
    cmp r0, #0x0
    movgt r0, r6
    ldmgtia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr fp, _LIT1
    mov r4, r6
.L_2c:
    ldr r0, _LIT2
    and r1, r4, #0x1
    mla r8, r1, r0, fp
    mov r5, #0x0
    add r7, r8, #0x30
.L_40:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_a0
    ldr r1, [r8, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_a0
    cmp r4, sl
    beq .L_78
    ldrh r0, [r8, #0x38]
    cmp r0, #0x0
    beq .L_a0
.L_78:
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c8940
    cmp r9, r0
    bne .L_a0
    mov r0, sl
    mov r1, r4
    mov r2, r5
    bl func_ov002_021bc8c8
    add r6, r6, r0
.L_a0:
    add r5, r5, #0x1
    cmp r5, #0x5
    add r7, r7, #0x14
    add r8, r8, #0x14
    blt .L_40
    add r4, r4, #0x1
    cmp r4, #0x2
    blt .L_2c
    mov r0, r6
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x000013f2
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
