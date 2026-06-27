; func_0200f000 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0200f000
        .arm
func_0200f000:
    cmp r0, #0x0
    moveq r0, #0x0
    bxeq lr
    ldr r1, [r0, #0x60]
    bic r2, r1, #0x4
    orr r1, r2, #0x8
    bic r1, r1, #0x1e00000
    str r1, [r0, #0x60]
    mov r0, #0x1
    bx lr
