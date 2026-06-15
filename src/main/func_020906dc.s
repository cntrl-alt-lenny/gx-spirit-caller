; func_020906dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a6354
        .extern data_021a6358
        .extern data_021a635c
        .extern func_02090624
        .global func_020906dc
        .arm
func_020906dc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r3, #0xc
    mul r6, r0, r3
    ldr ip, _LIT0
    add r4, r0, #0x8
    mov r5, #0x1
    mov r0, r5, lsl r4
    ldr r3, _LIT1
    str r1, [ip, r6]
    str r2, [r3, r6]
    bl func_02090624
    and r1, r0, r5, lsl r4
    ldr r0, _LIT2
    str r1, [r0, r6]
    ldmia sp!, {r4, r5, r6, lr}
    bx lr
_LIT0: .word data_021a6354
_LIT1: .word data_021a635c
_LIT2: .word data_021a6358
