; func_020a60a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_020a60a8
        .arm
func_020a60a8:
    ldr r0, _LIT0
    ldrb r0, [r0, #0x5]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bx lr
_LIT0: .word 0x027ffc30
