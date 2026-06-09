; func_ov002_022b03f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021064a8
        .global func_ov002_022b03f4
        .arm
func_ov002_022b03f4:
    cmp r0, #0x7
    movle r0, #0x0
    bxle lr
    cmp r0, #0x70
    movge r0, #0x0
    bxge lr
    mov r1, r0, asr #0x4
    add r1, r0, r1, lsr #0x1b
    mov r2, r0, lsr #0x1f
    rsb r0, r2, r0, lsl #0x1b
    ldr r3, _LIT0
    mov r1, r1, asr #0x5
    ldr r1, [r3, r1, lsl #0x2]
    add r0, r2, r0, ror #0x1b
    mov r0, r1, lsr r0
    tst r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    bx lr
_LIT0: .word data_021064a8
