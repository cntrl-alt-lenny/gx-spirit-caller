; func_0208caa0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6224
        .global func_0208caa0
        .arm
func_0208caa0:
    ldr r0, _LIT0
    mov r3, #0x0
    ldr r2, _LIT1
    strh r3, [r0]
    strh r3, [r0, #0x2]
    strh r3, [r0, #0x4]
    strh r3, [r0, #0x6]
    strh r3, [r0, #0x8]
    strh r3, [r0, #0xa]
    strh r3, [r0, #0xc]
    strh r3, [r0, #0xe]
    strh r3, [r0, #0x10]
    strh r3, [r0, #0x12]
    strh r3, [r0, #0x14]
    strh r3, [r0, #0x16]
    strh r3, [r0, #0x18]
    ldr r1, _LIT2
    str r3, [r2]
    ldr r0, _LIT3
    strb r3, [r1]
    ldr r1, _LIT4
    strb r3, [r0]
    ldr r0, _LIT5
    strb r3, [r1]
    strh r3, [r0]
    bx lr
_LIT0: .word data_021a6224
_LIT1: .word 0x04000240
_LIT2: .word 0x04000244
_LIT3: .word 0x04000245
_LIT4: .word 0x04000246
_LIT5: .word 0x04000248
