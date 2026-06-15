; func_02062498 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101518
        .extern data_02101524
        .extern func_020a6d54
        .global func_02062498
        .arm
func_02062498:
    stmdb sp!, {r4, lr}
    movs r4, r0
    bne .L_20
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r3, _LIT2
    mov r2, #0x0
    bl func_020a6d54
.L_20:
    ldr r0, [r4, #0x40]
    ldmia sp!, {r4, pc}
_LIT0: .word data_02101518
_LIT1: .word data_02101524
_LIT2: .word 0x000001a3
