; func_02022580 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02197434
        .extern data_0219747c
        .global func_02022580
        .arm
func_02022580:
    ldr r1, _LIT0
    ldr r2, _LIT1
    ldr r1, [r1, r0, lsl #0x4]
    cmp r1, #0x0
    movlt r0, #0x0
    bxlt lr
    add r0, r2, r0, lsl #0x4
    mvn r1, #0x0
    str r1, [r0, #0x48]
    mov r0, #0x1
    bx lr
_LIT0: .word data_0219747c
_LIT1: .word data_02197434
