; func_ov002_022568a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022be160
        .extern data_ov002_022ce288
        .extern data_ov002_022ce884
        .extern data_ov002_022d0250
        .extern func_ov002_021b97d4
        .extern func_ov002_021ba294
        .extern func_ov002_021c3b60
        .extern func_ov002_021e30b4
        .extern func_ov002_02253748
        .global func_ov002_022568a8
        .arm
func_ov002_022568a8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x10
    ldr r0, _LIT0
    add r4, sp, #0x0
    ldmia r0, {r0, r1, r2, r3}
    stmia r4, {r0, r1, r2, r3}
    ldr r3, _LIT1
    mov r2, #0x0
    ldr r6, [r3, #0x5d4]
    cmp r6, #0x0
    bls .L_b4
    ldr r8, _LIT2
    ldr r5, _LIT3
    ldr r0, _LIT4
    add r7, r8, #0x1
.L_3c:
    ldrb r1, [r3, #0x5dc]
    cmp r1, #0x1b
    bne .L_a0
    ldr r1, [r5]
    mov r9, r1, lsl #0x10
    movs r9, r9, lsr #0x1f
    beq .L_a0
    mov r9, r1, lsl #0x17
    mov r9, r9, lsr #0x15
    ldrh r9, [r0, r9]
    mov r9, r9, lsl #0x13
    mov r9, r9, lsr #0x13
    cmp r9, r8
    beq .L_80
    cmp r9, r7
    beq .L_90
    b .L_a0
.L_80:
    mov r1, r1, lsl #0x16
    mov r1, r1, lsr #0x1f
    str r2, [r4, r1, lsl #0x3]
    b .L_a0
.L_90:
    mov r1, r1, lsl #0x16
    mov r1, r1, lsr #0x1f
    add r1, r4, r1, lsl #0x3
    str r2, [r1, #0x4]
.L_a0:
    add r2, r2, #0x1
    cmp r2, r6
    add r3, r3, #0x1
    add r5, r5, #0x4
    bcc .L_3c
.L_b4:
    ldr r7, _LIT5
    mov r9, #0x0
    ldr r5, _LIT1
    add r8, sp, #0x0
    add sl, r7, #0x500000
    mov r4, r9
    mov r6, #0x10
.L_d0:
    ldr r0, [r8, r9, lsl #0x3]
    cmp r0, #0x0
    addge r0, r8, r9, lsl #0x3
    ldrge r0, [r0, #0x4]
    cmpge r0, #0x0
    blt .L_178
    mov r0, r9
    mov r1, r7
    bl func_ov002_021c3b60
    cmp r0, #0x0
    bge .L_110
    mov r0, r9
    mov r1, r7
    bl func_ov002_021ba294
    cmp r0, #0x0
    blt .L_178
.L_110:
    mov r0, r9
    mov r1, r7
    bl func_ov002_021b97d4
    mov r2, r0
    mov r0, r9
    mov r1, r6
    bl func_ov002_02253748
    cmp r0, #0x0
    bne .L_178
    ldr r3, [r8, r9, lsl #0x3]
    mov r2, r9, lsl #0x1f
    add r0, r5, r3
    ldrb r1, [r0, #0x5dc]
    add r0, r5, r3, lsl #0x2
    and r2, r2, #-2147483648
    mov r1, r1, lsl #0x19
    and r1, r1, #0x7e000000
    orr r3, r2, r1
    ldr r2, [r0, #0x5fc]
    mov r1, r4
    orr r0, r3, sl
    bl func_ov002_021e30b4
    cmp r0, #0x0
    addne sp, sp, #0x10
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_178:
    add r9, r9, #0x1
    cmp r9, #0x2
    blt .L_d0
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022be160
_LIT1: .word data_ov002_022ce288
_LIT2: .word 0x000017c7
_LIT3: .word data_ov002_022ce884
_LIT4: .word data_ov002_022d0250
_LIT5: .word 0x000017c9
