; func_ov004_021cc6dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_02104b9a
        .extern data_02104bb4
        .extern data_02104ccc
        .extern data_02104e6c
        .extern data_021058a9
        .extern data_ov004_0220b2a0
        .extern data_ov004_02291388
        .extern func_0201d0c0
        .extern func_0202b998
        .extern func_0202c06c
        .extern func_020371b8
        .extern func_020aad04
        .extern func_ov004_021cc66c
        .extern func_ov004_021d86ac
        .global func_ov004_021cc6dc
        .arm
func_ov004_021cc6dc:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x20
    add r1, sp, #0x0
    mov r5, r0
    ldr r4, _LIT0
    bl func_ov004_021cc66c
    ldr r0, [sp]
    cmp r0, #0xfa0
    bcc .L_7c
    bl func_0202b998
    cmp r0, #0x3
    bge .L_60
    ldr r0, [sp]
    ldr r1, _LIT1
    strh r0, [r1, #0x60]
    bl func_0202b998
    ldr r1, _LIT2
    rsb r0, r0, #0x3
    str r0, [r1, #0xd54]
    mov r1, #0x4
    mov r0, #0x17
    str r1, [r4, #0x48]
    str r0, [r4, #0x54]
    b .L_180
.L_60:
    mov r0, #0x43
    sub r1, r0, #0x44
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, pc}
.L_7c:
    add r0, r4, r5, lsl #0x2
    ldr r0, [r0, #0x20c]
    cmp r0, #0x0
    beq .L_dc
    add ip, sp, #0x0
    ldrsb r3, [ip, #0x4]
    ldr r2, _LIT2
    ldr r1, _LIT3
    strb r3, [r2, #0xbcc]
    ldrb r3, [r1, #0xa3c]
    ldr r0, _LIT4
    add r1, ip, #0x6
    mov r3, r3, lsl #0x1d
    mov r3, r3, lsr #0x1d
    strb r3, [r2, #0xbcd]
    bl func_020aad04
    ldr r0, _LIT5
    ldr r1, _LIT6
    bl func_020aad04
    mov r1, #0x1
    mov r0, r5
    str r1, [r4, #0x44]
    bl func_0201d0c0
    b .L_124
.L_dc:
    ldrsb r1, [sp, #0x8]
    ldr r2, _LIT2
    ldr r0, _LIT3
    strb r1, [r2, #0xbcc]
    ldrb r3, [r0, #0xa3c]
    ldr r0, _LIT4
    add r1, sp, #0x9
    mov r3, r3, lsl #0x1d
    mov r3, r3, lsr #0x1d
    strb r3, [r2, #0xbcd]
    bl func_020aad04
    ldr r0, _LIT5
    ldr r1, _LIT6
    bl func_020aad04
    mov r1, #0x0
    mov r0, r5
    str r1, [r4, #0x44]
    bl func_0201d0c0
.L_124:
    ldr r2, _LIT7
    mov r0, r5, lsr #0x1f
    smull r1, r3, r2, r5
    add r3, r0, r3, asr #0x1
    mov r2, #0x5
    smull r0, r1, r2, r3
    sub r3, r5, r0
    str r5, [r4, #0x88]
    add r0, r4, r3, lsl #0x5
    mov r1, #0x3
    str r1, [r0, #0xb8]
    mov r2, #0x0
    mov r1, #0x2
    mov r0, #0xd5
    str r2, [r4, #0x74]
    str r2, [r4, #0x7c]
    str r2, [r4, #0x78]
    str r1, [r4, #0x54]
    bl func_0202c06c
    mov r1, r0
    ldr r0, _LIT8
    mov r2, #0x0
    bl func_ov004_021d86ac
.L_180:
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_020371b8
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word data_02104ccc
_LIT2: .word data_02103fcc
_LIT3: .word data_02104e6c
_LIT4: .word data_02104b9a
_LIT5: .word data_02104bb4
_LIT6: .word data_021058a9
_LIT7: .word 0x66666667
_LIT8: .word data_ov004_02291388
