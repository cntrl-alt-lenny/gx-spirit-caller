; func_02019858 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_020b5b80
        .extern func_02019604
        .extern func_0201a170
        .global func_02019858
        .arm
func_02019858:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    bl GetSystemWork
    mov r0, r5
    bl func_02019604
    mov r4, r0
    mov r0, #0x8
    bl func_0201a170
    ldr r1, _LIT0
    rsb r2, r5, r5, lsl #0x3
    add r1, r1, r2
    ldrsb r1, [r1, #0x4]
    add r1, r1, r4, lsl #0x1
    add r0, r1, r0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_020b5b80
