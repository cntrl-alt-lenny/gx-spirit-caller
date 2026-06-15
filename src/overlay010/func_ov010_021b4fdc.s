; func_ov010_021b4fdc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov010_021b8d44
        .extern data_ov010_021b91b4
        .extern data_ov010_021b9260
        .extern func_0208e318
        .extern func_020b3870
        .global func_ov010_021b4fdc
        .arm
func_ov010_021b4fdc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r1, _LIT0
    ldr r4, _LIT1
    ldr r2, [r1, #0xb4]
    subs r0, r2, r0
    str r0, [r1, #0xb4]
    movmi r0, #0x0
    strmi r0, [r4, #0x8]
    ldr r6, [r4, #0xc]
    ldr r7, [r4, #0x8]
    mov r1, r6
    sub r0, r6, r7
    rsb r0, r0, r0, lsl #0x4
    bl func_020b3870
    mov r5, r0
    mov r1, r6
    mov r0, r7, lsl #0x4
    bl func_020b3870
    mov r6, r0
    ldr r2, _LIT2
    mov r3, r6
    ldrh r1, [r2]
    rsb r7, r6, #0x10
    add r0, r2, #0x48
    orr r1, r1, #0x40
    strh r1, [r2]
    mov r1, #0x11
    mov r2, #0x8
    str r7, [sp]
    bl func_0208e318
    ldr lr, _LIT3
    mov r1, #0x6
    ldrh r3, [lr]
    add r0, lr, #0x46
    mov r2, #0x8
    orr r3, r3, #0x40
    strh r3, [lr]
    ldrh ip, [lr, #0x2]
    mov r3, r6
    orr ip, ip, #0x40
    strh ip, [lr, #0x2]
    str r7, [sp]
    bl func_0208e318
    ldr r0, [r4, #0x220]
    mov r1, r0, lsl #0x19
    movs r1, r1, lsr #0x1f
    bne .L_948
    mov r0, r0, lsl #0x1a
    movs r0, r0, lsr #0x1f
    bne .L_948
    ldr r0, _LIT4
    mov r1, #0x0
    str r1, [r0, #0x60]
    b .L_974
.L_948:
    mov r2, #0x4000000
    ldr r1, [r2]
    ldr r0, _LIT4
    and r1, r1, #0x1f00
    str r6, [r0, #0x60]
    ldr r0, [r2]
    mov r3, r1, lsr #0x8
    bic r1, r0, #0x1f00
    bic r0, r3, #0x1
    orr r0, r1, r0, lsl #0x8
    str r0, [r2]
.L_974:
    ldr r0, [r4, #0x8]
    mov r0, r0, asr #0xc
    tst r0, #0x1
    ldr r0, _LIT5
    bne .L_9a8
    and r2, r5, #0xff
    strb r2, [r0]
    strb r2, [r0, #0x1]
    sub r1, r0, #0x1000
    ldr r0, _LIT6
    strb r2, [r1]
    strb r2, [r0]
    b .L_9c8
.L_9a8:
    mov r1, r5, lsl #0x4
    and r2, r1, #0xff
    strb r2, [r0]
    strb r2, [r0, #0x1]
    sub r1, r0, #0x1000
    ldr r0, _LIT6
    strb r2, [r1]
    strb r2, [r0]
.L_9c8:
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    mov r0, #0x0
    streq r0, [r4, #0xc]
    moveq r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov010_021b91b4
_LIT1: .word data_ov010_021b9260
_LIT2: .word 0x04001008
_LIT3: .word 0x0400000a
_LIT4: .word data_ov010_021b8d44
_LIT5: .word 0x0400104c
_LIT6: .word 0x0400004d
