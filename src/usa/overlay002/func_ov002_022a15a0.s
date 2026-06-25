; func_ov002_022a15a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .global func_ov002_022a15a0
        .arm
func_ov002_022a15a0:
    ldr r1, [r0, #0x4]
    cmp r1, #0xb
    moveq r0, #0x0
    bxeq lr
    ldr r1, _LIT0
    ldr r0, [r0, #0x34]
    ldr r1, [r1, #0x4]
    mov r0, r0, lsl #0x3
    mov r1, r1, lsl #0x1b
    mov r1, r1, lsr #0x1e
    tst r1, #0x2
    moveq r1, #0x1
    movne r1, #0x0
    mov r1, r1, lsl #0x4
    add r1, r1, #0x58
    add r0, r0, r0, lsr #0x1f
    sub r0, r1, r0, asr #0x1
    bx lr
_LIT0: .word data_02104e6c
