; func_ov000_021ab4f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021c7450
        .global func_ov000_021ab4f8
        .arm
func_ov000_021ab4f8:
    stmdb sp!, {r3, lr}
    mov r3, #0x2c
    mul r3, r0, r3
    ldr r0, _LIT0
    ldr lr, [r0, r3]
    mov ip, lr, lsl #0x19
    orr r1, r1, ip, lsr #0x19
    and ip, r1, #0xff
    mov r1, lr, lsl #0x12
    orr r1, r2, r1, lsr #0x19
    and r1, r1, #0xff
    bic lr, lr, #0x7f
    and r2, ip, #0x7f
    orr ip, lr, r2
    bic r2, ip, #0x3f80
    mov r1, r1, lsl #0x19
    orr r1, r2, r1, lsr #0x12
    orr r1, r1, #0x4000
    str r1, [r0, r3]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov000_021c7450
