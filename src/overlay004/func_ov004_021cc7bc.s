; func_ov004_021cc7bc - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104c7a
        .extern data_02104c94
        .extern data_02104dac
        .extern data_02104f4c
        .extern data_02105989
        .extern data_ov004_0220b500
        .extern data_ov004_022915e8
        .extern func_0201d114
        .extern func_0202b9ec
        .extern func_0202c0c0
        .extern func_02037208
        .extern func_020aadf8
        .extern func_ov004_021cc74c
        .extern func_ov004_021d8798
        .global func_ov004_021cc7bc
        .arm
func_ov004_021cc7bc:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x20
    add r1, sp, #0x0
    mov r5, r0
    ldr r4, _LIT0
    bl func_ov004_021cc74c
    ldr r0, [sp]
    cmp r0, #0xfa0
    bcc .L_7c
    bl func_0202b9ec
    cmp r0, #0x3
    bge .L_60
    ldr r0, [sp]
    ldr r1, _LIT1
    strh r0, [r1, #0x60]
    bl func_0202b9ec
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
    bl func_02037208
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
    bl func_020aadf8
    ldr r0, _LIT5
    ldr r1, _LIT6
    bl func_020aadf8
    mov r1, #0x1
    mov r0, r5
    str r1, [r4, #0x44]
    bl func_0201d114
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
    bl func_020aadf8
    ldr r0, _LIT5
    ldr r1, _LIT6
    bl func_020aadf8
    mov r1, #0x0
    mov r0, r5
    str r1, [r4, #0x44]
    bl func_0201d114
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
    bl func_0202c0c0
    mov r1, r0
    ldr r0, _LIT8
    mov r2, #0x0
    bl func_ov004_021d8798
.L_180:
    mov r0, #0x3a
    sub r1, r0, #0x3b
    mov r2, #0x0
    mov r3, #0x1
    bl func_02037208
    add sp, sp, #0x20
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word data_02104dac
_LIT2: .word data_021040ac
_LIT3: .word data_02104f4c
_LIT4: .word data_02104c7a
_LIT5: .word data_02104c94
_LIT6: .word data_02105989
_LIT7: .word 0x66666667
_LIT8: .word data_ov004_022915e8
