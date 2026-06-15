; func_02082c44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021021e8
        .extern data_021021ec
        .extern data_021a18b8
        .extern data_021a1904
        .extern data_021a1974
        .extern func_02084e0c
        .extern func_020852fc
        .global func_02082c44
        .arm
func_02082c44:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x44
    mov r7, r0
    ldr r1, [r7, #0x8]
    ands r0, r1, #0x200
    bne .L_688
    ands r0, r1, #0x1
    beq .L_688
    ldr r2, [r7, #0xb0]
    ldr r0, [r2, #0x10]
    and r1, r0, #-1073741824
    cmp r1, #-2147483648
    beq .L_3fc
    bic r0, r0, #-1073741824
    str r0, [r2, #0x10]
    ldr r2, [r7, #0xb0]
    ldr r3, _LIT0
    ldr r0, [r2, #0x10]
    ldr r1, _LIT1
    orr r0, r0, #-2147483648
    str r0, [r2, #0x10]
    ldr r2, [r7, #0xb0]
    ldr r0, [r3]
    ldr r4, [r2, #0x10]
    mov r2, #0x1
    str r4, [r3, #0x4]
    bl func_02084e0c
.L_3fc:
    mov r0, #0x3
    str r0, [sp]
    add r1, sp, #0x0
    mov r0, #0x10
    mov r2, #0x1
    bl func_02084e0c
    ldr r0, [r7, #0x3c]
    cmp r0, #0x0
    ldrneb r6, [r7, #0x98]
    moveq r6, #0x0
    cmp r6, #0x1
    bne .L_460
    ldr r1, [r7, #0x8]
    mov r0, r7
    bic r1, r1, #0x40
    str r1, [r7, #0x8]
    ldr r1, [r7, #0x3c]
    blx r1
    ldr r0, [r7, #0x3c]
    cmp r0, #0x0
    ldrneb r6, [r7, #0x98]
    ldr r0, [r7, #0x8]
    moveq r6, #0x0
    and r0, r0, #0x40
    b .L_464
.L_460:
    mov r0, #0x0
.L_464:
    cmp r0, #0x0
    bne .L_4dc
    ldr r0, [r7, #0xb0]
    add r1, sp, #0x38
    ldrh r4, [r0, #0x2e]
    ldrh r5, [r0, #0x2c]
    mov r3, #0x10000
    rsb r0, r4, #0x0
    mov ip, r0, lsl #0xf
    mov lr, r5, lsl #0xf
    mov r0, #0x1b
    mov r2, #0x3
    str lr, [sp, #0x38]
    str ip, [sp, #0x3c]
    str r3, [sp, #0x40]
    bl func_02084e0c
    mov r0, r5, lsl #0x13
    mov r1, r4, lsl #0x13
    mov r0, r0, asr #0x10
    mov r1, r1, asr #0x10
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, r0, lsr #0x10
    mov r0, r1, lsr #0x10
    orr r3, r2, r0, lsl #0x10
    add r1, sp, #0x4
    mov r0, #0x22
    mov r2, #0x1
    str r3, [sp, #0x4]
    bl func_02084e0c
.L_4dc:
    cmp r6, #0x2
    bne .L_518
    ldr r1, [r7, #0x8]
    mov r0, r7
    bic r1, r1, #0x40
    str r1, [r7, #0x8]
    ldr r1, [r7, #0x3c]
    blx r1
    ldr r0, [r7, #0x3c]
    cmp r0, #0x0
    ldrneb r6, [r7, #0x98]
    ldr r0, [r7, #0x8]
    moveq r6, #0x0
    and r0, r0, #0x40
    b .L_51c
.L_518:
    mov r0, #0x0
.L_51c:
    cmp r0, #0x0
    bne .L_580
    ldr r4, [r7, #0xd8]
    ldr r0, [r7]
    ldrh r2, [r4, #0xa]
    add r3, r4, #0x4
    ldrb r0, [r0, #0x1]
    ldrh r1, [r3, r2]
    add r2, r3, r2
    mla r0, r1, r0, r2
    ldr r0, [r0, #0x4]
    add r1, r4, r0
    ldrh r2, [r1, #0x1e]
    ands r0, r2, #0x2000
    beq .L_580
    add r1, r1, #0x2c
    ands r0, r2, #0x2
    addeq r1, r1, #0x8
    ands r0, r2, #0x4
    addeq r1, r1, #0x4
    ands r0, r2, #0x8
    addeq r1, r1, #0x8
    mov r0, #0x18
    mov r2, #0x10
    bl func_02084e0c
.L_580:
    cmp r6, #0x3
    movne r0, #0x0
    bne .L_5ac
    ldr r1, [r7, #0x8]
    mov r0, r7
    bic r1, r1, #0x40
    str r1, [r7, #0x8]
    ldr r1, [r7, #0x3c]
    blx r1
    ldr r0, [r7, #0x8]
    and r0, r0, #0x40
.L_5ac:
    cmp r0, #0x0
    bne .L_670
    mov r3, #0x2
    add r1, sp, #0x8
    mov r0, #0x10
    mov r2, #0x1
    str r3, [sp, #0x8]
    bl func_02084e0c
    add r1, sp, #0x14
    mov r0, #0x0
    bl func_020852fc
    mov r3, #0x3
    add r1, sp, #0xc
    mov r0, #0x10
    mov r2, #0x1
    str r3, [sp, #0xc]
    bl func_02084e0c
    ldr r0, _LIT2
    ldr r1, [r0, #0xfc]
    ands r0, r1, #0x1
    beq .L_634
    ldr r1, _LIT3
    mov r0, #0x1a
    mov r2, #0x9
    bl func_02084e0c
    ldr r1, _LIT4
    mov r0, #0x1a
    mov r2, #0x9
    bl func_02084e0c
    add r1, sp, #0x14
    mov r0, #0x1a
    mov r2, #0x9
    bl func_02084e0c
    b .L_670
.L_634:
    ands r0, r1, #0x2
    beq .L_660
    ldr r1, _LIT3
    mov r0, #0x1a
    mov r2, #0x9
    bl func_02084e0c
    add r1, sp, #0x14
    mov r0, #0x1a
    mov r2, #0x9
    bl func_02084e0c
    b .L_670
.L_660:
    add r1, sp, #0x14
    mov r0, #0x1a
    mov r2, #0x9
    bl func_02084e0c
.L_670:
    mov r3, #0x2
    add r1, sp, #0x10
    mov r0, #0x10
    mov r2, #0x1
    str r3, [sp, #0x10]
    bl func_02084e0c
.L_688:
    ldr r0, [r7]
    add r0, r0, #0x3
    str r0, [r7]
    add sp, sp, #0x44
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word data_021021e8
_LIT1: .word data_021021ec
_LIT2: .word data_021a18b8
_LIT3: .word data_021a1904
_LIT4: .word data_021a1974
