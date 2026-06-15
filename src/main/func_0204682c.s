; func_0204682c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219daf4
        .global func_0204682c
        .arm
func_0204682c:
    ldr r2, _LIT0
    mov r0, #0x0
.L_8:
    ldr r1, [r2, r0, lsl #0x2]
    cmp r1, #0x0
    bxeq lr
    add r0, r0, #0x1
    cmp r0, #0x20
    blt .L_8
    mvn r0, #0x0
    bx lr
_LIT0: .word data_0219daf4
