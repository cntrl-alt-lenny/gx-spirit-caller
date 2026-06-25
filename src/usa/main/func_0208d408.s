; func_0208d408 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6224
        .extern func_0208dbfc
        .global func_0208d408
        .arm
func_0208d408:
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
    bne .L_48
    ldr r2, _LIT1
    ldr r0, _LIT2
    ldrh r1, [r2]
    and r0, r1, r0
    strh r0, [r2]
    b .L_1d0
.L_48:
    ldr r2, _LIT1
    cmp r0, #0xf
    ldrh r1, [r2]
    bic r1, r1, #0x3000
    orr r1, r1, #0x1
    strh r1, [r2]
    addls pc, pc, r0, lsl #0x2
    b .L_1d0
    b .L_1d0
    b .L_1c4
    b .L_190
    b .L_1b8
    b .L_168
    b .L_a8
    b .L_184
    b .L_1ac
    b .L_14c
    b .L_c4
    b .L_e0
    b .L_fc
    b .L_15c
    b .L_124
    b .L_178
    b .L_1a0
.L_a8:
    ldr r1, _LIT3
    mov r2, #0x83
    ldr r0, _LIT4
    strb r2, [r1]
    mov r1, #0x8b
    strb r1, [r0]
    b .L_1d0
.L_c4:
    ldr r1, _LIT3
    mov r2, #0x83
    ldr r0, _LIT5
    strb r2, [r1]
    mov r1, #0x8b
    strb r1, [r0]
    b .L_1d0
.L_e0:
    ldr r1, _LIT6
    mov r2, #0x83
    ldr r0, _LIT5
    strb r2, [r1]
    mov r1, #0x8b
    strb r1, [r0]
    b .L_1d0
.L_fc:
    ldr r0, _LIT3
    mov r2, #0x83
    ldr r1, _LIT6
    strb r2, [r0]
    mov r2, #0x8b
    ldr r0, _LIT5
    strb r2, [r1]
    mov r1, #0x93
    strb r1, [r0]
    b .L_1d0
.L_124:
    ldr r0, _LIT3
    mov r2, #0x83
    ldr r1, _LIT4
    strb r2, [r0]
    mov r2, #0x8b
    ldr r0, _LIT5
    strb r2, [r1]
    mov r1, #0x93
    strb r1, [r0]
    b .L_1d0
.L_14c:
    ldr r0, _LIT5
    mov r1, #0x83
    strb r1, [r0]
    b .L_1d0
.L_15c:
    ldr r0, _LIT5
    mov r1, #0x8b
    strb r1, [r0]
.L_168:
    ldr r0, _LIT4
    mov r1, #0x83
    strb r1, [r0]
    b .L_1d0
.L_178:
    ldr r0, _LIT5
    mov r1, #0x93
    strb r1, [r0]
.L_184:
    ldr r0, _LIT4
    mov r1, #0x8b
    strb r1, [r0]
.L_190:
    ldr r0, _LIT6
    mov r1, #0x83
    strb r1, [r0]
    b .L_1d0
.L_1a0:
    ldr r0, _LIT5
    mov r1, #0x9b
    strb r1, [r0]
.L_1ac:
    ldr r0, _LIT4
    mov r1, #0x93
    strb r1, [r0]
.L_1b8:
    ldr r0, _LIT6
    mov r1, #0x8b
    strb r1, [r0]
.L_1c4:
    ldr r0, _LIT3
    mov r1, #0x83
    strb r1, [r0]
.L_1d0:
    ldr r0, _LIT0
    ldrh r0, [r0]
    bl func_0208dbfc
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a6224
_LIT1: .word 0x04000060
_LIT2: .word 0x0000cffe
_LIT3: .word 0x04000240
_LIT4: .word 0x04000242
_LIT5: .word 0x04000243
_LIT6: .word 0x04000241
