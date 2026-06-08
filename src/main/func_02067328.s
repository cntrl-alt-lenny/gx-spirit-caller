; func_02067328 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02067328
        .arm
func_02067328:
    ldr r3, [r0, #0x100]
    cmp r3, #0xfe
    bxge lr
    cmp r1, #0x1
    bxlt lr
    cmp r1, #0xfe
    bxgt lr
    add r2, r3, #0x1
    str r2, [r0, #0x100]
    strb r1, [r0, r3]
    bx lr
