; func_ov008_021ada98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2ca8
        .extern func_ov008_021abf8c
        .global func_ov008_021ada98
        .arm
func_ov008_021ada98:
    stmdb sp!, {r3, lr}
    ldr r2, _LIT0
    add r1, sp, #0x0
    ldrh r3, [r2, #0x6]
    ldrh ip, [r2, #0x4]
    mov r2, r3, lsl #0x18
    mov r3, ip, lsl #0x18
    mov r2, r2, lsr #0x18
    mov r3, r3, lsr #0x18
    sub r2, r2, #0x2
    str r3, [sp]
    bl func_ov008_021abf8c
    ldr r0, _LIT0
    ldr r2, [sp]
    ldrh r1, [r0, #0x4]
    mov r1, r1, lsl #0x18
    cmp r2, r1, lsr #0x18
    mov r1, r1, lsr #0x18
    ldmeqia sp!, {r3, pc}
    cmp r1, r2
    movlt r1, #0x4
    ldrge r1, _LIT1
    strh r1, [r0, #0x8]
    mov r0, r2, lsl #0x10
    ldr r1, _LIT0
    mov r0, r0, lsr #0x10
    ldrh r2, [r1, #0x4]
    and r0, r0, #0xff
    bic r2, r2, #0xff
    orr r0, r2, r0
    strh r0, [r1, #0x4]
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov008_021b2ca8
_LIT1: .word 0x0000fffc
