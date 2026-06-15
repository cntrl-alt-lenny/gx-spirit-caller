; func_020a5f44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a5f44
        .arm
func_020a5f44:
    ldr r2, _LIT0
    ldrh r1, [r2]
    and r1, r1, #0xc
    mov r1, r1, asr #0x2
    str r1, [r0]
    ldrh r1, [r2]
    and r1, r1, #0x10
    mov r1, r1, asr #0x4
    str r1, [r0, #0x4]
    ldrh r0, [r2]
    bic r0, r0, #0xc
    orr r0, r0, #0xc
    strh r0, [r2]
    ldrh r0, [r2]
    bic r0, r0, #0x10
    strh r0, [r2]
    bx lr
_LIT0: .word 0x04000204
