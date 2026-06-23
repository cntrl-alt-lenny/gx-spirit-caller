; func_ov006_021c816c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov006_021c816c
        .arm
func_ov006_021c816c:
    ldr r2, _LIT0
    mov r0, #0x1
    ldrh r1, [r2]
    bic r1, r1, #0x3
    orr r1, r1, #0x1
    strh r1, [r2]
    ldrh r1, [r2]
    and r1, r1, #0x43
    orr r1, r1, #0x210
    orr r1, r1, #0x2000
    strh r1, [r2]
    bx lr
_LIT0: .word 0x0400100a
