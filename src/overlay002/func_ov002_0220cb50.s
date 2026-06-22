; func_ov002_0220cb50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022ce884
        .extern data_ov002_022cf17c
        .extern data_ov002_022d0250
        .extern func_0202b8a8
        .extern func_0202eac8
        .global func_ov002_0220cb50
        .arm
func_ov002_0220cb50:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldrh r0, [sl, #0x2]
    mov r9, #0x0
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x1b
    movne r0, r9
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r0, lsl #0x1f
    mov r1, r0, lsr #0x1f
    ldr r0, _LIT0
    and r1, r1, #0x1
    mul r2, r1, r0
    ldr r0, _LIT1
    ldr r0, [r0, r2]
    cmp r0, #0x0
    moveq r0, r9
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r7, _LIT2
    mov r5, r9
    ldr r0, [r7, #0x5d4]
    cmp r0, #0x0
    bls .L_f8
    ldr r8, _LIT3
    ldr fp, _LIT4
    mov r4, r7
.L_6c:
    ldrb r0, [r7, #0x5dc]
    cmp r0, #0x1b
    bne .L_e0
    ldr r0, [r8]
    ldrh r1, [sl, #0x2]
    mov r2, r0, lsl #0x17
    mov r2, r2, lsr #0x15
    ldrh r3, [fp, r2]
    mov r2, r0, lsl #0x16
    mov r2, r2, lsr #0x1f
    mov r3, r3, lsl #0x13
    mov r1, r1, lsl #0x1f
    cmp r2, r1, lsr #0x1f
    mov r6, r3, lsr #0x13
    bne .L_e0
    mov r0, r0, lsl #0xe
    movs r0, r0, lsr #0x1f
    beq .L_e0
    mov r0, r6
    bl func_0202eac8
    cmp r0, #0x0
    beq .L_e0
    mov r0, r6
    bl func_0202b8a8
    cmp r9, r0
    bgt .L_e0
    mov r0, r6
    bl func_0202b8a8
    mov r9, r0
.L_e0:
    ldr r0, [r4, #0x5d4]
    add r5, r5, #0x1
    cmp r5, r0
    add r7, r7, #0x1
    add r8, r8, #0x4
    bcc .L_6c
.L_f8:
    cmp r9, #0x0
    beq .L_12c
    ldr r1, [sl, #0x14]
    ldr r0, _LIT4
    mov r1, r1, lsl #0x17
    mov r1, r1, lsr #0x15
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8a8
    cmp r9, r0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_12c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf17c
_LIT2: .word data_ov002_022ce288
_LIT3: .word data_ov002_022ce884
_LIT4: .word data_ov002_022d0250
