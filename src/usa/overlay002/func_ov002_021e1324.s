; func_ov002_021e1324 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022d0170
        .extern func_0202b824
        .extern func_0202e274
        .extern func_ov002_021babc8
        .extern func_ov002_021d46ac
        .extern func_ov002_021df53c
        .extern func_ov002_021e267c
        .extern func_ov002_021e2ca4
        .extern func_ov002_021e2fc4
        .extern func_ov002_02244efc
        .global func_ov002_021e1324
        .arm
func_ov002_021e1324:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x4
    mov r7, r1
    ldr r1, _LIT0
    mov r3, r7, lsl #0x2
    ldrh r1, [r1, r3]
    mov r8, r0
    mov r6, r2
    mov r0, r1, lsl #0x13
    mov r5, r0, lsr #0x13
    mov r0, r5
    and r4, r7, #0x1
    bl func_0202e274
    ldr r2, [sp]
    eor r1, r8, r6
    bic r2, r2, #0x800
    mov r1, r1, lsl #0x1f
    orr r1, r2, r1, lsr #0x14
    bic r2, r1, #0x200
    mov r1, r8, lsl #0x1f
    orr r1, r2, r1, lsr #0x16
    bic r2, r1, #0xf000
    mov r1, #0x200
    cmp r0, #0x0
    movne r0, #0xc
    moveq r0, #0xd
    cmp r6, #0x0
    movne r3, #0x1
    moveq r3, #0x0
    mov r3, r3, lsl #0x10
    rsb r1, r1, #0x0
    orr r2, r2, #0xe000
    and r2, r2, r1
    and r1, r7, r1, lsr #0x17
    orr r1, r2, r1
    bic r1, r1, #0x400
    str r1, [sp]
    mov r1, r0, lsl #0x1b
    and r0, r4, #0x1
    and r8, r8, #0x1
    orr r2, r0, #0x5c
    mov ip, r7, lsl #0x16
    orr r0, r8, r1, lsr #0x1a
    orr r0, r0, ip, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    mov r3, r3, lsr #0x10
    mov r0, #0x3f
    bl func_ov002_021d46ac
    ldr r2, _LIT1
    cmp r5, r2
    bgt .L_12c
    bge .L_1a4
    ldr r1, _LIT2
    cmp r5, r1
    bgt .L_108
    bge .L_1dc
    ldr r0, _LIT3
    cmp r5, r0
    bgt .L_f8
    beq .L_1d4
    b .L_204
.L_f8:
    add r0, r0, #0x118
    cmp r5, r0
    beq .L_1dc
    b .L_204
.L_108:
    add r0, r1, #0x67
    cmp r5, r0
    bgt .L_11c
    beq .L_1dc
    b .L_204
.L_11c:
    sub r0, r2, #0xc2
    cmp r5, r0
    beq .L_1dc
    b .L_204
.L_12c:
    add r0, r2, #0x250
    cmp r5, r0
    bgt .L_174
    bge .L_1dc
    add r0, r2, #0x1b0
    cmp r5, r0
    bgt .L_164
    ldr r0, _LIT4
    cmp r5, r0
    blt .L_204
    addne r0, r0, #0x2
    cmpne r5, r0
    beq .L_1d4
    b .L_204
.L_164:
    ldr r0, _LIT5
    cmp r5, r0
    beq .L_1dc
    b .L_204
.L_174:
    add r0, r2, #0x320
    cmp r5, r0
    bgt .L_194
    bge .L_1dc
    add r0, r2, #0x254
    cmp r5, r0
    beq .L_1b4
    b .L_204
.L_194:
    ldr r0, _LIT6
    cmp r5, r0
    beq .L_1dc
    b .L_204
.L_1a4:
    mov r0, r4
    mov r2, r7
    mov r1, #0xe
    bl func_ov002_021df53c
.L_1b4:
    mov r1, r5, lsl #0x10
    mov r2, r7, lsl #0x10
    mov r0, r4
    mov r1, r1, lsr #0x10
    mov r3, r2, lsr #0x10
    mov r2, #0x1
    bl func_ov002_021e267c
    b .L_204
.L_1d4:
    cmp r6, #0x0
    beq .L_204
.L_1dc:
    mov r0, r4, lsl #0x1f
    and r0, r0, #-2147483648
    orr r3, r0, #0x4e0000
    mov r1, r7, lsl #0x10
    orr r3, r3, #0x38000000
    mov r0, r5, lsl #0x10
    ldr r2, [sp]
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_204:
    mov r0, r5
    bl func_0202b824
    cmp r0, #0x9
    bne .L_25c
    ldr r7, _LIT7
    mov r8, #0x0
    mov r6, #0x5
    mov r5, #0x1
.L_224:
    mov r0, r4
    mov r1, r8
    mov r2, r7
    bl func_ov002_021babc8
    cmp r0, #0x0
    beq .L_250
    mov r0, r4
    mov r1, r8
    mov r2, r6
    mov r3, r5
    bl func_ov002_021e2ca4
.L_250:
    add r8, r8, #0x1
    cmp r8, #0x4
    ble .L_224
.L_25c:
    ldr r1, [sp]
    mov r0, #0x1c
    bl func_ov002_02244efc
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022d0170
_LIT1: .word 0x000014a5
_LIT2: .word 0x000012a2
_LIT3: .word 0x0000106d
_LIT4: .word 0x00001653
_LIT5: .word 0x00001687
_LIT6: .word 0x000019fe
_LIT7: .word 0x00001a8d
