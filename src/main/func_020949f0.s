; func_020949f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020949f0
        .arm
func_020949f0:
    str r1, [r0]
    ldr r2, [r2]
    mov r1, #0x0
    mov r2, r2, lsr #0x8
    str r2, [r0, #0x4]
    strb r1, [r0, #0xb]
    strb r1, [r0, #0xc]
    strb r1, [r0, #0xd]
    strb r1, [r0, #0xe]
    strh r1, [r0, #0x8]
    strb r1, [r0, #0xa]
    bx lr
