; func_ov008_021aedf4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b269c
        .extern data_ov008_021b2cc4
        .extern data_ov008_021b2d8c
        .extern func_02021278
        .extern func_020221e0
        .extern func_020221f8
        .extern func_ov008_021aecd8
        .extern func_ov008_021aed30
        .global func_ov008_021aedf4
        .arm
func_ov008_021aedf4:
    stmdb sp!, {r3, r4, r5, lr}
    mov r0, #0x0
    bl func_020221f8
    bic r1, r0, #0x2
    mov r0, #0x0
    bl func_020221e0
    ldr r0, _LIT0
    ldr r0, [r0, #0x8]
    bl func_02021278
    ldr r0, _LIT1
    ldrh r1, [r0]
    ldrh r0, [r0, #0x2]
    add r0, r1, r0
    bl func_ov008_021aecd8
    ldr r1, _LIT1
    mov r4, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aed30
    ldr r1, _LIT1
    mov r5, r0
    ldrh r2, [r1]
    ldrh r0, [r1, #0x2]
    add r0, r2, r0
    bl func_ov008_021aed30
    mov r3, r0, lsr #0x1f
    rsb r2, r3, r0, lsl #0x1b
    mov r1, r5, asr #0x4
    ldr ip, _LIT2
    mov r0, #0x34
    mla lr, r4, r0, ip
    add r1, r5, r1, lsr #0x1b
    mov ip, r1, asr #0x5
    ldr r4, [lr, ip, lsl #0x2]
    add r0, r3, r2, ror #0x1b
    mov r1, #0x1
    orr r2, r4, r1, lsl r0
    ldr r0, _LIT1
    str r2, [lr, ip, lsl #0x2]
    strh r1, [r0, #0x4]
    mov r1, #0x0
    strh r1, [r0, #0xaa]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov008_021b2d8c
_LIT1: .word data_ov008_021b2cc4
_LIT2: .word data_ov008_021b269c
