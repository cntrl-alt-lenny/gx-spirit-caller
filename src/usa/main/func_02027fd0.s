; func_02027fd0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02027fd0
        .arm
func_02027fd0:
    ldrsh r1, [r0, #0xd4]
    ldrsh r0, [r0, #0xd6]
    cmp r1, #0x7
    addls pc, pc, r1, lsl #0x2
    b .L_230
    b .L_174
    b .L_18c
    b .L_1a4
    b .L_1bc
    b .L_1d4
    b .L_1ec
    b .L_204
    b .L_21c
.L_174:
    ldr r2, _LIT0
    ldrh r1, [r2]
    bic r1, r1, #0x3
    orr r0, r1, r0
    strh r0, [r2]
    b .L_230
.L_18c:
    ldr r2, _LIT1
    ldrh r1, [r2]
    bic r1, r1, #0x3
    orr r0, r1, r0
    strh r0, [r2]
    b .L_230
.L_1a4:
    ldr r2, _LIT2
    ldrh r1, [r2]
    bic r1, r1, #0x3
    orr r0, r1, r0
    strh r0, [r2]
    b .L_230
.L_1bc:
    ldr r2, _LIT3
    ldrh r1, [r2]
    bic r1, r1, #0x3
    orr r0, r1, r0
    strh r0, [r2]
    b .L_230
.L_1d4:
    ldr r2, _LIT4
    ldrh r1, [r2]
    bic r1, r1, #0x3
    orr r0, r1, r0
    strh r0, [r2]
    b .L_230
.L_1ec:
    ldr r2, _LIT5
    ldrh r1, [r2]
    bic r1, r1, #0x3
    orr r0, r1, r0
    strh r0, [r2]
    b .L_230
.L_204:
    ldr r2, _LIT6
    ldrh r1, [r2]
    bic r1, r1, #0x3
    orr r0, r1, r0
    strh r0, [r2]
    b .L_230
.L_21c:
    ldr r2, _LIT7
    ldrh r1, [r2]
    bic r1, r1, #0x3
    orr r0, r1, r0
    strh r0, [r2]
.L_230:
    mov r0, #0x1
    bx lr
_LIT0: .word 0x04000008
_LIT1: .word 0x0400000a
_LIT2: .word 0x0400000c
_LIT3: .word 0x0400000e
_LIT4: .word 0x04001008
_LIT5: .word 0x0400100a
_LIT6: .word 0x0400100c
_LIT7: .word 0x0400100e
