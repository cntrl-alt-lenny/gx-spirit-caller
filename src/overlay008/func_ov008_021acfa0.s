; func_ov008_021acfa0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b27a0
        .extern data_ov008_021b27a4
        .extern data_ov008_021b2dc0
        .extern data_ov008_021b2dc8
        .extern func_ov008_021ada90
        .global func_ov008_021acfa0
        .arm
func_ov008_021acfa0:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    mov lr, #0x0
    str lr, [r0, #0x10]
    ldr r1, _LIT1
    str lr, [r0, #0xc]
    ldrh ip, [r1, #0x4]
    mov r0, #0x34
    ldr r2, _LIT2
    mov r3, ip, lsl #0x10
    mov ip, ip, lsl #0x18
    mov r3, r3, lsr #0x18
    add ip, r3, ip, lsr #0x18
    mul r3, ip, r0
    ldr r0, _LIT3
    str lr, [r2, r3]
    str lr, [r0, r3]
    ldrh r2, [r1, #0x6]
    mov r0, ip, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r2, r2, #0xff
    and r0, r0, #0xff
    orr r0, r2, r0
    strh r0, [r1, #0x6]
    bl func_ov008_021ada90
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov008_021b2dc8
_LIT1: .word data_ov008_021b2dc0
_LIT2: .word data_ov008_021b27a0
_LIT3: .word data_ov008_021b27a4
