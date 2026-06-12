; func_ov023_021b2280 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_02105989
        .extern data_ov023_021b23a8
        .extern func_0202adf8
        .extern func_0202ae1c
        .extern func_0202c070
        .extern func_020945f4
        .extern func_ov005_021ad018
        .global func_ov023_021b2280
        .arm
func_ov023_021b2280:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    bl func_0202adf8
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202ae1c
    ldr r0, _LIT1
    ldr r0, [r0, #0x4]
    mov r0, r0, lsl #0x1d
    mov r0, r0, lsr #0x1d
    bl func_0202c070
    ldr r0, _LIT2
    mov r1, #0x0
    mov r2, #0x14
    bl func_020945f4
    ldr r0, _LIT2
    mov r1, #0x4
    bl func_ov005_021ad018
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov023_021b23a8
_LIT1: .word data_02104f4c
_LIT2: .word data_02105989
