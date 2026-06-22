; func_02073ec4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02073ec4
        .arm
func_02073ec4:
    ldr r1, _LIT0
    eor r0, r0, r1
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    moveq r0, r1
    bx lr
_LIT0: .word 0x0000ffff
