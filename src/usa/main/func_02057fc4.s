; func_02057fc4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021000e8
        .extern func_02057ffc
        .extern func_020a9698
        .global func_02057fc4
        .arm
func_02057fc4:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x14
    mov r4, r1
    mov r5, r0
    ldr r1, _LIT0
    add r0, sp, #0x0
    bl func_020a9698
    add r2, sp, #0x0
    mov r0, r5
    mov r1, r4
    bl func_02057ffc
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_021000e8
