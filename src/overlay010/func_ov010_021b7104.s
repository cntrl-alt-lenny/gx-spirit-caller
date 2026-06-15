; func_ov010_021b7104 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov010_021b98a8
        .extern data_ov010_021b98f0
        .extern func_ov010_021b2924
        .global func_ov010_021b7104
        .arm
func_ov010_021b7104:
    stmdb sp!, {r3, lr}
    mov r2, r0
    ldr r0, _LIT0
    ldr r1, _LIT1
    bl func_ov010_021b2924
    add r0, r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov010_021b98f0
_LIT1: .word data_ov010_021b98a8
