; func_0202d504 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020be9dc
        .extern data_020c6c64
        .extern data_020c6c70
        .extern data_020c6c78
        .extern data_020c6c84
        .extern data_02102b9c
        .extern data_02102bb0
        .extern data_0219ac68
        .extern func_02001cec
        .extern func_02001d64
        .extern func_02001e74
        .extern func_0200506c
        .extern func_0201d460
        .extern func_0201d4dc
        .extern func_0202b30c
        .extern func_0202b7dc
        .extern func_0202b800
        .extern func_0202b83c
        .extern func_0202b86c
        .extern func_0202b8fc
        .extern func_0202b92c
        .extern func_0202d288
        .extern func_0202d370
        .extern func_0202d454
        .extern func_0202e1e0
        .extern func_02094410
        .extern func_020a9698
        .global func_0202d504
        .arm
func_0202d504:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x50
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    bl func_0202b83c
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x6c]
    bl func_0201d460
    mov r5, r0
    mov r0, r4
    add r4, r5, #0x580
    bl func_0202d370
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
    bl func_0201d4dc
    add r4, r0, #0xe60
    mov r0, #0x0
    add r1, r4, #0x1000
    mov r2, #0x280
    bl func_02094410
    ldr r0, _LIT2
    mov r1, #0xa
    mov r2, #0x2
    bl func_02001cec
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    bl func_0202b83c
    bl func_0202b7dc
    mov r3, #0x2
    mov r1, r0
    str r3, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT2
    add r2, r4, #0x1000
    bl func_0200506c
    ldr r0, _LIT0
    ldr r0, [r0, #0x6c]
    bl func_0201d460
    add r0, r0, #0x184
    add r1, r0, #0x400
    ldr r0, _LIT2
    mov r2, #0xf3
    mov r3, #0x1
    bl func_02001e74
    ldr r0, _LIT0
    ldr r0, [r0, #0x6c]
    bl func_0201d4dc
    add r4, r0, #0xa20
    mov r0, #0x0
    add r1, r4, #0x1000
    mov r2, #0x440
    bl func_02094410
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_280
    ldr r0, _LIT0
    ldr r1, _LIT3
    ldr r0, [r0, #0x4]
    ldr r5, [r1]
    bl func_0202b8fc
    ldr r1, _LIT0
    mov r7, r0
    ldr r0, [r1, #0x4]
    bl func_0202b92c
    ldr r1, _LIT4
    mov r6, r0
    cmp r7, r1
    bne .L_17c
    ldr r3, _LIT5
    add r7, sp, #0x30
    mov r2, #0x4
.L_150:
    ldrb r1, [r3]
    ldrb r0, [r3, #0x1]
    add r3, r3, #0x2
    strb r1, [r7]
    strb r0, [r7, #0x1]
    add r7, r7, #0x2
    subs r2, r2, #0x1
    bne .L_150
    ldrb r0, [r3]
    strb r0, [r7]
    b .L_18c
.L_17c:
    ldr r1, _LIT6
    add r0, sp, #0x30
    mov r2, r7
    bl func_020a9698
.L_18c:
    ldr r0, _LIT4
    cmp r6, r0
    bne .L_1d0
    ldr r3, _LIT7
    add r6, sp, #0x10
    mov r2, #0x4
.L_1a4:
    ldrb r1, [r3]
    ldrb r0, [r3, #0x1]
    add r3, r3, #0x2
    strb r1, [r6]
    strb r0, [r6, #0x1]
    add r6, r6, #0x2
    subs r2, r2, #0x1
    bne .L_1a4
    ldrb r0, [r3]
    strb r0, [r6]
    b .L_1e0
.L_1d0:
    ldr r1, _LIT8
    add r0, sp, #0x10
    mov r2, r6
    bl func_020a9698
.L_1e0:
    ldr r0, _LIT2
    mov r1, #0x11
    mov r2, #0x2
    bl func_02001cec
    ldr r0, _LIT2
    mov r1, #0x8
    mov r2, #0x0
    bl func_02001d64
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
    bl func_0200506c
    mov r0, #0x2
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT2
    add r2, r4, #0x1000
    add r1, sp, #0x10
    mov r3, #0x47
    bl func_0200506c
    ldr r1, _LIT3
    ldr r0, _LIT0
    str r5, [r1]
    ldr r0, [r0, #0x6c]
    bl func_0201d460
    add r0, r0, #0x19c
    add r1, r0, #0x400
    ldr r0, _LIT2
    mov r2, #0xd1
    mov r3, #0x1
    bl func_02001e74
    b .L_32c
.L_280:
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    bl func_0202b86c
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1, #0x6c]
    bl func_0201d460
    mov r7, r0
    add r1, r7, #0x19c
    mov r0, r5
    add r6, r1, #0x400
    bl func_0202d288
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
    bl func_02001cec
    mov r0, r5
    bl func_0202b800
    mov r3, #0x2
    mov r1, r0
    str r3, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT2
    add r2, r4, #0x1000
    bl func_0200506c
    ldr r0, _LIT0
    ldr r0, [r0, #0x6c]
    bl func_0201d460
    add r1, r0, #0x5a0
    ldr r0, _LIT2
    mov r2, #0xd1
    mov r3, #0x1
    bl func_02001e74
.L_32c:
    ldr r0, _LIT0
    ldr r0, [r0, #0x6c]
    bl func_0201d460
    ldr r1, _LIT0
    add r8, r0, #0x500
    ldr r0, [r1, #0x4]
    add r1, sp, #0x8
    bl func_0202b30c
    mov r7, #0x0
    ldr sl, _LIT10
    ldr r5, _LIT11
    mov r6, r7
    add r4, sp, #0x8
.L_360:
    ldr r1, [r5, r6, lsl #0x2]
    mov r0, r1, asr #0x4
    add r0, r1, r0, lsr #0x1b
    mov r0, r0, asr #0x5
    ldr r2, [r4, r0, lsl #0x2]
    and r0, r1, #0x1f
    mov r0, r2, lsr r0
    tst r0, #0x1
    beq .L_3cc
    add r0, r7, #0x6
    orr r0, sl, r0, lsl #0xc
    mov r2, r0, lsl #0x10
    mov r0, r7
    mov r9, r2, lsr #0x10
    bl func_0202d454
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
    bge .L_3d8
.L_3cc:
    add r6, r6, #0x1
    cmp r6, #0x22
    blt .L_360
.L_3d8:
    cmp r7, #0x6
    addge sp, sp, #0x50
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r1, #0x0
.L_3e8:
    strh r1, [r8, #0x2]
    ldrh r0, [r8, #0x2]
    add r7, r7, #0x1
    cmp r7, #0x6
    strh r0, [r8]
    strh r1, [r8, #0x42]
    ldrh r0, [r8, #0x42]
    strh r0, [r8, #0x40]
    add r8, r8, #0x4
    blt .L_3e8
    add sp, sp, #0x50
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_0219ac68
_LIT1: .word 0x00002107
_LIT2: .word data_02102bb0
_LIT3: .word data_02102b9c
_LIT4: .word 0x0000ffff
_LIT5: .word data_020c6c64
_LIT6: .word data_020c6c70
_LIT7: .word data_020c6c78
_LIT8: .word data_020c6c84
_LIT9: .word 0x0000310b
_LIT10: .word 0x0000010f
_LIT11: .word data_020be9dc
