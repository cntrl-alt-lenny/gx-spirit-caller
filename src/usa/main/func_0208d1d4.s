; func_0208d1d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6224
        .extern func_0208dbfc
        .global func_0208d1d4
        .arm
func_0208d1d4:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mvn ip, r0
    ldrh r2, [r1, #0xc]
    ldrh r3, [r1]
    cmp r0, #0xc
    strh r0, [r1, #0xc]
    orr r2, r3, r2
    and r2, ip, r2
    strh r2, [r1]
    addls pc, pc, r0, lsl #0x2
    b .L_110
    b .L_c0
    b .L_d4
    b .L_74
    b .L_68
    b .L_f4
    b .L_110
    b .L_110
    b .L_110
    b .L_a0
    b .L_110
    b .L_110
    b .L_110
    b .L_94
.L_68:
    ldr r0, _LIT1
    mov r1, #0x93
    strb r1, [r0]
.L_74:
    ldr r0, _LIT2
    mov r2, #0x9b
    ldr r1, _LIT3
    strb r2, [r0]
    ldrh r0, [r1]
    orr r0, r0, #0x4000
    strh r0, [r1]
    b .L_110
.L_94:
    ldr r0, _LIT4
    mov r1, #0x93
    strb r1, [r0]
.L_a0:
    ldr r0, _LIT5
    mov r2, #0x9b
    ldr r1, _LIT3
    strb r2, [r0]
    ldrh r0, [r1]
    orr r0, r0, #0x4000
    strh r0, [r1]
    b .L_110
.L_c0:
    ldr r1, _LIT3
    ldrh r0, [r1]
    bic r0, r0, #0x4000
    strh r0, [r1]
    b .L_110
.L_d4:
    ldr r0, _LIT1
    mov r2, #0x9b
    ldr r1, _LIT3
    strb r2, [r0]
    ldrh r0, [r1]
    orr r0, r0, #0x4000
    strh r0, [r1]
    b .L_110
.L_f4:
    ldr r0, _LIT4
    mov r2, #0x9b
    ldr r1, _LIT3
    strb r2, [r0]
    ldrh r0, [r1]
    orr r0, r0, #0x4000
    strh r0, [r1]
.L_110:
    ldr r0, _LIT0
    ldrh r0, [r0]
    bl func_0208dbfc
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a6224
_LIT1: .word 0x04000240
_LIT2: .word 0x04000241
_LIT3: .word 0x04000060
_LIT4: .word 0x04000242
_LIT5: .word 0x04000243
