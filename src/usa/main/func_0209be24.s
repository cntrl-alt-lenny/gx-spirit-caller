; func_0209be24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0209be24
        .arm
func_0209be24:
    ldr r3, [r0, #0x4]
    ldr r2, [r0]
    mov r1, #0x3c
    mla r3, r2, r1, r3
    ldr r0, [r0, #0x8]
    mla r0, r3, r1, r0
    bx lr
