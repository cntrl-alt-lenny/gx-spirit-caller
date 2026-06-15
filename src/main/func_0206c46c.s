; func_0206c46c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206be28
        .extern func_0206bf94
        .extern func_0206c380
        .extern func_0206c3f4
        .global func_0206c46c
        .arm
func_0206c46c:
    stmdb sp!, {r4, lr}
    bl func_0206c380
    movs r4, r0
    mvneq r0, #0x30
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ldr r0, _LIT0
    mov r1, r4
    mov r2, #0x1
    bl func_0206bf94
    mov r1, r0
    mov r0, r4
    bl func_0206be28
    mov r0, r4
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word func_0206c3f4
