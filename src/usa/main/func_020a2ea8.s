; func_020a2ea8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a9770
        .global func_020a2ea8
        .arm
func_020a2ea8:
    ldr r1, _LIT0
    mov r3, #0x1
    ldr r0, [r1, #0x4]
    mov r2, #0x5
    add r0, r0, #0x400
    strh r3, [r0, #0xb0]
    ldr r0, [r1, #0x4]
    ldrb r0, [r0, #0x4b4]
    strb r0, [r1, #0xe]
    strb r2, [r1, #0xc]
    bx lr
_LIT0: .word data_021a9770
