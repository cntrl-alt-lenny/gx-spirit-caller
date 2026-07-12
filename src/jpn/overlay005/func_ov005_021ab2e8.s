; func_ov005_021ab2e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov005_021ab2e8
        .arm
func_ov005_021ab2e8:
    ldr ip, [r0, #0x8]
    mov r0, #0x1c
    mla r0, r1, r0, ip
    str r2, [r0, #0x14]
    str r3, [r0, #0x10]
    bx lr
