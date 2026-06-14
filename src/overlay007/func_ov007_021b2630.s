; func_ov007_021b2630 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c9694
        .extern data_ov007_0223352c
        .extern func_ov007_021b28c4
        .extern func_ov007_021b2920
        .extern func_ov007_021b299c
        .extern func_ov007_021b2b74
        .extern func_ov007_021b2c44
        .global func_ov007_021b2630
        .arm
func_ov007_021b2630:
    stmdb sp!, {r4, lr}
    mov r4, r0
    mov r2, #0x0
    mov r0, #0x18
    smulbb r1, r2, r0
    ldr r0, _LIT0
    str r2, [r4, #0x4c]
    ldrsh r1, [r0, r1]
    ldr r0, _LIT1
    bl func_ov007_021b2b74
    mov r1, #0x1
    ldr r0, _LIT1
    str r1, [r4, #0x44]
    bl func_ov007_021b2c44
    mov r0, r4
    bl func_ov007_021b2920
    mov r0, r4
    bl func_ov007_021b299c
    mov r0, r4
    mov r1, #0x1
    bl func_ov007_021b28c4
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_020c9694
_LIT1: .word data_ov007_0223352c
