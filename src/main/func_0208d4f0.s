; func_0208d4f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6304
        .extern func_0208dce4
        .global func_0208d4f0
        .arm
func_0208d4f0:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mvn ip, r0
    ldrh r2, [r1, #0x8]
    ldrh r3, [r1]
    cmp r0, #0x0
    strh r0, [r1, #0x8]
    orr r2, r3, r2
    and r2, ip, r2
    strh r2, [r1]
    bne .L_334
    ldr r2, _LIT1
    ldr r0, _LIT2
    ldrh r1, [r2]
    and r0, r1, r0
    strh r0, [r2]
    b .L_4bc
.L_334:
    ldr r2, _LIT1
    cmp r0, #0xf
    ldrh r1, [r2]
    bic r1, r1, #0x3000
    orr r1, r1, #0x1
    strh r1, [r2]
    addls pc, pc, r0, lsl #0x2
    b .L_4bc
    b .L_4bc
    b .L_4b0
    b .L_47c
    b .L_4a4
    b .L_454
    b .L_394
    b .L_470
    b .L_498
    b .L_438
    b .L_3b0
    b .L_3cc
    b .L_3e8
    b .L_448
    b .L_410
    b .L_464
    b .L_48c
.L_394:
    ldr r1, _LIT3
    mov r2, #0x83
    ldr r0, _LIT4
    strb r2, [r1]
    mov r1, #0x8b
    strb r1, [r0]
    b .L_4bc
.L_3b0:
    ldr r1, _LIT3
    mov r2, #0x83
    ldr r0, _LIT5
    strb r2, [r1]
    mov r1, #0x8b
    strb r1, [r0]
    b .L_4bc
.L_3cc:
    ldr r1, _LIT6
    mov r2, #0x83
    ldr r0, _LIT5
    strb r2, [r1]
    mov r1, #0x8b
    strb r1, [r0]
    b .L_4bc
.L_3e8:
    ldr r0, _LIT3
    mov r2, #0x83
    ldr r1, _LIT6
    strb r2, [r0]
    mov r2, #0x8b
    ldr r0, _LIT5
    strb r2, [r1]
    mov r1, #0x93
    strb r1, [r0]
    b .L_4bc
.L_410:
    ldr r0, _LIT3
    mov r2, #0x83
    ldr r1, _LIT4
    strb r2, [r0]
    mov r2, #0x8b
    ldr r0, _LIT5
    strb r2, [r1]
    mov r1, #0x93
    strb r1, [r0]
    b .L_4bc
.L_438:
    ldr r0, _LIT5
    mov r1, #0x83
    strb r1, [r0]
    b .L_4bc
.L_448:
    ldr r0, _LIT5
    mov r1, #0x8b
    strb r1, [r0]
.L_454:
    ldr r0, _LIT4
    mov r1, #0x83
    strb r1, [r0]
    b .L_4bc
.L_464:
    ldr r0, _LIT5
    mov r1, #0x93
    strb r1, [r0]
.L_470:
    ldr r0, _LIT4
    mov r1, #0x8b
    strb r1, [r0]
.L_47c:
    ldr r0, _LIT6
    mov r1, #0x83
    strb r1, [r0]
    b .L_4bc
.L_48c:
    ldr r0, _LIT5
    mov r1, #0x9b
    strb r1, [r0]
.L_498:
    ldr r0, _LIT4
    mov r1, #0x93
    strb r1, [r0]
.L_4a4:
    ldr r0, _LIT6
    mov r1, #0x8b
    strb r1, [r0]
.L_4b0:
    ldr r0, _LIT3
    mov r1, #0x83
    strb r1, [r0]
.L_4bc:
    ldr r0, _LIT0
    ldrh r0, [r0]
    bl func_0208dce4
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a6304
_LIT1: .word 0x04000060
_LIT2: .word 0x0000cffe
_LIT3: .word 0x04000240
_LIT4: .word 0x04000242
_LIT5: .word 0x04000243
_LIT6: .word 0x04000241
