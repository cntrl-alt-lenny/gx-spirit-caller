; func_02001ed4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02001ed4
        .arm
func_02001ed4:
    ldr r3, [r0, #0x24]
    mov r1, r1, lsl #0x1c
    bic r3, r3, #0xf00
    orr ip, r3, r1, lsr #0x14
    bic r3, ip, #0xf000
    mov r1, r2, lsl #0x1c
    orr r1, r3, r1, lsr #0x10
    str r1, [r0, #0x24]
    bx lr
