; func_ov002_0225e788 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cd340
        .extern data_ov002_022d008c
        .extern func_0202f994
        .extern func_ov002_021bacd0
        .extern func_ov002_021c8860
        .extern func_ov002_021d46ac
        .extern func_ov002_021d58dc
        .extern func_ov002_021df53c
        .extern func_ov002_021e2fc4
        .extern func_ov002_021fd72c
        .extern func_ov002_0225499c
        .extern func_ov002_022560f8
        .global func_ov002_0225e788
        .arm
func_ov002_0225e788:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldr r4, _LIT0
    mov r0, #0x38
    rsb r3, r5, #0x1
    ldr r1, _LIT1
    mla r6, r5, r0, r4
    mla r7, r3, r0, r4
    ldr r2, [r1, #0x8]
    ldr r4, [r1, #0x4]
    cmp r2, #0x0
    addne sp, sp, #0x8
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT2
    ldr r0, [r0, #0xd30]
    cmp r0, #0x0
    beq .L_26f0
    cmp r0, #0x1
    beq .L_2790
    b .L_2c38
.L_26f0:
    bl func_ov002_0225499c
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    bl func_ov002_022560f8
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r2, _LIT1
    mov r1, r4, lsl #0x1f
    ldr r0, [r2, #0x20]
    and r1, r1, #-2147483648
    orr r4, r1, #0xa200000
    mov r0, r0, lsl #0x10
    ldr r5, [r7, #0x10]
    ldr r1, _LIT3
    orr r4, r4, #0x20000000
    and r3, r0, #0x1f0000
    mov r0, r5, lsl #0x10
    orr r3, r4, r3
    cmp r5, r1
    orr r0, r3, r0, lsr #0x10
    bne .L_2774
    ldr r1, [r2, #0x24]
    cmp r1, #0x0
    beq .L_2774
    ldr r1, [r7, #0xc]
    mov r2, #0x0
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_2774:
    ldr r1, _LIT2
    add sp, sp, #0x8
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2790:
    mov r2, r5, lsl #0x1f
    ldr r0, [r1, #0x1c]
    and r1, r2, #-2147483648
    orr r8, r1, #0xa200000
    mov r1, r0, lsl #0x10
    ldr r0, [r6, #0x10]
    ldr r2, _LIT4
    orr r8, r8, #0x20000000
    and r3, r1, #0x1f0000
    mov r1, r0, lsl #0x10
    orr r3, r8, r3
    cmp r0, r2
    orr r8, r3, r1, lsr #0x10
    mov r9, #0x0
    bgt .L_2804
    cmp r0, r2
    bge .L_28a4
    ldr r1, _LIT5
    cmp r0, r1
    bgt .L_27f4
    bge .L_2848
    sub r1, r1, #0x89
    cmp r0, r1
    moveq r9, #0x1
    b .L_28dc
.L_27f4:
    add r1, r1, #0x6
    cmp r0, r1
    beq .L_2848
    b .L_28dc
.L_2804:
    ldr r1, _LIT6
    cmp r0, r1
    bgt .L_2824
    bge .L_28b8
    sub r1, r1, #0xd5
    cmp r0, r1
    beq .L_28ac
    b .L_28dc
.L_2824:
    ldr r1, _LIT7
    cmp r0, r1
    bgt .L_2838
    beq .L_28d0
    b .L_28dc
.L_2838:
    add r1, r1, #0x80
    cmp r0, r1
    beq .L_28a4
    b .L_28dc
.L_2848:
    mov r0, r6
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_28dc
    ldr r0, _LIT1
    ldr r2, [r6, #0xc]
    ldr r1, [r0, #0x1c]
    mov r0, r5
    bl func_ov002_021df53c
    cmp r4, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    ldr r0, _LIT1
    orr r2, r1, #0x47
    ldr r1, [r0, #0x20]
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x5
    mov r3, #0x0
    bl func_ov002_021d46ac
    b .L_28dc
.L_28a4:
    ldr r9, [r7, #0x2c]
    b .L_28dc
.L_28ac:
    cmp r5, r4
    movne r9, #0x1
    b .L_28dc
.L_28b8:
    ldr r0, [r6, #0x2c]
    cmp r0, #0x0
    cmpne r5, r4
    movne r9, #0x1
    moveq r9, #0x0
    b .L_28dc
.L_28d0:
    ldr r0, [r7, #0x2c]
    cmp r0, #0x0
    moveq r9, #0x1
.L_28dc:
    cmp r9, #0x0
    beq .L_28fc
    ldr r1, [r6, #0xc]
    mov r0, r8
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e2fc4
.L_28fc:
    ldr r0, _LIT1
    mov r1, r4, lsl #0x1f
    ldr r0, [r0, #0x20]
    and r1, r1, #-2147483648
    orr r8, r1, #0xa200000
    mov r1, r0, lsl #0x10
    ldr r0, [r7, #0x10]
    ldr r3, _LIT8
    orr r8, r8, #0x20000000
    and r2, r1, #0x1f0000
    mov r1, r0, lsl #0x10
    orr r2, r8, r2
    cmp r0, r3
    orr r8, r2, r1, lsr #0x10
    mov r9, #0x0
    bgt .L_299c
    cmp r0, r3
    bge .L_29f4
    ldr r2, _LIT9
    cmp r0, r2
    bgt .L_2978
    bge .L_2a70
    ldr r1, _LIT10
    cmp r0, r1
    bgt .L_2968
    beq .L_29f4
    b .L_2b28
.L_2968:
    add r1, r1, #0x8a
    cmp r0, r1
    beq .L_29fc
    b .L_2b28
.L_2978:
    add r1, r2, #0x108
    cmp r0, r1
    bgt .L_298c
    beq .L_29f4
    b .L_2b28
.L_298c:
    sub r1, r3, #0x140
    cmp r0, r1
    beq .L_2ad8
    b .L_2b28
.L_299c:
    ldr r2, _LIT6
    cmp r0, r2
    bgt .L_29d0
    bge .L_2b04
    add r1, r3, #0xe8
    cmp r0, r1
    bgt .L_29c0
    beq .L_2af0
    b .L_2b28
.L_29c0:
    sub r1, r2, #0xd5
    cmp r0, r1
    beq .L_2af8
    b .L_2b28
.L_29d0:
    ldr r1, _LIT7
    cmp r0, r1
    bgt .L_29e4
    beq .L_2b1c
    b .L_2b28
.L_29e4:
    add r1, r1, #0x80
    cmp r0, r1
    beq .L_2af0
    b .L_2b28
.L_29f4:
    mov r9, #0x1
    b .L_2b28
.L_29fc:
    mov r0, r7
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_2b28
    ldr r1, _LIT1
    mov r0, r5
    ldr r1, [r1, #0x1c]
    bl func_ov002_021c8860
    cmp r0, #0x7
    beq .L_2b28
    ldr r0, _LIT1
    ldr r2, [r7, #0xc]
    ldr r1, [r0, #0x20]
    mov r0, r4
    bl func_ov002_021df53c
    cmp r5, #0x0
    movne r1, #0x8000
    moveq r1, r9
    ldr r0, _LIT1
    orr r2, r1, #0x47
    ldr r1, [r0, #0x1c]
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x3
    mov r3, #0x0
    bl func_ov002_021d46ac
    b .L_2b28
.L_2a70:
    mov r0, r7
    bl func_ov002_021bacd0
    cmp r0, #0x0
    beq .L_2b28
    ldr r1, _LIT1
    mov r0, r5
    ldr r1, [r1, #0x1c]
    bl func_ov002_021c8860
    cmp r0, #0x2
    beq .L_2b28
    ldr r0, _LIT1
    ldr r2, [r7, #0xc]
    ldr r1, [r0, #0x20]
    mov r0, r4
    bl func_ov002_021df53c
    mov r0, r9
    str r0, [sp]
    ldr r1, _LIT1
    ldr r2, [r7, #0x10]
    ldr r0, [r1]
    mov r2, r2, lsl #0x10
    ldr r1, [r1, #0x1c]
    mov r2, r2, lsr #0x10
    mov r3, #0x21
    bl func_ov002_021d58dc
    b .L_2b28
.L_2ad8:
    ldr r0, [r6, #0x2c]
    cmp r0, #0x0
    cmpne r5, r4
    movne r9, #0x1
    moveq r9, #0x0
    b .L_2b28
.L_2af0:
    ldr r9, [r6, #0x2c]
    b .L_2b28
.L_2af8:
    cmp r5, r4
    movne r9, #0x1
    b .L_2b28
.L_2b04:
    ldr r0, [r7, #0x2c]
    cmp r0, #0x0
    cmpne r5, r4
    movne r9, #0x1
    moveq r9, #0x0
    b .L_2b28
.L_2b1c:
    ldr r0, [r6, #0x2c]
    cmp r0, #0x0
    moveq r9, #0x1
.L_2b28:
    cmp r9, #0x0
    beq .L_2b48
    ldr r1, [r7, #0xc]
    mov r0, r8
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e2fc4
.L_2b48:
    ldr r0, _LIT1
    ldr r0, [r0, #0x24]
    cmp r0, #0x0
    beq .L_2c2c
    bl func_0202f994
    cmp r0, #0x0
    beq .L_2c2c
    mov r0, #0x200
    ldr r3, [sp, #0x4]
    rsb r0, r0, #0x0
    ldr r2, [r7, #0xc]
    ldr r1, [r7, #0x4]
    and r3, r3, r0
    and r0, r2, r0, lsr #0x17
    orr r2, r3, r0
    ldr r0, [r7, #0x8]
    bic r3, r2, #0x200
    mov r2, r4, lsl #0x1f
    orr r2, r3, r2, lsr #0x16
    bic r2, r2, #0x3c00
    mov r1, r1, lsl #0x1c
    orr r1, r2, r1, lsr #0x12
    orr r1, r1, #0x8000
    bic r1, r1, #0x4000
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x11
    bic r0, r0, #0x10000
    bic r5, r0, #0x20000
    mov r0, r5, lsl #0x17
    mov r0, r0, lsr #0x17
    mov r1, r0, lsl #0x10
    mov r0, r8
    mov r2, r5
    mov r1, r1, lsr #0x10
    str r5, [sp, #0x4]
    bl func_ov002_021fd72c
    cmp r0, #0x0
    beq .L_2c2c
    cmp r4, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    ldr r0, _LIT1
    orr r2, r1, #0x61
    ldr r1, [r0, #0x24]
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_021d46ac
    ldr r1, [r7, #0xc]
    mov r0, r8
    mov r1, r1, lsl #0x10
    mov r2, r5
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_2c2c:
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2c38:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cd340
_LIT1: .word data_ov002_022cd314
_LIT2: .word data_ov002_022d008c
_LIT3: .word 0x00001770
_LIT4: .word 0x000015d9
_LIT5: .word 0x0000112f
_LIT6: .word 0x0000172c
_LIT7: .word 0x00001866
_LIT8: .word 0x000014f1
_LIT9: .word 0x00001208
_LIT10: .word 0x000010a6
