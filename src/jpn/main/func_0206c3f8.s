; func_0206c3f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206bdb4
        .extern func_0206bf20
        .extern func_0206c30c
        .extern func_0206c380
        .global func_0206c3f8
        .arm
func_0206c3f8:
    stmdb sp!, {r4, lr}
    bl func_0206c30c
    movs r4, r0
    mvneq r0, #0x30
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ldr r0, _LIT0
    mov r1, r4
    mov r2, #0x1
    bl func_0206bf20
    mov r1, r0
    mov r0, r4
    bl func_0206bdb4
    mov r0, r4
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word func_0206c380
