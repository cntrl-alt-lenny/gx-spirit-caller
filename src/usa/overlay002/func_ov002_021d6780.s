; func_ov002_021d6780 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c2
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0c6
        .extern data_ov002_022d0570
        .extern func_0202f994
        .extern func_ov002_021b9dec
        .extern func_ov002_021baf88
        .extern func_ov002_021d46ac
        .extern func_ov002_021d58dc
        .extern func_ov002_021d5a90
        .extern func_ov002_021e267c
        .extern func_ov002_021e2ca4
        .extern func_ov002_021e2fc4
        .extern func_ov002_02244efc
        .global func_ov002_021d6780
        .arm
func_ov002_021d6780:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov r9, r1
    mov sl, r0
    mov r8, r2
    mov fp, r3
    bl func_ov002_021b9dec
    cmp r9, #0x5
    mov r4, r0
    addge sp, sp, #0xc
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    cmp r4, #0x0
    beq .L_3e8
    ldr r1, _LIT0
    and r2, sl, #0x1
    mul r7, r2, r1
    mov r0, #0x14
    mul r6, r9, r0
    ldr r1, _LIT1
    ldr r2, _LIT2
    add r0, r1, r7
    ldrh r0, [r6, r0]
    add r1, r2, r7
    ldrh r5, [r6, r1]
    cmp r0, #0x0
    moveq r0, #0x1
    streq r0, [sp, #0x4]
    movne r0, #0x0
    strne r0, [sp, #0x4]
    ldr r0, _LIT3
    ldr r1, [sp, #0x8]
    add r0, r0, r7
    add r0, r0, #0x30
    ldr ip, [r0, r6]
    bic r2, r1, #0x200
    mov r1, sl, lsl #0x1f
    orr r1, r2, r1, lsr #0x16
    mov r2, ip, lsl #0x2
    mov r3, r2, lsr #0x18
    mov r2, #0x200
    eor r0, r5, r8
    mov ip, ip, lsl #0x12
    mov r3, r3, lsl #0x1
    add ip, r3, ip, lsr #0x1f
    bic r1, r1, #0x3c00
    mov r3, r9, lsl #0x1c
    orr r1, r1, r3, lsr #0x12
    rsb r2, r2, #0x0
    bic r3, r1, #0x4000
    and r1, ip, r2, lsr #0x17
    ldr ip, [sp, #0x4]
    mov r0, r0, lsl #0x1f
    mov ip, ip, lsl #0x1f
    orr r3, r3, ip, lsr #0x11
    bic r3, r3, #0x8000
    orr r0, r3, r0, lsr #0x10
    and r2, r0, r2
    ldr r0, [sp, #0x34]
    orr r1, r2, r1
    bic r1, r1, #0x10000
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0xf
    bic r0, r0, #0x20000
    cmp fp, #0x0
    str r0, [sp, #0x8]
    beq .L_120
    mov r0, r4
    bl func_0202f994
    cmp fp, r0
    movle fp, #0x1
    movgt fp, #0x0
.L_120:
    ldr r0, [sp, #0x30]
    cmp sl, #0x0
    movne r1, #0x8000
    moveq r1, #0x0
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    orr r1, r1, #0x34
    mov ip, r1, lsl #0x10
    mov r3, r0, lsl #0x10
    mov r1, r9, lsl #0x10
    mov r2, r8, lsl #0x10
    mov r0, ip, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d46ac
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    bne .L_184
    mov r0, sl
    mov r1, r9
    mov r2, #0x15
    mov r3, #0x1
    bl func_ov002_021e2ca4
.L_184:
    cmp r8, #0x0
    bne .L_194
    cmp r5, #0x0
    bne .L_1a4
.L_194:
    cmp r8, #0x0
    beq .L_278
    cmp r5, #0x0
    bne .L_278
.L_1a4:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_1fc
    ldr r0, _LIT4
    cmp r4, r0
    bne .L_278
    mov r0, sl, lsl #0x1f
    ldr r2, [sp, #0x8]
    and r0, r0, #-2147483648
    orr r3, r0, #0x6200000
    mov r0, r9, lsl #0x10
    mov r1, r2, lsl #0x17
    mov r1, r1, lsr #0x17
    mov r1, r1, lsl #0x10
    orr r3, r3, #0x10000000
    and r0, r0, #0x1f0000
    orr r3, r3, r0
    mov r0, r4, lsl #0x10
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
    b .L_278
.L_1fc:
    ldr r1, _LIT5
    cmp r4, r1
    bgt .L_21c
    bge .L_23c
    sub r0, r1, #0x2a
    cmp r4, r0
    beq .L_23c
    b .L_278
.L_21c:
    ldr r0, _LIT6
    cmp r4, r0
    bgt .L_230
    beq .L_23c
    b .L_278
.L_230:
    add r0, r1, #0x820
    cmp r4, r0
    bne .L_278
.L_23c:
    mov r0, sl, lsl #0x1f
    ldr r2, [sp, #0x8]
    and r0, r0, #-2147483648
    orr r3, r0, #0x6200000
    mov r0, r9, lsl #0x10
    mov r1, r2, lsl #0x17
    mov r1, r1, lsr #0x17
    mov r1, r1, lsl #0x10
    orr r3, r3, #0x10000000
    and r0, r0, #0x1f0000
    orr r3, r3, r0
    mov r0, r4, lsl #0x10
    orr r0, r3, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2fc4
.L_278:
    cmp fp, #0x0
    cmpne r8, #0x0
    beq .L_330
    cmp r5, #0x0
    bne .L_330
    mov r0, r4
    bl func_0202f994
    cmp r0, #0x0
    beq .L_330
    ldr r0, _LIT7
    cmp r4, r0
    ldrne r0, _LIT8
    cmpne r4, r0
    bne .L_2dc
    ldr r0, _LIT9
    bl func_ov002_021baf88
    cmp r0, #0x0
    bne .L_2dc
    ldr r2, _LIT7
    mov fp, #0x0
    mov r0, sl
    mov r1, r9
    mov r3, #0x2
    str fp, [sp]
    bl func_ov002_021d58dc
.L_2dc:
    mov r0, sl, lsl #0x1f
    ldr r2, [sp, #0x8]
    and r0, r0, #-2147483648
    orr r3, r0, #0x6200000
    mov r0, r9, lsl #0x10
    mov r1, r2, lsl #0x17
    mov r1, r1, lsr #0x17
    ldr fp, _LIT2
    mov r1, r1, lsl #0x10
    orr r3, r3, #0x10000000
    add fp, fp, r7
    mov r4, r4, lsl #0x10
    and r0, r0, #0x1f0000
    orr r0, r3, r0
    mov r3, #0x1
    orr r0, r0, r4, lsr #0x10
    mov r1, r1, lsr #0x10
    strh r3, [fp, r6]
    bl func_ov002_021e2fc4
    mov r0, #0x0
    strh r0, [fp, r6]
.L_330:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    beq .L_3b4
    ldr r0, _LIT10
    add r0, r0, r7
    ldrh r7, [r6, r0]
    cmp r7, #0x0
    beq .L_3a0
    ldr r4, _LIT11
    ldr r6, _LIT12
    mov fp, #0x1
.L_35c:
    add r1, r6, r7, lsl #0x3
    ldrh r0, [r1, #0x2]
    ldrh r7, [r1, #0x6]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x6
    bcs .L_398
    ldrh r0, [r1]
    cmp r0, r4
    bne .L_398
    ldrh r0, [r1, #0x4]
    mov r1, r4
    mov r2, fp
    mov r3, #0x0
    bl func_ov002_021e267c
.L_398:
    cmp r7, #0x0
    bne .L_35c
.L_3a0:
    ldr r2, _LIT11
    mov r0, sl
    mov r1, r9
    mov r3, #0x1
    bl func_ov002_021d5a90
.L_3b4:
    cmp r8, #0x0
    cmpne r5, #0x0
    beq .L_3d0
    ldr r1, [sp, #0x8]
    mov r0, #0x9
    bl func_ov002_02244efc
    b .L_3dc
.L_3d0:
    ldr r1, [sp, #0x8]
    mov r0, #0xb
    bl func_ov002_02244efc
.L_3dc:
    add sp, sp, #0xc
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3e8:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c2
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word data_ov002_022cf08c
_LIT4: .word 0x00001005
_LIT5: .word 0x00001048
_LIT6: .word 0x00001197
_LIT7: .word 0x00001174
_LIT8: .word 0x0000133b
_LIT9: .word 0x0000148e
_LIT10: .word data_ov002_022cf0c6
_LIT11: .word 0x00001a0b
_LIT12: .word data_ov002_022d0570
