; func_ov000_021aed38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021c758c
        .extern func_020b3870
        .global func_ov000_021aed38
        .arm
func_ov000_021aed38:
    stmdb sp!, {r3, lr}
    ldr r2, _LIT0
    mov r3, r0, lsl #0x18
    ldr ip, [r2, #0x2b0]
    mov r0, #0xff
    bic ip, ip, #0xff00
    orr r3, ip, r3, lsr #0x10
    str r3, [r2, #0x2b0]
    ldr r3, [r2, #0x2ac]
    bic r3, r3, #0x3fc00000
    orr r3, r3, #0x3fc00000
    str r3, [r2, #0x2ac]
    bl func_020b3870
    ldr r1, _LIT0
    and r0, r0, #0xff
    ldr r2, [r1, #0x2b0]
    bic r2, r2, #0xff
    orr r0, r2, r0
    str r0, [r1, #0x2b0]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov000_021c758c
