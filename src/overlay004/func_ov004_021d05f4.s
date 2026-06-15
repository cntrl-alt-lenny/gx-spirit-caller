; func_ov004_021d05f4 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b500
        .extern func_0208e2f4
        .global func_ov004_021d05f4
        .arm
func_ov004_021d05f4:
    stmdb sp!, {r3, lr}
    cmp r0, #0x0
    ldr r0, _LIT0
    beq .L_290
    ldr r2, _LIT1
    add r0, r0, #0x3000
    ldrh r1, [r2]
    bic r1, r1, #0x3f
    orr r1, r1, #0x3f
    strh r1, [r2]
    ldrh r1, [r2, #0x2]
    bic r1, r1, #0x3f
    orr r1, r1, #0x1f
    strh r1, [r2, #0x2]
    ldr r0, [r0, #0xc84]
    ldr r1, _LIT2
    cmp r0, #0x0
    movne r0, #0x4c
    strneh r1, [r2, #-8]
    strneh r0, [r2, #-4]
    bne .L_268
    ldr r0, _LIT3
    strh r1, [r2, #-8]
    strh r0, [r2, #-4]
.L_268:
    ldr r3, _LIT4
    mov r1, #0x6
    ldr r2, [r3]
    add r0, r3, #0x50
    bic r2, r2, #0xe000
    orr ip, r2, #0x2000
    sub r2, r1, #0xe
    str ip, [r3]
    bl func_0208e2f4
    ldmia sp!, {r3, pc}
.L_290:
    ldr r2, _LIT4
    mov r0, #0x0
    ldr r1, [r2]
    bic r1, r1, #0xe000
    str r1, [r2]
    strh r0, [r2, #0x50]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word 0x04001048
_LIT2: .word 0x000001ff
_LIT3: .word 0x000064c0
_LIT4: .word 0x04001000
