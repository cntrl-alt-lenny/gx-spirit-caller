; func_ov008_021afa88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2cc4
        .extern func_ov008_021b20dc
        .extern func_ov008_021b2144
        .extern func_ov008_021b21c0
        .global func_ov008_021afa88
        .arm
func_ov008_021afa88:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldrh ip, [r0, #0x4]
    cmp ip, #0x0
    bne .L_cc0
    mov r0, #0x0
    bl func_ov008_021b21c0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0xbc]
    b .L_cf4
.L_cc0:
    ldrh r2, [r0]
    ldrh r1, [r0, #0x2]
    ldr r3, [r0, #0xc0]
    mov r0, #0x1
    add r1, r2, r1
    add r1, r1, r1, lsl #0x2
    add r1, r3, r1, lsl #0x1
    add r1, r1, ip, lsl #0x1
    ldrh r4, [r1, #-2]
    bl func_ov008_021b21c0
    mov r0, r4
    mov r1, #0x0
    bl func_ov008_021b2144
.L_cf4:
    ldr r0, _LIT0
    ldr r0, [r0, #0xbc]
    bl func_ov008_021b20dc
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0xbc]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov008_021b2cc4
