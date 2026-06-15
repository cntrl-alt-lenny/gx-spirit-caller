; func_0202d558 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bead0
        .extern data_020c6d44
        .extern data_020c6d50
        .extern data_020c6d58
        .extern data_020c6d64
        .extern data_02102c7c
        .extern data_02102c90
        .extern data_0219ad48
        .extern func_02001d0c
        .extern func_02001d84
        .extern func_02001e94
        .extern func_02005088
        .extern func_0201d4b4
        .extern func_0201d530
        .extern func_0202b360
        .extern func_0202b830
        .extern func_0202b854
        .extern func_0202b890
        .extern func_0202b8c0
        .extern func_0202b950
        .extern func_0202b980
        .extern func_0202d2dc
        .extern func_0202d3c4
        .extern func_0202d4a8
        .extern func_0202e234
        .extern func_02094504
        .extern func_020a978c
        .global func_0202d558
        .arm
func_0202d558:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x50
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    bl func_0202b890
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x6c]
    bl func_0201d4b4
    mov r5, r0
    mov r0, r4
    add r4, r5, #0x580
    bl func_0202d3c4
    ldr r2, _LIT1
    add r0, r5, #0x500
    strh r2, [r0, #0x80]
    add r0, r2, #0x1
    strh r0, [r4, #0x2]
    add r0, r2, #0x2
    strh r0, [r4, #0x40]
    add r0, r2, #0x3
    ldr r1, _LIT0
    strh r0, [r4, #0x42]
    ldr r0, [r1, #0x6c]
    bl func_0201d530
    add r4, r0, #0xe60
    mov r0, #0x0
    add r1, r4, #0x1000
    mov r2, #0x280
    bl func_02094504
    ldr r0, _LIT2
    mov r1, #0xa
    mov r2, #0x2
    bl func_02001d0c
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    bl func_0202b890
    bl func_0202b830
    mov r3, #0x2
    mov r1, r0
    str r3, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT2
    add r2, r4, #0x1000
    bl func_02005088
    ldr r0, _LIT0
    ldr r0, [r0, #0x6c]
    bl func_0201d4b4
    add r0, r0, #0x184
    add r1, r0, #0x400
    ldr r0, _LIT2
    mov r2, #0xf3
    mov r3, #0x1
    bl func_02001e94
    ldr r0, _LIT0
    ldr r0, [r0, #0x6c]
    bl func_0201d530
    add r4, r0, #0xa20
    mov r0, #0x0
    add r1, r4, #0x1000
    mov r2, #0x440
    bl func_02094504
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    bl func_0202e234
    cmp r0, #0x0
    beq .L_9b4
    ldr r0, _LIT0
    ldr r1, _LIT3
    ldr r0, [r0, #0x4]
    ldr r5, [r1]
    bl func_0202b950
    ldr r1, _LIT0
    mov r7, r0
    ldr r0, [r1, #0x4]
    bl func_0202b980
    ldr r1, _LIT4
    mov r6, r0
    cmp r7, r1
    bne .L_8b0
    ldr r3, _LIT5
    add r7, sp, #0x30
    mov r2, #0x4
.L_884:
    ldrb r1, [r3]
    ldrb r0, [r3, #0x1]
    add r3, r3, #0x2
    strb r1, [r7]
    strb r0, [r7, #0x1]
    add r7, r7, #0x2
    subs r2, r2, #0x1
    bne .L_884
    ldrb r0, [r3]
    strb r0, [r7]
    b .L_8c0
.L_8b0:
    ldr r1, _LIT6
    add r0, sp, #0x30
    mov r2, r7
    bl func_020a978c
.L_8c0:
    ldr r0, _LIT4
    cmp r6, r0
    bne .L_904
    ldr r3, _LIT7
    add r6, sp, #0x10
    mov r2, #0x4
.L_8d8:
    ldrb r1, [r3]
    ldrb r0, [r3, #0x1]
    add r3, r3, #0x2
    strb r1, [r6]
    strb r0, [r6, #0x1]
    add r6, r6, #0x2
    subs r2, r2, #0x1
    bne .L_8d8
    ldrb r0, [r3]
    strb r0, [r6]
    b .L_914
.L_904:
    ldr r1, _LIT8
    add r0, sp, #0x10
    mov r2, r6
    bl func_020a978c
.L_914:
    ldr r0, _LIT2
    mov r1, #0x11
    mov r2, #0x2
    bl func_02001d0c
    ldr r0, _LIT2
    mov r1, #0x8
    mov r2, #0x0
    bl func_02001d84
    ldr r0, _LIT3
    mov r3, #0x1
    str r3, [r0]
    mov r2, #0x2
    str r2, [sp]
    mov r2, #0xc
    str r2, [sp, #0x4]
    ldr r0, _LIT2
    add r1, sp, #0x30
    add r2, r4, #0x1000
    bl func_02005088
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT2
    add r2, r4, #0x1000
    add r1, sp, #0x10
    mov r3, #0x47
    bl func_02005088
    ldr r1, _LIT3
    ldr r0, _LIT0
    str r5, [r1]
    ldr r0, [r0, #0x6c]
    bl func_0201d4b4
    add r0, r0, #0x19c
    add r1, r0, #0x400
    ldr r0, _LIT2
    mov r2, #0xd1
    mov r3, #0x1
    bl func_02001e94
    b .L_a60
.L_9b4:
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    bl func_0202b8c0
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1, #0x6c]
    bl func_0201d4b4
    mov r7, r0
    add r1, r7, #0x19c
    mov r0, r5
    add r6, r1, #0x400
    bl func_0202d2dc
    ldr r2, _LIT9
    add r1, r7, #0x500
    strh r2, [r1, #0x9c]
    add r1, r2, #0x1
    strh r1, [r6, #0x2]
    add r1, r2, #0x2
    strh r1, [r6, #0x40]
    add r1, r2, #0x3
    strh r1, [r6, #0x42]
    ldr r0, _LIT2
    mov r1, #0xf
    mov r2, #0x2
    bl func_02001d0c
    mov r0, r5
    bl func_0202b854
    mov r3, #0x2
    mov r1, r0
    str r3, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT2
    add r2, r4, #0x1000
    bl func_02005088
    ldr r0, _LIT0
    ldr r0, [r0, #0x6c]
    bl func_0201d4b4
    add r1, r0, #0x5a0
    ldr r0, _LIT2
    mov r2, #0xd1
    mov r3, #0x1
    bl func_02001e94
.L_a60:
    ldr r0, _LIT0
    ldr r0, [r0, #0x6c]
    bl func_0201d4b4
    ldr r1, _LIT0
    add r8, r0, #0x500
    ldr r0, [r1, #0x4]
    add r1, sp, #0x8
    bl func_0202b360
    mov r7, #0x0
    ldr sl, _LIT10
    ldr r5, _LIT11
    mov r6, r7
    add r4, sp, #0x8
.L_a94:
    ldr r1, [r5, r6, lsl #0x2]
    mov r0, r1, asr #0x4
    add r0, r1, r0, lsr #0x1b
    mov r0, r0, asr #0x5
    ldr r2, [r4, r0, lsl #0x2]
    and r0, r1, #0x1f
    mov r0, r2, lsr r0
    tst r0, #0x1
    beq .L_b00
    add r0, r7, #0x6
    orr r0, sl, r0, lsl #0xc
    mov r2, r0, lsl #0x10
    mov r0, r7
    mov r9, r2, lsr #0x10
    bl func_0202d4a8
    add r7, r7, #0x1
    strh r9, [r8]
    add r0, r9, #0x1
    strh r0, [r8, #0x2]
    add r0, r9, #0x2
    strh r0, [r8, #0x40]
    add r0, r9, #0x3
    strh r0, [r8, #0x42]
    cmp r7, #0x6
    add r8, r8, #0x4
    add sl, sl, #0x4
    bge .L_b0c
.L_b00:
    add r6, r6, #0x1
    cmp r6, #0x22
    blt .L_a94
.L_b0c:
    cmp r7, #0x6
    addge sp, sp, #0x50
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r1, #0x0
.L_b1c:
    strh r1, [r8, #0x2]
    ldrh r0, [r8, #0x2]
    add r7, r7, #0x1
    cmp r7, #0x6
    strh r0, [r8]
    strh r1, [r8, #0x42]
    ldrh r0, [r8, #0x42]
    strh r0, [r8, #0x40]
    add r8, r8, #0x4
    blt .L_b1c
    add sp, sp, #0x50
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0219ad48
_LIT1: .word 0x00002107
_LIT2: .word data_02102c90
_LIT3: .word data_02102c7c
_LIT4: .word 0x0000ffff
_LIT5: .word data_020c6d44
_LIT6: .word data_020c6d50
_LIT7: .word data_020c6d58
_LIT8: .word data_020c6d64
_LIT9: .word 0x0000310b
_LIT10: .word 0x0000010f
_LIT11: .word data_020bead0
