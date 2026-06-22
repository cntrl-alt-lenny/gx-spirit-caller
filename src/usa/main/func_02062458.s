; func_02062458 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101438
        .extern data_02101444
        .extern func_020a6c60
        .global func_02062458
        .arm
func_02062458:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    movs r5, r0
    mov r4, r1
    bne .L_28
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x19c
    bl func_020a6c60
.L_28:
    str r4, [r5, #0x40]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_02101438
_LIT1: .word data_02101444
