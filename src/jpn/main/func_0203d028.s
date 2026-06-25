; func_0203d028 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Copy32
        .global func_0203d028
        .arm
func_0203d028:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr lr, _LIT0
    add ip, r3, #0xbf0
    add r3, r3, lr
    strb r0, [r3, #0x1]
    ldrh lr, [r1, #0x2]
    and r2, r2, #0x7f
    ands r0, lr, #0x2
    movne r0, lr, asr #0x2
    andne r0, r0, #0xff
    moveq r0, lr, asr #0x2
    addeq r0, r0, #0x19
    andeq r0, r0, #0xff
    strb r0, [r3, #0x2]
    ldrb lr, [r3, #0x3]
    mov r0, r1
    bic r1, lr, #0x7f
    orr lr, r1, r2
    mov r1, ip
    mov r2, #0xc0
    strb lr, [r3, #0x3]
    bl Copy32
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word 0x0000046c
