; func_ov000_021ab688 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021c7530
        .global func_ov000_021ab688
        .arm
func_ov000_021ab688:
    stmdb sp!, {r3, lr}
    mov r3, #0x2c
    mul ip, r0, r3
    and r0, r1, #0xff
    ldr lr, _LIT0
    mov r0, r0, lsl #0x1b
    ldr r1, [lr, ip]
    bic r1, r1, #0x1f0000
    orr r3, r1, r0, lsr #0xb
    and r0, r2, #0xff
    bic r1, r3, #0x3e00000
    mov r0, r0, lsl #0x1b
    orr r0, r1, r0, lsr #0x6
    orr r0, r0, #0x8000
    str r0, [lr, ip]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov000_021c7530
