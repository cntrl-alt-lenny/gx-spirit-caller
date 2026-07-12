; func_ov008_021ace98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2680
        .extern data_ov008_021b2684
        .extern data_ov008_021b2ca0
        .extern data_ov008_021b2ca8
        .extern func_ov008_021ad96c
        .global func_ov008_021ace98
        .arm
func_ov008_021ace98:
    stmdb sp!, {r3, lr}
    ldr r1, _LIT0
    mov ip, #0x0
    str ip, [r1, #0x10]
    ldr r0, _LIT1
    str ip, [r1, #0xc]
    ldrh r3, [r0, #0x4]
    mov r0, #0x34
    ldr r1, _LIT2
    mov r2, r3, lsl #0x10
    mov r3, r3, lsl #0x18
    mov r2, r2, lsr #0x18
    add r2, r2, r3, lsr #0x18
    mul r3, r2, r0
    ldr r0, _LIT3
    str ip, [r1, r3]
    str ip, [r0, r3]
    bl func_ov008_021ad96c
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov008_021b2ca8
_LIT1: .word data_ov008_021b2ca0
_LIT2: .word data_ov008_021b2680
_LIT3: .word data_ov008_021b2684
