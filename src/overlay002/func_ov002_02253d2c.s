; func_ov002_02253d2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1ac
        .extern func_ov002_021b34f4
        .extern func_ov002_021b9bd4
        .extern func_ov002_021c8940
        .extern func_ov002_021d59cc
        .extern func_ov002_021d9144
        .extern func_ov002_021df62c
        .global func_ov002_02253d2c
        .arm
func_ov002_02253d2c:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r4, _LIT0
    and r5, sl, #0x1
    mul r6, r5, r4
    ldr r4, _LIT1
    mov r9, r1
    mov r3, #0x14
    mul r5, r9, r3
    add r4, r4, r6
    ldr r3, [r4, r5]
    mov r7, r2
    mov r2, r3, lsr #0x5
    tst r2, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_ov002_021b9bd4
    cmp r0, #0x4
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, sl
    mov r1, r9
    mov r2, #0x1
    bl func_ov002_021d9144
    cmp r7, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r4, r5]
    mov r0, r0, lsr #0x6
    tst r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT2
    mov r0, sl
    add r1, r1, r6
    add r1, r1, #0x30
    ldr r3, [r1, r5]
    mov r1, r9
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    add r2, r2, r3, lsr #0x1f
    bl func_ov002_021df62c
    mov r5, #0x0
    and r1, sl, #0xff
    and r0, r9, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r4, r0, lsr #0x10
    mov fp, r5
.L_bc:
    ldr r1, _LIT0
    ldr r0, _LIT2
    and r2, r5, #0x1
    mla r8, r2, r1, r0
    mov r6, #0x0
    add r7, r8, #0x30
.L_d4:
    ldr r0, [r7]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    ldrneh r0, [r8, #0x38]
    cmpne r0, #0x0
    beq .L_148
    ldr r1, [r8, #0x40]
    mov r0, r1, lsr #0x2
    orr r0, r0, r1, lsr #0x1
    tst r0, #0x1
    bne .L_148
    mov r0, r5
    mov r1, r6
    bl func_ov002_021c8940
    cmp r0, #0x2
    bne .L_148
    mov r0, r5
    mov r1, r6
    mov r2, sl
    mov r3, r9
    bl func_ov002_021b34f4
    cmp r0, #0x0
    beq .L_148
    mov r0, r5
    mov r1, r6
    mov r2, r4
    mov r3, #0x7
    str fp, [sp]
    bl func_ov002_021d59cc
.L_148:
    add r6, r6, #0x1
    cmp r6, #0x5
    add r7, r7, #0x14
    add r8, r8, #0x14
    blt .L_d4
    add r5, r5, #0x1
    cmp r5, #0x2
    blt .L_bc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1ac
_LIT2: .word data_ov002_022cf16c
