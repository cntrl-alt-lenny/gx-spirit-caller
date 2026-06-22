; func_02096318 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02096318
        .arm
func_02096318:
    ldr r2, _LIT0
    mov r3, #0x1
    add r1, r2, r1, lsl #0x2
    mov r2, r3, lsl r0
    ldr r0, [r1, #0x388]
    ands r0, r2, r0
    moveq r3, #0x0
    mov r0, r3
    bx lr
_LIT0: .word 0x027ffc00
