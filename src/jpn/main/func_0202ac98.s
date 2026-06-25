; func_0202ac98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0202ac98
        .arm
func_0202ac98:
    ldrsh r1, [r0, #0xdc]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_20c
    b .L_130
    b .L_168
    b .L_1a0
    b .L_1d8
.L_130:
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
    b .L_20c
.L_168:
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
    b .L_20c
.L_1a0:
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
    b .L_20c
.L_1d8:
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
.L_20c:
    mov r0, #0x1
    bx lr
_LIT0: .word 0x04000048
_LIT1: .word 0x04001048
