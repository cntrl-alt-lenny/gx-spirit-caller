; func_0207cce8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a07dc
        .extern data_021a07e0
        .global func_0207cce8
        .arm
func_0207cce8:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    ands r1, r0, #0x2
    ldrb ip, [r2]
    movne r0, r0, asr #0x2
    andne lr, r0, #0xff
    moveq r0, r0, asr #0x2
    addeq r0, r0, #0x19
    andeq lr, r0, #0xff
    mov r1, ip, lsr #0x1f
    rsb r0, r1, ip, lsl #0x1c
    cmp ip, #0x10
    ldr r3, _LIT1
    add r0, r1, r0, ror #0x1c
    strb lr, [r3, r0]
    addcc r0, ip, #0x1
    strccb r0, [r2]
    addcc sp, sp, #0x4
    ldmccfd sp!, {lr}
    bxcc lr
    add r0, ip, #0x1
    mov r1, r0, lsr #0x1f
    rsb r0, r1, r0, lsl #0x1c
    add r0, r1, r0, ror #0x1c
    add r0, r0, #0x10
    strb r0, [r2]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a07dc
_LIT1: .word data_021a07e0
