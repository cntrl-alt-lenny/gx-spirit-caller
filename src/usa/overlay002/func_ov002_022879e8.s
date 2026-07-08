; func_ov002_022879e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_0202f994
        .extern func_ov002_021bbe70
        .global func_ov002_022879e8
        .arm
func_ov002_022879e8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r7, r0
    cmp r1, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r0, [r7, #0x2]
    mov r1, r0, lsl #0x14
    mov r1, r1, lsr #0x1a
    cmp r1, #0x12
    cmpne r1, #0x13
    beq .L_38
    cmp r1, #0x17
    beq .L_140
    b .L_1c0
.L_38:
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbe70
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbe70
    cmp r0, #0x3
    blt .L_1c0
    ldrh r2, [r7, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r3, r2, r0
    ldr r2, [r1, r3]
    mov r0, #0x0
    cmp r2, #0x0
    bls .L_1c0
    ldr r9, _LIT2
    ldr r1, _LIT3
    sub r8, r9, #0x2f
    add r1, r1, r3
    sub r6, r9, #0x2d
    rsb r4, r9, #0x2900
    add r1, r1, #0x120
    sub r7, r9, #0x2e
    mov r5, r4
    add r3, r9, #0x550
    mov ip, r8
    mov lr, r6
.L_c8:
    ldr sl, [r1]
    mov sl, sl, lsl #0x13
    cmp r9, sl, lsr #0x13
    mov sl, sl, lsr #0x13
    bcc .L_108
    cmp sl, r9
    bcs .L_124
    cmp sl, lr
    bhi .L_12c
    cmp sl, ip
    bcc .L_12c
    cmp sl, r8
    cmpne sl, r7
    cmpne sl, r6
    beq .L_124
    b .L_12c
.L_108:
    cmp sl, r5
    bhi .L_11c
    cmp sl, r4
    beq .L_124
    b .L_12c
.L_11c:
    cmp sl, r3
    bne .L_12c
.L_124:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_12c:
    add r0, r0, #0x1
    cmp r0, r2
    add r1, r1, #0x4
    bcc .L_c8
    b .L_1c0
.L_140:
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r8, _LIT0
    and r0, r0, #0x1
    mul r1, r0, r8
    ldr r0, _LIT1
    mov r6, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_1c0
    ldr r4, _LIT3
    mov r5, r6
.L_170:
    add r0, r4, r1
    add r0, r0, r5
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202f994
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r0, [r7, #0x2]
    add r6, r6, #0x1
    add r5, r5, #0x4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r0, r0, #0x1
    mul r1, r0, r8
    add r0, r4, r1
    ldr r0, [r0, #0xc]
    cmp r6, r0
    bcc .L_170
.L_1c0:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf098
_LIT2: .word 0x000013b5
_LIT3: .word data_ov002_022cf08c
