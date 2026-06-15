; func_ov000_021ae394 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021b56b4
        .extern data_ov000_021c758c
        .global func_ov000_021ae394
        .arm
func_ov000_021ae394:
    stmdb sp!, {r4, r5, r6, lr}
    ldr lr, _LIT0
    ldr r6, _LIT1
    ldr r4, [lr, #0x2a8]
    mov ip, #0x28
    bic r4, r4, #-16777216
    orr r5, r4, #0x1000000
    str r5, [lr, #0x2a8]
    ldr r4, [lr, #0x2a4]
    mla ip, r0, ip, r6
    bic r6, r4, #0x1000
    bic r4, r5, #0xf000
    orr r5, r4, #0x1000
    mov r4, r5, lsl #0x10
    bic r6, r6, #0x600000
    mov r0, r0, lsl #0x1e
    orr r6, r6, r0, lsr #0x9
    str r6, [lr, #0x2a4]
    str r1, [lr, #0x28c]
    str r2, [lr, #0x290]
    add r1, ip, #0x8
    mov r0, r4, lsr #0x1c
    str r5, [lr, #0x2a8]
    add ip, r1, r0, lsl #0x3
    ldrsh r2, [ip, #-8]
    bic r1, r6, #0x600
    mov r0, r3, lsl #0x1e
    mov r2, r2, lsl #0xc
    str r2, [lr, #0x184]
    ldrsh r2, [ip, #-6]
    orr r0, r1, r0, lsr #0x15
    sub r1, r2, #0x1
    mov r1, r1, lsl #0xc
    str r1, [lr, #0x188]
    str r0, [lr, #0x2a4]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov000_021c758c
_LIT1: .word data_ov000_021b56b4
