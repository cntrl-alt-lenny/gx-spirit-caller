; func_02001d78 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02001d78
        .arm
func_02001d78:
    cmp r1, #0x0
    ldrlt r1, [r0, #0x20]
    biclt r1, r1, #0x1000000
    strlt r1, [r0, #0x20]
    bxlt lr
    and r1, r1, #0xff
    str r1, [r0, #0x18]
    ldr r1, [r0, #0x20]
    orr r1, r1, #0x1000000
    str r1, [r0, #0x20]
    bx lr
