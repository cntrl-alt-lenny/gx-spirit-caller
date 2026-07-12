; func_ov010_021b7004 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov010_021b97a8
        .extern data_ov010_021b97f0
        .extern func_ov010_021b2824
        .global func_ov010_021b7004
        .arm
func_ov010_021b7004:
    stmdb sp!, {r3, lr}
    mov r2, r0
    ldr r0, _LIT0
    ldr r1, _LIT1
    bl func_ov010_021b2824
    add r0, r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov010_021b97f0
_LIT1: .word data_ov010_021b97a8
