; func_020828b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021021e0
        .extern data_02102210
        .extern data_021a18b8
        .extern data_021a1974
        .extern data_021a1998
        .extern func_02082198
        .extern func_02084e0c
        .extern func_02084fe0
        .extern func_020852fc
        .extern func_0208e664
        .global func_020828b4
        .arm
func_020828b4:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x80
    mov r5, r0
    ldr r1, [r5, #0x8]
    ands r0, r1, #0x200
    bne .L_354
    ands r0, r1, #0x1
    beq .L_354
    add r0, sp, #0x10
    mov r1, #0x0
    bl func_020852fc
    mov r0, #0x1e
    str r0, [sp]
    add r1, sp, #0x0
    mov r0, #0x13
    mov r2, #0x1
    bl func_02084e0c
    ldr r2, [r5, #0xb0]
    ldr r0, [r2, #0x10]
    and r1, r0, #-1073741824
    cmp r1, #-1073741824
    beq .L_90
    bic r0, r0, #-1073741824
    str r0, [r2, #0x10]
    ldr r2, [r5, #0xb0]
    ldr r3, _LIT0
    ldr r0, [r2, #0x10]
    ldr r1, _LIT1
    orr r0, r0, #-1073741824
    str r0, [r2, #0x10]
    ldr r2, [r5, #0xb0]
    ldr r0, [r3]
    ldr r4, [r2, #0x10]
    mov r2, #0x1
    str r4, [r3, #0x4]
    bl func_02084e0c
.L_90:
    ldr r0, [r5, #0x40]
    cmp r0, #0x0
    ldrneb r4, [r5, #0x99]
    moveq r4, #0x0
    cmp r4, #0x1
    bne .L_dc
    ldr r1, [r5, #0x8]
    mov r0, r5
    bic r1, r1, #0x40
    str r1, [r5, #0x8]
    ldr r1, [r5, #0x40]
    blx r1
    ldr r0, [r5, #0x40]
    cmp r0, #0x0
    ldrneb r4, [r5, #0x99]
    ldr r0, [r5, #0x8]
    moveq r4, #0x0
    and r0, r0, #0x40
    b .L_e0
.L_dc:
    mov r0, #0x0
.L_e0:
    cmp r0, #0x0
    bne .L_124
    ldr r0, [r5, #0xb0]
    ldr r1, _LIT2
    ldrh r6, [r0, #0x2e]
    ldrh r3, [r0, #0x2c]
    mov r0, #0x16
    rsb r2, r6, #0x0
    mov lr, r3, lsl #0xf
    mov ip, r2, lsl #0xf
    mov r3, r6, lsl #0xf
    mov r2, #0x10
    str lr, [r1]
    str ip, [r1, #0x14]
    str lr, [r1, #0x30]
    str r3, [r1, #0x34]
    bl func_02084e0c
.L_124:
    cmp r4, #0x2
    bne .L_160
    ldr r1, [r5, #0x8]
    mov r0, r5
    bic r1, r1, #0x40
    str r1, [r5, #0x8]
    ldr r1, [r5, #0x40]
    blx r1
    ldr r0, [r5, #0x40]
    cmp r0, #0x0
    ldrneb r4, [r5, #0x99]
    ldr r0, [r5, #0x8]
    moveq r4, #0x0
    and r0, r0, #0x40
    b .L_164
.L_160:
    mov r0, #0x0
.L_164:
    cmp r0, #0x0
    bne .L_1c8
    ldr ip, [r5, #0xd8]
    ldr r0, [r5]
    ldrh r2, [ip, #0xa]
    add r3, ip, #0x4
    ldrb r0, [r0, #0x1]
    ldrh r1, [r3, r2]
    add r2, r3, r2
    mla r0, r1, r0, r2
    ldr r0, [r0, #0x4]
    add r1, ip, r0
    ldrh r2, [r1, #0x1e]
    ands r0, r2, #0x2000
    beq .L_1c8
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
.L_1c8:
    cmp r4, #0x3
    movne r0, #0x0
    bne .L_1f4
    ldr r1, [r5, #0x8]
    mov r0, r5
    bic r1, r1, #0x40
    str r1, [r5, #0x8]
    ldr r1, [r5, #0x40]
    blx r1
    ldr r0, [r5, #0x8]
    and r0, r0, #0x40
.L_1f4:
    cmp r0, #0x0
    bne .L_324
    ldr r0, _LIT3
    ldr r1, [r0, #0xfc]
    ands r0, r1, #0x1
    beq .L_240
    ldr r1, _LIT4
    mov r0, #0x1c
    mov r2, #0x3
    bl func_02084e0c
    ldr r1, _LIT5
    mov r0, #0x1a
    mov r2, #0x9
    bl func_02084e0c
    add r1, sp, #0x10
    mov r0, #0x19
    mov r2, #0xc
    bl func_02084e0c
    b .L_280
.L_240:
    ands r0, r1, #0x2
    beq .L_25c
    add r1, sp, #0x10
    mov r0, #0x19
    mov r2, #0xc
    bl func_02084e0c
    b .L_280
.L_25c:
    bl func_02082198
    mov r1, r0
    mov r0, #0x19
    mov r2, #0xc
    bl func_02084e0c
    add r1, sp, #0x10
    mov r0, #0x19
    mov r2, #0xc
    bl func_02084e0c
.L_280:
    bl func_02084fe0
    ldr r0, _LIT6
    mov r2, #0x0
    ldr r1, _LIT7
    str r2, [r0]
    ldr r0, _LIT8
    str r2, [r1]
    str r2, [r0]
    add r4, sp, #0x40
.L_2a4:
    mov r0, r4
    bl func_0208e664
    cmp r0, #0x0
    bne .L_2a4
    ldr r1, _LIT9
    mov r2, #0x1
    str r2, [r1]
    ldr r0, _LIT6
    mov r2, #0x3
    str r2, [r0]
    add r1, sp, #0x40
    mov r0, #0x16
    mov r2, #0x10
    bl func_02084e0c
    ldr r1, [sp, #0x70]
    ldr r0, [sp, #0x74]
    mov r2, r1, asr #0x4
    mov r1, r0, asr #0x4
    mov r0, r2, lsl #0x8
    mov r1, r1, lsl #0x8
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
.L_324:
    mov r3, #0x2
    add r1, sp, #0x8
    mov r0, #0x10
    mov r2, #0x1
    str r3, [sp, #0x8]
    bl func_02084e0c
    mov r3, #0x1e
    add r1, sp, #0xc
    mov r0, #0x14
    mov r2, #0x1
    str r3, [sp, #0xc]
    bl func_02084e0c
.L_354:
    ldr r0, [r5]
    add r0, r0, #0x3
    str r0, [r5]
    add sp, sp, #0x80
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_021021e0
_LIT1: .word data_021021e0+0x4
_LIT2: .word data_02102210
_LIT3: .word data_021a18b8
_LIT4: .word data_021a1998
_LIT5: .word data_021a1974
_LIT6: .word 0x04000440
_LIT7: .word 0x04000444
_LIT8: .word 0x04000454
_LIT9: .word 0x04000448
