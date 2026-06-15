; func_0202acec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202acec
        .arm
func_0202acec:
    ldrsh r1, [r0, #0xdc]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_ac8
    b .L_9ec
    b .L_a24
    b .L_a5c
    b .L_a94
.L_9ec:
    ldr r3, _LIT0
    ldrh r1, [r0, #0xde]
    ldrh r2, [r3]
    bic r2, r2, #0x3f
    orr r1, r2, r1
    orr r1, r1, #0x20
    strh r1, [r3]
    ldrh r1, [r3, #0x2]
    ldrh r0, [r0, #0xe0]
    bic r1, r1, #0x3f
    orr r0, r1, r0
    orr r0, r0, #0x20
    strh r0, [r3, #0x2]
    b .L_ac8
.L_a24:
    ldr r3, _LIT0
    ldrh r1, [r0, #0xde]
    ldrh r2, [r3]
    bic r2, r2, #0x3f00
    orr r1, r2, r1, lsl #0x8
    orr r1, r1, #0x2000
    strh r1, [r3]
    ldrh r1, [r3, #0x2]
    ldrh r0, [r0, #0xe0]
    bic r1, r1, #0x3f
    orr r0, r1, r0
    orr r0, r0, #0x20
    strh r0, [r3, #0x2]
    b .L_ac8
.L_a5c:
    ldr r3, _LIT1
    ldrh r1, [r0, #0xde]
    ldrh r2, [r3]
    bic r2, r2, #0x3f
    orr r1, r2, r1
    orr r1, r1, #0x20
    strh r1, [r3]
    ldrh r1, [r3, #0x2]
    ldrh r0, [r0, #0xe0]
    bic r1, r1, #0x3f
    orr r0, r1, r0
    orr r0, r0, #0x20
    strh r0, [r3, #0x2]
    b .L_ac8
.L_a94:
    ldr r3, _LIT1
    ldrh r1, [r0, #0xde]
    ldrh r2, [r3]
    bic r2, r2, #0x3f00
    orr r1, r2, r1, lsl #0x8
    orr r1, r1, #0x2000
    strh r1, [r3]
    ldrh r1, [r3, #0x2]
    ldrh r0, [r0, #0xe0]
    bic r1, r1, #0x3f
    orr r0, r1, r0
    orr r0, r0, #0x20
    strh r0, [r3, #0x2]
.L_ac8:
    mov r0, #0x1
    bx lr
_LIT0: .word 0x04000048
_LIT1: .word 0x04001048
