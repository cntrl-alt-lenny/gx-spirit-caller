; func_ov002_0225e870 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd420
        .extern data_ov002_022d016c
        .extern func_0202f9e8
        .extern func_ov002_021badb0
        .extern func_ov002_021c8940
        .extern func_ov002_021d479c
        .extern func_ov002_021d59cc
        .extern func_ov002_021df62c
        .extern func_ov002_021e30b4
        .extern func_ov002_021fd81c
        .extern func_ov002_02254a84
        .extern func_ov002_022561e0
        .global func_ov002_0225e870
        .arm
func_ov002_0225e870:
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
    beq .L_59c
    cmp r0, #0x1
    beq .L_63c
    b .L_ae4
.L_59c:
    bl func_ov002_02254a84
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    bl func_ov002_022561e0
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
    bne .L_620
    ldr r1, [r2, #0x24]
    cmp r1, #0x0
    beq .L_620
    ldr r1, [r7, #0xc]
    mov r2, #0x0
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_620:
    ldr r1, _LIT2
    add sp, sp, #0x8
    ldr r2, [r1, #0xd30]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd30]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_63c:
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
    bgt .L_6b0
    cmp r0, r2
    bge .L_750
    ldr r1, _LIT5
    cmp r0, r1
    bgt .L_6a0
    bge .L_6f4
    sub r1, r1, #0x89
    cmp r0, r1
    moveq r9, #0x1
    b .L_788
.L_6a0:
    add r1, r1, #0x6
    cmp r0, r1
    beq .L_6f4
    b .L_788
.L_6b0:
    ldr r1, _LIT6
    cmp r0, r1
    bgt .L_6d0
    bge .L_764
    sub r1, r1, #0xd5
    cmp r0, r1
    beq .L_758
    b .L_788
.L_6d0:
    ldr r1, _LIT7
    cmp r0, r1
    bgt .L_6e4
    beq .L_77c
    b .L_788
.L_6e4:
    add r1, r1, #0x80
    cmp r0, r1
    beq .L_750
    b .L_788
.L_6f4:
    mov r0, r6
    bl func_ov002_021badb0
    cmp r0, #0x0
    beq .L_788
    ldr r0, _LIT1
    ldr r2, [r6, #0xc]
    ldr r1, [r0, #0x1c]
    mov r0, r5
    bl func_ov002_021df62c
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
    bl func_ov002_021d479c
    b .L_788
.L_750:
    ldr r9, [r7, #0x2c]
    b .L_788
.L_758:
    cmp r5, r4
    movne r9, #0x1
    b .L_788
.L_764:
    ldr r0, [r6, #0x2c]
    cmp r0, #0x0
    cmpne r5, r4
    movne r9, #0x1
    moveq r9, #0x0
    b .L_788
.L_77c:
    ldr r0, [r7, #0x2c]
    cmp r0, #0x0
    moveq r9, #0x1
.L_788:
    cmp r9, #0x0
    beq .L_7a8
    ldr r1, [r6, #0xc]
    mov r0, r8
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e30b4
.L_7a8:
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
    bgt .L_848
    cmp r0, r3
    bge .L_8a0
    ldr r2, _LIT9
    cmp r0, r2
    bgt .L_824
    bge .L_91c
    ldr r1, _LIT10
    cmp r0, r1
    bgt .L_814
    beq .L_8a0
    b .L_9d4
.L_814:
    add r1, r1, #0x8a
    cmp r0, r1
    beq .L_8a8
    b .L_9d4
.L_824:
    add r1, r2, #0x108
    cmp r0, r1
    bgt .L_838
    beq .L_8a0
    b .L_9d4
.L_838:
    sub r1, r3, #0x140
    cmp r0, r1
    beq .L_984
    b .L_9d4
.L_848:
    ldr r2, _LIT6
    cmp r0, r2
    bgt .L_87c
    bge .L_9b0
    add r1, r3, #0xe8
    cmp r0, r1
    bgt .L_86c
    beq .L_99c
    b .L_9d4
.L_86c:
    sub r1, r2, #0xd5
    cmp r0, r1
    beq .L_9a4
    b .L_9d4
.L_87c:
    ldr r1, _LIT7
    cmp r0, r1
    bgt .L_890
    beq .L_9c8
    b .L_9d4
.L_890:
    add r1, r1, #0x80
    cmp r0, r1
    beq .L_99c
    b .L_9d4
.L_8a0:
    mov r9, #0x1
    b .L_9d4
.L_8a8:
    mov r0, r7
    bl func_ov002_021badb0
    cmp r0, #0x0
    beq .L_9d4
    ldr r1, _LIT1
    mov r0, r5
    ldr r1, [r1, #0x1c]
    bl func_ov002_021c8940
    cmp r0, #0x7
    beq .L_9d4
    ldr r0, _LIT1
    ldr r2, [r7, #0xc]
    ldr r1, [r0, #0x20]
    mov r0, r4
    bl func_ov002_021df62c
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
    bl func_ov002_021d479c
    b .L_9d4
.L_91c:
    mov r0, r7
    bl func_ov002_021badb0
    cmp r0, #0x0
    beq .L_9d4
    ldr r1, _LIT1
    mov r0, r5
    ldr r1, [r1, #0x1c]
    bl func_ov002_021c8940
    cmp r0, #0x2
    beq .L_9d4
    ldr r0, _LIT1
    ldr r2, [r7, #0xc]
    ldr r1, [r0, #0x20]
    mov r0, r4
    bl func_ov002_021df62c
    mov r0, r9
    str r0, [sp]
    ldr r1, _LIT1
    ldr r2, [r7, #0x10]
    ldr r0, [r1]
    mov r2, r2, lsl #0x10
    ldr r1, [r1, #0x1c]
    mov r2, r2, lsr #0x10
    mov r3, #0x21
    bl func_ov002_021d59cc
    b .L_9d4
.L_984:
    ldr r0, [r6, #0x2c]
    cmp r0, #0x0
    cmpne r5, r4
    movne r9, #0x1
    moveq r9, #0x0
    b .L_9d4
.L_99c:
    ldr r9, [r6, #0x2c]
    b .L_9d4
.L_9a4:
    cmp r5, r4
    movne r9, #0x1
    b .L_9d4
.L_9b0:
    ldr r0, [r7, #0x2c]
    cmp r0, #0x0
    cmpne r5, r4
    movne r9, #0x1
    moveq r9, #0x0
    b .L_9d4
.L_9c8:
    ldr r0, [r6, #0x2c]
    cmp r0, #0x0
    moveq r9, #0x1
.L_9d4:
    cmp r9, #0x0
    beq .L_9f4
    ldr r1, [r7, #0xc]
    mov r0, r8
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e30b4
.L_9f4:
    ldr r0, _LIT1
    ldr r0, [r0, #0x24]
    cmp r0, #0x0
    beq .L_ad8
    bl func_0202f9e8
    cmp r0, #0x0
    beq .L_ad8
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
    bl func_ov002_021fd81c
    cmp r0, #0x0
    beq .L_ad8
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
    bl func_ov002_021d479c
    ldr r1, [r7, #0xc]
    mov r0, r8
    mov r1, r1, lsl #0x10
    mov r2, r5
    mov r1, r1, lsr #0x10
    bl func_ov002_021e30b4
.L_ad8:
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_ae4:
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cd420
_LIT1: .word data_ov002_022cd3f4
_LIT2: .word data_ov002_022d016c
_LIT3: .word 0x00001770
_LIT4: .word 0x000015d9
_LIT5: .word 0x0000112f
_LIT6: .word 0x0000172c
_LIT7: .word 0x00001866
_LIT8: .word 0x000014f1
_LIT9: .word 0x00001208
_LIT10: .word 0x000010a6
