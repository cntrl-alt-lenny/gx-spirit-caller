; func_02067b18 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02067b18
        .arm
func_02067b18:
    ldr r3, [r0, #0x40]
    cmp r3, #0x14
    addlt r2, r3, #0x1
    strlt r2, [r0, #0x40]
    addlt r0, r0, r3
    strltb r1, [r0, #0x2c]
    bx lr
