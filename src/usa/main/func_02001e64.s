; func_02001e64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02001e64
        .arm
func_02001e64:
    ldr r0, [r0, #0x20]
    mov r0, r0, lsl #0x9
    mov r0, r0, lsr #0x1f
    bx lr
