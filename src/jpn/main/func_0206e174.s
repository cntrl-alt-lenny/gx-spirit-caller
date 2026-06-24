; func_0206e174 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ee54
        .extern func_0206e100
        .global func_0206e174
        .arm
func_0206e174:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    bl func_0206e100
    cmp r0, #0x0
    ldrne r1, _LIT0
    mvneq r0, #0x26
    movne r0, #0x0
    strne r5, [r1]
    strne r4, [r1, #0x4]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_0219ee54
