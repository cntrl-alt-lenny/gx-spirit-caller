; func_ov000_021ab740 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021c7588
        .extern func_020b3870
        .extern func_ov000_021ab8f8
        .global func_ov000_021ab740
        .arm
func_ov000_021ab740:
    stmdb sp!, {r4, lr}
    ldr r4, _LIT0
    mov r2, r0, lsl #0x1e
    ldr r3, [r4]
    mov r0, r1, asr #0x1
    bic r3, r3, #0xff
    orr r3, r3, #0xff
    bic r3, r3, #0x300
    orr r3, r3, #0x100
    bic r3, r3, #0xc00
    orr r2, r3, r2, lsr #0x14
    str r2, [r4]
    add r0, r0, #0xff
    bl func_020b3870
    ldr r1, [r4]
    mov r0, r0, lsl #0x18
    bic r1, r1, #0xff000
    orr r0, r1, r0, lsr #0xc
    str r0, [r4]
    bl func_ov000_021ab8f8
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov000_021c7588
