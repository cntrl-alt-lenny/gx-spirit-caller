; func_ov002_022b3fbc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bef80
        .extern data_ov002_022cd73c
        .extern data_ov002_022d0f7c
        .extern func_0207ef90
        .extern func_0207f05c
        .extern func_0208b0f0
        .extern func_0208e318
        .extern func_020a991c
        .global func_ov002_022b3fbc
        .arm
func_ov002_022b3fbc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x44
    mov r6, r0
    ldr r2, [r6, #0x54]
    mov r7, r1
    cmp r2, #0x0
    ldrne r0, [r6, #0x58]
    cmpne r0, #0x5
    addne r1, r6, r7, lsl #0x2
    ldrne r1, [r1, #0x4c]
    cmpne r1, #0x0
    addeq sp, sp, #0x44
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT0
    mov fp, #0x0
    ldr r1, [r1, #0x4]
    str fp, [sp, #0xc]
    eor r1, r1, #0x1
    cmp r7, r1
    moveq r4, #0xc0
    movne r4, #0x40
    cmp r0, #0x4
    moveq r5, #0x50
    movne r5, #0x30
    cmp r2, #0x80
    ble .L_464
    sub r2, r2, #0x80
    mov r1, r2, asr #0x2
    add r1, r2, r1, lsr #0x1d
    cmp r0, #0x4
    mov r8, r1, asr #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_448
    b .L_3f8
    b .L_404
    b .L_40c
    b .L_440
    b .L_40c
.L_3f8:
    add r0, r8, r8, lsr #0x1f
    add r5, r5, r0, asr #0x1
    b .L_448
.L_404:
    mov fp, #0x1
    b .L_448
.L_40c:
    bl func_020a991c
    ldr r2, _LIT1
    mov r3, #0x3
    smull r1, r8, r2, r0
    add r8, r8, r0, lsr #0x1f
    smull r1, r2, r3, r8
    sub r8, r0, r1
    sub r0, r8, #0x1
    add r4, r4, r0
    mov r0, #0x1
    mov r8, fp
    str r0, [sp, #0xc]
    b .L_448
.L_440:
    add r0, r8, r8, lsr #0x1f
    sub r5, r5, r0, asr #0x1
.L_448:
    ldr r0, _LIT2
    rsb r3, r8, #0x10
    mov r1, #0x0
    mov r2, #0x3f
    str r8, [sp]
    bl func_0208e318
    b .L_4e0
.L_464:
    bne .L_484
    ldr r0, _LIT2
    mov r1, fp
    mov r2, #0x3f
    mov r3, #0x10
    str fp, [sp]
    bl func_0208e318
    b .L_4e0
.L_484:
    rsb r2, r2, #0x80
    mov r1, r2, asr #0x2
    add r1, r2, r1, lsr #0x1d
    cmp r0, #0x4
    mov r8, r1, asr #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_4c8
    b .L_4b4
    b .L_4c0
    b .L_4c0
    b .L_4c0
    b .L_4c0
.L_4b4:
    add r0, r8, r8, lsr #0x1f
    sub r5, r5, r0, asr #0x1
    b .L_4c8
.L_4c0:
    add r0, r8, r8, lsr #0x1f
    add r5, r5, r0, asr #0x1
.L_4c8:
    ldr r0, _LIT2
    rsb r3, r8, #0x10
    mov r1, #0x0
    mov r2, #0x3f
    str r8, [sp]
    bl func_0208e318
.L_4e0:
    add r0, r6, r7, lsl #0x2
    ldr r3, [r0, #0x4c]
    ldr r0, _LIT3
    cmp r3, #0x0
    movge r7, r3
    mov r2, #0x0
    rsblt r7, r3, #0x0
    add r1, sp, #0x28
    mov sl, #0xa
.L_504:
    smull r9, ip, r0, r7
    mov r8, r7, lsr #0x1f
    add ip, r8, ip, asr #0x2
    smull r8, r9, sl, ip
    sub ip, r7, r8
    mov r9, r7
    smull r8, r7, r0, r9
    mov r8, r9, lsr #0x1f
    str ip, [r1, r2, lsl #0x2]
    add r2, r2, #0x1
    adds r7, r8, r7, asr #0x2
    bne .L_504
    cmp r3, #0x0
    movgt r3, #0x1
    add r8, r2, #0x1
    movle r3, #0x0
    mov r0, r8, lsl #0x4
    add r1, r0, r0, lsr #0x1f
    mov r9, #0x0
    add r3, r3, #0xa
    add r0, sp, #0x28
    str r3, [r0, r2, lsl #0x2]
    mvn r2, #0x0
    str r2, [r0, r8, lsl #0x2]
    ldr r0, _LIT4
    strh r9, [sp, #0x14]
    str r0, [sp, #0x10]
    cmp r8, #0x0
    add r4, r4, r1, asr #0x1
    addle sp, sp, #0x44
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    sub r0, r5, #0x10
    and r0, r0, #0xff
    str r0, [sp, #0x8]
    and r0, r5, #0xff
    ldr r7, _LIT5
    mov sl, r9
    str r0, [sp, #0x4]
.L_59c:
    ldr r0, [r6, #0x54]
    add r2, sp, #0x28
    sub r0, r0, #0xc0
    add r1, r0, sl
    ldr r3, [r2, r9, lsl #0x2]
    ldrh r0, [sp, #0x14]
    ldr ip, _LIT4
    mov r3, r3, lsl #0x9
    and r0, r0, ip, asr #0x15
    add r3, r3, #0x780
    ldr r2, [sp, #0x10]
    ldr ip, _LIT6
    cmp r1, #0x0
    and r2, r2, ip
    add r3, r3, #0x4000
    mov ip, r3, asr #0x4
    add r3, r3, ip, lsr #0x1b
    orr r0, r0, r3, asr #0x5
    movle r1, #0x0
    sub r4, r4, #0x10
    cmp fp, #0x0
    str r2, [sp, #0x10]
    strh r0, [sp, #0x14]
    beq .L_66c
    cmp r1, #0x40
    bgt .L_6e8
    mov r1, r1, lsl #0xc
    mov r0, r1, asr #0x6
    add r0, r1, r0, lsr #0x19
    mov r0, r0, asr #0x7
    rsb r1, r0, #0x1000
    add r0, sp, #0x18
    mov r2, r1
    bl func_0208b0f0
    ldr r2, [sp, #0x10]
    sub r0, r4, #0x8
    and r3, r2, r7
    ldr r2, [sp, #0x8]
    mov r1, r0, lsl #0x17
    orr r2, r3, r2
    orr r1, r2, r1, lsr #0x7
    str r1, [sp, #0x10]
    ldr r0, _LIT7
    add r1, sp, #0x18
    bl func_0207ef90
    ldr r2, [sp, #0x10]
    ldr r1, _LIT6
    and r1, r2, r1
    orr r1, r1, #0x300
    orr r0, r1, r0, lsl #0x19
    str r0, [sp, #0x10]
    b .L_6d8
.L_66c:
    ldr r0, [sp, #0xc]
    cmp r0, #0x0
    beq .L_6c0
    cmp r1, #0x40
    bgt .L_6e8
    mov r3, r1, lsl #0xf
    and r0, r2, r7
    mov r2, r3, asr #0x5
    add r2, r3, r2, lsr #0x1a
    mov r2, r2, asr #0xa
    mov r3, r2, lsl #0x2
    ldr r2, _LIT8
    mov r1, r4, lsl #0x17
    ldrsh r2, [r2, r3]
    mov r2, r2, lsl #0x4
    sub r2, r5, r2, asr #0xc
    and r2, r2, #0xff
    orr r0, r0, r2
    orr r0, r0, r1, lsr #0x7
    str r0, [sp, #0x10]
    b .L_6d8
.L_6c0:
    ldr r0, [sp, #0x4]
    and r1, r2, r7
    orr r0, r1, r0
    mov r1, r4, lsl #0x17
    orr r0, r0, r1, lsr #0x7
    str r0, [sp, #0x10]
.L_6d8:
    ldr r0, _LIT7
    add r1, sp, #0x10
    mov r2, #0x1
    bl func_0207f05c
.L_6e8:
    add sl, sl, #0xc
    add r9, r9, #0x1
    cmp r9, r8
    blt .L_59c
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022cd73c
_LIT1: .word 0x55555556
_LIT2: .word 0x04000050
_LIT3: .word 0x66666667
_LIT4: .word 0x8000a400
_LIT5: .word 0xfe00ff00
_LIT6: .word 0xc1fffcff
_LIT7: .word data_ov002_022d0f7c
_LIT8: .word data_020bef80
