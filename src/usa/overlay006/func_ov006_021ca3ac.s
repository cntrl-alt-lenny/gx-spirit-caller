; func_ov006_021ca3ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov006_021ca3ac
        .arm
func_ov006_021ca3ac:
    ldr r1, _LIT0
    ldr r2, _LIT1
    ldrh ip, [r1]
    mov r3, r2, lsl #0x10
    bic ip, ip, #0x3
    orr ip, ip, #0x1
    strh ip, [r1]
    ldrh ip, [r1]
    and ip, ip, #0x43
    orr ip, ip, #0x210
    orr ip, ip, #0x2000
    strh ip, [r1]
    ldr ip, [r0, #0x78]
    ldr r0, [r0, #0x7c]
    rsb ip, ip, #0x0
    rsb r0, r0, #0x0
    and r2, ip, r2
    and r0, r3, r0, lsl #0x10
    orr r0, r2, r0
    str r0, [r1, #0xa]
    mov r0, #0x1
    bx lr
_LIT0: .word 0x0400100a
_LIT1: .word 0x000001ff
