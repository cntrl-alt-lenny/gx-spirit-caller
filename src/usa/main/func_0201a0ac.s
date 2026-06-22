; func_0201a0ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_020b5a8c
        .extern func_020195d0
        .global func_0201a0ac
        .arm
func_0201a0ac:
    stmdb sp!, {r4, lr}
    mov r4, r0
    bl GetSystemWork
    mov r0, r4
    bl func_020195d0
    ldr r1, _LIT0
    rsb r2, r4, r4, lsl #0x3
    add r1, r1, r2
    ldrsb r1, [r1, #0x2]
    add r0, r1, r0, asr #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_020b5a8c
