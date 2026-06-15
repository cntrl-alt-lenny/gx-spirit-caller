; func_02090690 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6384
        .extern data_021a6388
        .extern data_021a638c
        .extern func_02090624
        .global func_02090690
        .arm
func_02090690:
    stmdb sp!, {r4, lr}
    mov r3, #0xc
    mul r4, r0, r3
    ldr ip, _LIT0
    add r0, r0, #0x3
    mov r3, #0x1
    mov r0, r3, lsl r0
    ldr r3, _LIT1
    str r1, [ip, r4]
    str r2, [r3, r4]
    bl func_02090624
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, r4]
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a6384
_LIT1: .word data_021a638c
_LIT2: .word data_021a6388
