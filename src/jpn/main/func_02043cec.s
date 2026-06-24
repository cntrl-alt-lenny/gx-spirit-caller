; func_02043cec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern WaitByLoop
        .extern data_0219d990
        .extern data_0219d994
        .extern data_0219d9c0
        .extern func_020927e4
        .extern func_02092fc8
        .extern func_02096264
        .extern func_020b3714
        .global func_02043cec
        .arm
func_02043cec:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc4
    ldr ip, _LIT0
    ldr sl, _LIT1
    and r8, r2, ip
    and r7, r1, ip
    mov r5, r1, lsr #0x10
    mov r4, r3, lsr #0x10
    and r1, r3, ip
    orr r3, r8, #0x30000
    str r3, [sp, #0xc]
    ldr r3, _LIT2
    orr r2, r2, #0x20000
    orr r3, r1, r3
    str r3, [sp, #0x14]
    orr r1, r1, #0x1040000
    mov r9, r0
    and r0, r5, #0xff
    str r2, [sp, #0x1c]
    str r1, [sp, #0x24]
    ldr r1, _LIT3
    mov r8, #0x0
    orr r2, r4, #0x40000
    orr r1, r1, sl, lsr #0x18
    str r1, [sp, #0x28]
    and r1, ip, sl, lsr #0x8
    orr r1, r1, #0x10000
    ldr r3, _LIT4
    str r2, [sp, #0x10]
    orr r2, r0, r3
    str r2, [sp, #0x8]
    orr r2, r4, #0x30000
    str r2, [sp, #0x20]
    ldr r2, _LIT5
    mov r6, sl, lsl #0x8
    str r1, [sp, #0x2c]
    and r1, r6, #0xff00
    orr r0, r0, r2
    ldr r3, _LIT6
    str r0, [sp, #0x18]
    orr r0, r1, r3
    str r0, [sp, #0x30]
    mov r0, #0x20000
    str r0, [sp, #0x40]
    mov r0, #0x5
    str r0, [sp, #0xac]
    mov r0, #0x3
    str r0, [sp, #0xb0]
    mov r0, #0x6
    str r0, [sp, #0xb8]
    mov r0, #0x4000
    orr r7, r7, #0x10000
    str r8, [sp, #0xb4]
    mov r4, #0x1
    str r8, [sp, #0xa8]
    mov r5, #0x4
    str r8, [sp, #0xa4]
    str r8, [sp, #0xa0]
    str r8, [sp, #0x90]
    str r8, [sp, #0x98]
    str r8, [sp, #0x9c]
    str r8, [sp, #0x94]
    str r8, [sp, #0x8c]
    str r8, [sp, #0x6c]
    str r8, [sp, #0x74]
    str r8, [sp, #0x7c]
    str r8, [sp, #0x84]
    str r8, [sp, #0x88]
    str r8, [sp, #0x80]
    str r8, [sp, #0x78]
    str r8, [sp, #0x70]
    str r8, [sp, #0x68]
    str r8, [sp, #0x64]
    str r8, [sp, #0x38]
    str r8, [sp, #0x44]
    str r8, [sp, #0x4c]
    str r8, [sp, #0x54]
    str r8, [sp, #0x5c]
    str r8, [sp, #0x60]
    str r8, [sp, #0x58]
    str r8, [sp, #0x50]
    str r8, [sp, #0x48]
    str r8, [sp, #0x3c]
    str r8, [sp, #0x34]
    mov r6, r8
    str r0, [sp, #0xbc]
.L_158:
    cmp r8, #0x0
    bne .L_394
    ldr r0, _LIT7
    cmp r9, #0x7
    str r6, [r0]
    addls pc, pc, r9, lsl #0x2
    b .L_158
    b .L_158
    b .L_194
    b .L_240
    b .L_260
    b .L_2fc
    b .L_2fc
    b .L_354
    b .L_374
.L_194:
    ldr r1, [sp, #0x8]
    mov r0, r5
    mov r2, r6
    bl func_02096264
    cmp r0, #0x0
    ldrlt r8, [sp, #0x34]
    blt .L_158
    ldr r2, [sp, #0x38]
    mov r0, r5
    mov r1, r7
    bl func_02096264
    cmp r0, #0x0
    ldrlt r8, [sp, #0x3c]
    blt .L_158
    ldr r1, [sp, #0x40]
    ldr r2, [sp, #0x44]
    mov r0, r5
    bl func_02096264
    cmp r0, #0x0
    ldrlt r8, [sp, #0x48]
    blt .L_158
    ldr r1, [sp, #0xc]
    ldr r2, [sp, #0x4c]
    mov r0, r5
    bl func_02096264
    cmp r0, #0x0
    ldrlt r8, [sp, #0x50]
    blt .L_158
    ldr r1, [sp, #0x10]
    ldr r2, [sp, #0x54]
    mov r0, r5
    bl func_02096264
    cmp r0, #0x0
    ldrlt r8, [sp, #0x58]
    blt .L_158
    ldr r1, [sp, #0x14]
    ldr r2, [sp, #0x5c]
    mov r0, r5
    bl func_02096264
    cmp r0, #0x0
    ldrlt r8, [sp, #0x60]
    movge r8, r4
    b .L_158
.L_240:
    ldr r1, _LIT8
    mov r0, r5
    mov r2, r6
    bl func_02096264
    cmp r0, #0x0
    movge r8, r4
    ldrlt r8, [sp, #0x64]
    b .L_158
.L_260:
    ldr r1, [sp, #0x18]
    mov r0, r5
    mov r2, r6
    bl func_02096264
    cmp r0, #0x0
    ldrlt r8, [sp, #0x68]
    blt .L_2ec
    ldr r2, [sp, #0x6c]
    mov r0, r5
    mov r1, r7
    bl func_02096264
    cmp r0, #0x0
    ldrlt r8, [sp, #0x70]
    blt .L_2ec
    ldr r1, [sp, #0x1c]
    ldr r2, [sp, #0x74]
    mov r0, r5
    bl func_02096264
    cmp r0, #0x0
    ldrlt r8, [sp, #0x78]
    blt .L_2ec
    ldr r1, [sp, #0x20]
    ldr r2, [sp, #0x7c]
    mov r0, r5
    bl func_02096264
    cmp r0, #0x0
    ldrlt r8, [sp, #0x80]
    blt .L_2ec
    ldr r1, [sp, #0x24]
    ldr r2, [sp, #0x84]
    mov r0, r5
    bl func_02096264
    cmp r0, #0x0
    ldrlt r8, [sp, #0x88]
    movge r8, r4
.L_2ec:
    bl func_02092fc8
    str r0, [sp]
    mov fp, r1
    b .L_158
.L_2fc:
    ldr r1, [sp, #0x28]
    mov r0, r5
    mov r2, r6
    bl func_02096264
    cmp r0, #0x0
    ldrlt r8, [sp, #0x8c]
    blt .L_158
    ldr r1, [sp, #0x2c]
    ldr r2, [sp, #0x90]
    mov r0, r5
    bl func_02096264
    cmp r0, #0x0
    ldrlt r8, [sp, #0x94]
    blt .L_158
    ldr r1, [sp, #0x30]
    ldr r2, [sp, #0x98]
    mov r0, r5
    bl func_02096264
    cmp r0, #0x0
    ldrlt r8, [sp, #0x9c]
    movge r8, r4
    b .L_158
.L_354:
    ldr r1, _LIT9
    mov r0, r5
    mov r2, r6
    bl func_02096264
    cmp r0, #0x0
    movge r8, r4
    ldrlt r8, [sp, #0xa0]
    b .L_158
.L_374:
    ldr r1, _LIT10
    mov r0, r5
    mov r2, r6
    bl func_02096264
    cmp r0, #0x0
    movge r8, r4
    ldrlt r8, [sp, #0xa4]
    b .L_158
.L_394:
    ldr r0, _LIT7
    ldr r0, [r0]
    cmp r0, #0x1
    bne .L_158
    ldr r0, _LIT11
    ldr r8, [sp, #0xa8]
    ldrh r0, [r0]
    cmp r0, #0x0
    bne .L_4ac
    cmp r9, #0x7
    addls pc, pc, r9, lsl #0x2
    b .L_158
    b .L_158
    b .L_3e4
    b .L_3f0
    b .L_3f8
    b .L_400
    b .L_400
    b .L_494
    b .L_4a0
.L_3e4:
    add sp, sp, #0xc4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_3f0:
    mov r9, r5
    b .L_158
.L_3f8:
    ldr r9, [sp, #0xac]
    b .L_158
.L_400:
    mov r0, sl
    mov r1, r4
    bl func_020927e4
    cmp r9, #0x4
    bne .L_430
    ldrb r0, [sl]
    ands r0, r0, #0x2
    ldrne r9, [sp, #0xb0]
    bne .L_158
    add sp, sp, #0xc4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_430:
    ldrb r1, [sl]
    ands r0, r1, #0x1
    addeq sp, sp, #0xc4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ands r0, r1, #0x20
    bne .L_480
    bl func_02092fc8
    ldr r2, [sp]
    ldr r3, [sp, #0xb4]
    subs r2, r0, r2
    sbc r0, r1, fp
    mov r1, r0, lsl #0x6
    orr r1, r1, r2, lsr #0x1a
    mov r0, r2, lsl #0x6
    ldr r2, _LIT12
    bl func_020b3714
    cmp r1, #0x0
    cmpeq r0, #0xfa0
    bls .L_488
.L_480:
    ldr r9, [sp, #0xb8]
    b .L_158
.L_488:
    ldr r0, [sp, #0xbc]
    bl WaitByLoop
    b .L_158
.L_494:
    add sp, sp, #0xc4
    mov r0, r8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4a0:
    add sp, sp, #0xc4
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_4ac:
    mov r0, r8
    add sp, sp, #0xc4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x0000ffff
_LIT1: .word data_0219d9c0
_LIT2: .word 0x01050000
_LIT3: .word 0x02002200
_LIT4: .word 0x02002300
_LIT5: .word 0x02002500
_LIT6: .word 0x01020000
_LIT7: .word data_0219d994
_LIT8: .word 0x03002000
_LIT9: .word 0x03002d00
_LIT10: .word 0x03002100
_LIT11: .word data_0219d990
_LIT12: .word 0x000082ea
