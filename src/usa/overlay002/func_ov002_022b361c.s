; func_ov002_022b361c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov002_022b361c
        .arm
func_ov002_022b361c:
    add ip, r0, r1, lsl #0x2
    ldr r3, [ip, #0x24]
    mov r1, #0x5
    sub r2, r2, r3
    str r2, [ip, #0x44]
    str r1, [r0, #0x58]
    mov r1, #0x80
    str r1, [r0, #0x54]
    bx lr
