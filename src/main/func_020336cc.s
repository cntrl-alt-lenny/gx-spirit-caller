; func_020336cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02032998
        .extern func_02032a00
        .extern func_02032c78
        .extern func_02046fc4
        .global func_020336cc
        .arm
func_020336cc:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0xc
    mov r4, r0
    ldr r0, _LIT0
    str r4, [sp]
    stmib sp, {r0, r4}
    ldr r1, _LIT1
    ldr r3, _LIT2
    mov r2, r4
    mov r0, #0x0
    bl func_02046fc4
    ldr r1, [r4, #0xeb4]
    orr r1, r1, #0x200
    str r1, [r4, #0xeb4]
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, pc}
_LIT0: .word func_02032998
_LIT1: .word func_02032c78
_LIT2: .word func_02032a00
