; func_020536d0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02053748
        .global func_020536d0
        .arm
func_020536d0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov ip, #0x0
    mov r4, r1
    mov r1, r2
    ldr r3, _LIT0
    mov r2, ip
    mov r5, r0
    bl func_02053748
    str r4, [r5, #0x4]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word 0x000007ff
