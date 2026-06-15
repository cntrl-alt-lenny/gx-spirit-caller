; func_ov008_021afbac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2de4
        .extern func_ov008_021b2200
        .extern func_ov008_021b2268
        .extern func_ov008_021b22e4
        .global func_ov008_021afbac
        .arm
func_ov008_021afbac:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldrh ip, [r0, #0x4]
    cmp ip, #0x0
    bne .L_650
    mov r0, #0x0
    bl func_ov008_021b22e4
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0xbc]
    b .L_684
.L_650:
    ldrh r2, [r0]
    ldrh r1, [r0, #0x2]
    ldr r3, [r0, #0xc0]
    mov r0, #0x1
    add r1, r2, r1
    add r1, r1, r1, lsl #0x2
    add r1, r3, r1, lsl #0x1
    add r1, r1, ip, lsl #0x1
    ldrh r4, [r1, #-2]
    bl func_ov008_021b22e4
    mov r0, r4
    mov r1, #0x0
    bl func_ov008_021b2268
.L_684:
    ldr r0, _LIT0
    ldr r0, [r0, #0xbc]
    bl func_ov008_021b2200
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0xbc]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov008_021b2de4
