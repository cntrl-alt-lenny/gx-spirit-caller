; func_ov002_02215540 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022cf17c
        .extern data_ov002_022cf184
        .extern func_0202df78
        .extern func_0202e2c8
        .extern func_0202e2f8
        .extern func_ov002_021c93f0
        .extern func_ov002_021e2550
        .extern func_ov002_021e2570
        .extern func_ov002_021e25b0
        .extern func_ov002_021e286c
        .extern func_ov002_021e2b1c
        .extern func_ov002_0223de94
        .global func_ov002_02215540
        .arm
func_ov002_02215540:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r4, r0
    mov r1, #0x0
    bl func_ov002_0223de94
    ldrh r1, [r4, #0x4]
    and r7, r0, #0xff
    ldrh r8, [r4, #0xc]
    mov r0, r1, lsl #0x1d
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0x5a8]
    sub r0, r0, #0x7d
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_220
    b .L_1f8
    b .L_104
    b .L_68
    b .L_54
.L_54:
    mov r0, r8
    bl func_0202e2f8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_68:
    ldr r0, _LIT1
    and r1, r7, #0x1
    mul r2, r1, r0
    ldr r0, _LIT2
    ldr r0, [r0, r2]
    subs r9, r0, #0x1
    bmi .L_fc
    ldr r0, _LIT3
    mov r6, #0xb
    add r0, r0, r2
    add r0, r0, #0x120
    add sl, r0, r9, lsl #0x2
    mov fp, #0x0
    mov r5, #0x1
.L_a0:
    ldr r0, [sl]
    mov r1, r8
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df78
    cmp r0, #0x0
    beq .L_f0
    mov r0, r7
    mov r1, r6
    mov r2, r9
    bl func_ov002_021c93f0
    ldrh r1, [r4, #0x2]
    mov r2, r0
    mov r0, r1, lsl #0x1f
    cmp r7, r0, lsr #0x1f
    movne r3, r5
    moveq r3, fp
    mov r0, r7
    mov r1, r9
    bl func_ov002_021e2550
.L_f0:
    sub sl, sl, #0x4
    subs r9, r9, #0x1
    bpl .L_a0
.L_fc:
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_104:
    ldr r0, _LIT1
    and r1, r7, #0x1
    mul r9, r1, r0
    ldr r0, _LIT4
    ldr r0, [r0, r9]
    subs sl, r0, #0x1
    bmi .L_180
    ldr r0, _LIT3
    mov fp, #0x0
    add r0, r0, r9
    add r0, r0, #0x260
    add r6, r0, sl, lsl #0x2
    mov r5, #0x1
.L_138:
    ldr r0, [r6]
    mov r1, r8
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df78
    cmp r0, #0x0
    beq .L_174
    ldrh r0, [r4, #0x2]
    mov r1, sl
    mov r0, r0, lsl #0x1f
    cmp r7, r0, lsr #0x1f
    movne r2, r5
    moveq r2, fp
    mov r0, r7
    bl func_ov002_021e2570
.L_174:
    sub r6, r6, #0x4
    subs sl, sl, #0x1
    bpl .L_138
.L_180:
    ldr r0, _LIT5
    ldr r0, [r0, r9]
    subs r6, r0, #0x1
    bmi .L_1f0
    ldr r0, _LIT3
    mov sl, #0x1
    add r0, r0, r9
    add r0, r0, #0x3a0
    add r5, r0, r6, lsl #0x2
    mov r9, #0x0
.L_1a8:
    ldr r0, [r5]
    mov r1, r8
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df78
    cmp r0, #0x0
    beq .L_1e4
    ldrh r0, [r4, #0x2]
    mov r1, r6
    mov r0, r0, lsl #0x1f
    cmp r7, r0, lsr #0x1f
    movne r2, sl
    moveq r2, r9
    mov r0, r7
    bl func_ov002_021e25b0
.L_1e4:
    sub r5, r5, #0x4
    subs r6, r6, #0x1
    bpl .L_1a8
.L_1f0:
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1f8:
    mov r0, r8
    bl func_0202e2c8
    cmp r0, #0x0
    bne .L_218
    mov r0, #0xf
    bl func_ov002_021e2b1c
    mov r0, r7
    bl func_ov002_021e286c
.L_218:
    mov r0, #0x78
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_220:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
_LIT3: .word data_ov002_022cf16c
_LIT4: .word data_ov002_022cf17c
_LIT5: .word data_ov002_022cf184
