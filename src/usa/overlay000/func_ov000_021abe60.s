; func_ov000_021abe60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov000_021abe60
        .arm
func_ov000_021abe60:
    ldr r0, [r0, #0x8]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bx lr
