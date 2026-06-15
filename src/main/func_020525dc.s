; func_020525dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219e3ec
        .extern func_02046870
        .global func_020525dc
        .arm
func_020525dc:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r4, r1
    ldr r1, [r2]
    ldr r1, [r1, #0x60c]
    cmp r1, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_02046870
    ldr r2, _LIT0
    mov r1, r0
    ldr r2, [r2]
    mov r0, r4
    ldr r2, [r2, #0x60c]
    blx r2
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219e3ec
