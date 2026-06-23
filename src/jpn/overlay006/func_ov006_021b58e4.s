; func_ov006_021b58e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_0224f26c
        .extern data_ov006_0224f278
        .extern data_ov006_0225df48
        .extern func_ov006_021b5604
        .extern func_ov006_021c9dc8
        .global func_ov006_021b58e4
        .arm
func_ov006_021b58e4:
    stmdb sp!, {r4, lr}
    mov r0, #0x1
    ldr r4, _LIT0
    bl func_ov006_021b5604
    ldr r0, _LIT1
    bl func_ov006_021c9dc8
    mov r3, #0x2
    mov r2, #0x18
    ldr r0, _LIT2
    mov r1, #0x4
    str r3, [r4]
    str r2, [r4, #0x4]
    str r1, [r0]
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov006_0224f278
_LIT1: .word data_ov006_0225df48
_LIT2: .word data_ov006_0224f26c
