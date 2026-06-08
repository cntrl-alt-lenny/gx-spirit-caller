; func_ov002_022b0444 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021064a8
        .global func_ov002_022b0444
        .arm
func_ov002_022b0444:
    stmdb sp!, {r3, lr}
    cmp r0, #0x7
    ldmleia sp!, {r3, pc}
    mov r1, r0, asr #0x4
    add r1, r0, r1, lsr #0x1b
    mov r2, r0, lsr #0x1f
    rsb r0, r2, r0, lsl #0x1b
    ldr lr, _LIT0
    mov ip, r1, asr #0x5
    ldr r3, [lr, ip, lsl #0x2]
    add r0, r2, r0, ror #0x1b
    mov r1, #0x1
    orr r0, r3, r1, lsl r0
    str r0, [lr, ip, lsl #0x2]
    ldmia sp!, {r3, pc}
_LIT0: .word data_021064a8
