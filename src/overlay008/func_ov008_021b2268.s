; func_ov008_021b2268 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b270c
        .extern data_ov008_021b275c
        .extern func_02021660
        .extern func_020216b0
        .extern OS_SPrintf
        .global func_ov008_021b2268
        .arm
func_ov008_021b2268:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    ldr r3, [r2]
    ldr r2, [r3, #0xc]
    cmp r0, r2
    cmpeq r1, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT0
    str r0, [r3, #0xc]
    ldr r0, [r1]
    mov r1, #0x3
    ldr r0, [r0, #0x4]
    mov r2, #0x2
    bl func_02021660
    mov r4, r0
    mov r1, #0x2
    mov r2, #0x29
    bl func_020216b0
    mov r0, r4
    mov r1, #0x0
    mov r2, #0x41
    bl func_020216b0
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r0, [r0]
    ldr r2, [r0, #0xc]
    add r0, r0, #0x70
    bl OS_SPrintf
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov008_021b270c
_LIT1: .word data_ov008_021b275c
