; func_0206ceb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206be54
        .extern func_0206bf94
        .extern func_0206cd64
        .global func_0206ceb8
        .arm
func_0206ceb8:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r6, r1
    mov r5, r2
    ldr r0, _LIT0
    mov r1, r7
    mov r2, #0x1
    mov r4, r3
    bl func_0206bf94
    mov r1, r0
    str r6, [r1, #0x10]
    str r5, [r1, #0x14]
    ldr r2, [sp, #0x18]
    str r4, [r1, #0x18]
    mov r0, r7
    str r2, [r1, #0x1c]
    bl func_0206be54
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word func_0206cd64
