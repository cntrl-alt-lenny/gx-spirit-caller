; func_020124a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104cae
        .extern data_02104cb0
        .extern data_02104cf8
        .extern func_02094688
        .extern func_020aadf8
        .global func_020124a4
        .arm
func_020124a4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r5, r0
    mov r4, r1
    mov r0, #0x1a
    ldr r3, _LIT1
    mla r1, r5, r0, r2
    ldrsb r2, [r3, r5]
    add r0, r4, #0x1
    strb r2, [r4]
    bl func_020aadf8
    ldr r0, _LIT2
    mov r2, #0x108
    mla r0, r5, r2, r0
    add r1, r4, #0x1c
    bl func_02094688
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02104cb0
_LIT1: .word data_02104cae
_LIT2: .word data_02104cf8
