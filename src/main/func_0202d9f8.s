; func_0202d9f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c6d6c
        .extern data_020c6d70
        .extern data_0219ad48
        .extern data_0219ad78
        .extern func_02001d0c
        .extern func_02001e5c
        .extern func_02001e94
        .extern func_02005088
        .extern func_0201d4b4
        .extern func_0201d530
        .extern func_0202b294
        .extern func_0202b7cc
        .extern func_0202b7ec
        .extern func_0202b80c
        .extern func_0202b878
        .extern func_0202b8d8
        .extern func_0202c730
        .extern func_0202c770
        .extern func_0202d1d8
        .extern func_0202e234
        .extern func_02034784
        .extern func_02034810
        .extern func_020a978c
        .global func_0202d9f8
        .arm
func_0202d9f8:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x48
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x48
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    bl func_02034784
    cmp r0, #0x0
    beq .L_c3c
    ldr r0, _LIT0
    ldr r0, [r0, #0x68]
    bl func_0201d4b4
    mov r4, r0
    bl func_02034810
    mov r0, r0, lsl #0x2
    add r0, r0, #0x1
    orr r1, r0, #0x5000
    strh r1, [r4, #0x3c]
    add r0, r1, #0x1
    strh r0, [r4, #0x3e]
    add r0, r1, #0x2
    strh r0, [r4, #0x7c]
    add r0, r1, #0x3
    strh r0, [r4, #0x7e]
.L_c3c:
    ldr r0, _LIT0
    ldr r1, [r0, #0x24]
    ldr r0, [r0, #0x68]
    cmp r1, #0x0
    bne .L_cfc
    bl func_0202c730
    cmp r0, #0x0
    beq .L_ca8
    ldr r1, _LIT1
    ldr r0, _LIT0
    ldr r1, [r1]
    ldr r0, [r0, #0x68]
    and r5, r1, #0x1f00
    bl func_0202c770
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x6c]
    bl func_0202c770
    ldr r1, _LIT1
    mvn r2, r0
    ldr r0, [r1]
    and r2, r2, r5, lsr #0x8
    orr r2, r4, r2
    bic r0, r0, #0x1f00
    orr r0, r0, r2, lsl #0x8
    str r0, [r1]
    b .L_cf0
.L_ca8:
    ldr r0, _LIT0
    mov r1, #0x4000000
    ldr r1, [r1]
    ldr r0, [r0, #0x68]
    and r5, r1, #0x1f00
    bl func_0202c770
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x6c]
    bl func_0202c770
    mov r1, #0x4000000
    mvn r2, r0
    ldr r0, [r1]
    and r2, r2, r5, lsr #0x8
    orr r2, r4, r2
    bic r0, r0, #0x1f00
    orr r0, r0, r2, lsl #0x8
    str r0, [r1]
.L_cf0:
    add sp, sp, #0x48
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_cfc:
    bl func_0202c730
    cmp r0, #0x0
    beq .L_d50
    ldr r1, _LIT1
    ldr r0, _LIT0
    ldr r1, [r1]
    ldr r0, [r0, #0x68]
    and r5, r1, #0x1f00
    bl func_0202c770
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x6c]
    bl func_0202c770
    ldr r1, _LIT1
    orr r2, r4, r0
    ldr r0, [r1]
    orr r2, r2, r5, lsr #0x8
    bic r0, r0, #0x1f00
    orr r0, r0, r2, lsl #0x8
    str r0, [r1]
    b .L_d94
.L_d50:
    ldr r0, _LIT0
    mov r1, #0x4000000
    ldr r1, [r1]
    ldr r0, [r0, #0x68]
    and r5, r1, #0x1f00
    bl func_0202c770
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x6c]
    bl func_0202c770
    mov r2, #0x4000000
    ldr r1, [r2]
    orr r0, r4, r0
    orr r3, r0, r5, lsr #0x8
    bic r0, r1, #0x1f00
    orr r0, r0, r3, lsl #0x8
    str r0, [r2]
.L_d94:
    ldr r1, _LIT0
    ldr r0, [r1, #0xc]
    ldr r2, [r1, #0x8]
    cmp r2, r0
    ble .L_e3c
    ldr r1, [r1, #0x10]
    mov r6, #0x0
    cmp r1, r2
    movle r2, r1
    sub r1, r2, r0
    adds r2, r1, #0x7
    movmi r2, #0x0
    mov r1, r2, asr #0x2
    add r1, r2, r1, lsr #0x1d
    mov r1, r1, asr #0x3
    ldr r4, _LIT0
    mov r9, r6
    add r8, r1, #0x11
    mov r5, r6
.L_de0:
    mov r1, r0, asr #0x2
    add r1, r0, r1, lsr #0x1d
    mov r1, r1, asr #0x3
    mov r7, r5
    cmp r1, #0x0
    ble .L_e28
.L_df8:
    ldr r0, [r4, #0x68]
    bl func_0201d4b4
    add r2, r7, r8
    mov r1, r7, lsl #0x1
    add r0, r0, r9, lsl #0x1
    strh r2, [r1, r0]
    ldr r0, [r4, #0xc]
    add r7, r7, #0x1
    mov r1, r0, asr #0x2
    add r1, r0, r1, lsr #0x1d
    cmp r7, r1, asr #0x3
    blt .L_df8
.L_e28:
    add r6, r6, #0x1
    cmp r6, #0x3
    add r8, r8, #0x40
    add r9, r9, #0x20
    blt .L_de0
.L_e3c:
    ldr r0, _LIT0
    ldr r0, [r0, #0x6c]
    bl func_0201d530
    ldr r1, _LIT0
    add r4, r0, #0x4e0
    ldr r0, [r1, #0x14]
    cmp r0, #0x1
    beq .L_e70
    cmp r0, #0x2
    beq .L_e7c
    cmp r0, #0x3
    beq .L_fdc
    b .L_1040
.L_e70:
    add r0, r0, #0x1
    str r0, [r1, #0x14]
    b .L_1040
.L_e7c:
    ldr r0, [r1, #0x18]
    cmp r0, #0x0
    ldrne r5, [r1, #0x58]
    mov r1, #0x13
    ldrnesb r0, [r5]
    cmpne r0, #0x0
    beq .L_ec4
    ldr r0, _LIT2
    mov r2, r1
    bl func_02001d0c
    ldr r0, _LIT0
    mov r1, #0x4
    str r1, [r0, #0x3c]
    ldr r1, [r0, #0x50]
    orr r1, r1, #0x800000
    str r1, [r0, #0x50]
    str r5, [r0, #0x58]
    b .L_fa4
.L_ec4:
    ldr r0, _LIT2
    mov r2, r1
    bl func_02001d0c
    ldr r0, _LIT0
    mov r1, #0x4
    str r1, [r0, #0x3c]
    ldr r0, [r0, #0x4]
    bl func_0202e234
    cmp r0, #0x0
    beq .L_f84
    ldr r0, _LIT0
    ldr r0, [r0, #0x4]
    bl func_0202b878
    ldr r1, _LIT0
    mov r5, r0
    ldr r0, [r1, #0x4]
    bl func_0202b8d8
    cmp r5, #0x0
    mov r7, r0
    ldreq r8, _LIT3
    beq .L_f24
    mov r0, r5
    bl func_0202b7ec
    mov r8, r0
.L_f24:
    ldr r0, _LIT4
    bl func_0202b7cc
    mov r6, r0
    mov r0, r7
    bl func_0202b80c
    mov r5, r0
    ldr r0, _LIT5
    bl func_0202b7cc
    str r5, [sp]
    str r0, [sp, #0x4]
    ldr r1, _LIT6
    mov r2, r6
    mov r3, r8
    add r0, sp, #0x8
    bl func_020a978c
    mov r0, #0x4
    str r0, [sp]
    mov r0, #0xc
    str r0, [sp, #0x4]
    ldr r0, _LIT2
    add r2, r4, #0x2000
    add r1, sp, #0x8
    mov r3, #0x2
    bl func_02005088
.L_f84:
    ldr r0, _LIT0
    ldr r1, [r0, #0x50]
    orr r1, r1, #0x800000
    str r1, [r0, #0x50]
    ldr r0, [r0, #0x4]
    bl func_0202b294
    ldr r1, _LIT0
    str r0, [r1, #0x58]
.L_fa4:
    ldr r0, _LIT0
    ldr r0, [r0, #0x6c]
    bl func_0201d4b4
    mov r1, r0
    ldr r0, _LIT2
    ldr r2, _LIT7
    add r1, r1, #0xd8
    mov r3, #0x1
    bl func_02001e94
    ldr r0, _LIT0
    ldr r1, [r0, #0x14]
    add r1, r1, #0x1
    str r1, [r0, #0x14]
    b .L_1040
.L_fdc:
    ldr r2, [r1, #0x3c]
    mov r0, #0xc
    str r2, [sp]
    str r0, [sp, #0x4]
    ldr r1, [r1, #0x58]
    ldr r0, _LIT2
    add r2, r4, #0x2000
    mov r3, #0x2
    bl func_02005088
    ldr r0, _LIT2
    bl func_02001e5c
    cmp r0, #0x0
    beq .L_1020
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x14]
    b .L_1040
.L_1020:
    ldr r0, _LIT0
    ldr r1, [r0, #0x3c]
    cmp r1, #0x8c
    bls .L_1040
    mov r1, #0x1
    str r1, [r0, #0x18]
    mov r1, #0x0
    str r1, [r0, #0x14]
.L_1040:
    ldr r0, _LIT0
    ldr r0, [r0, #0x18]
    bl func_0202d1d8
    mov r0, #0x1
    add sp, sp, #0x48
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_0219ad48
_LIT1: .word 0x04001000
_LIT2: .word data_0219ad78
_LIT3: .word data_020c6d6c
_LIT4: .word 0x0000020d
_LIT5: .word 0x0000020e
_LIT6: .word data_020c6d70
_LIT7: .word 0x00000127
