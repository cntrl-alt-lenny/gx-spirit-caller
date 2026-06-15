; func_ov008_021ab484 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2d34
        .extern func_0201e964
        .global func_ov008_021ab484
        .arm
func_ov008_021ab484:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x28
    mov ip, r0, lsl #0xc
    mov r0, r1, lsl #0xc
    str ip, [sp, #0x20]
    str r0, [sp, #0x24]
    mov lr, #0x0
    str lr, [sp]
    str lr, [sp, #0x4]
    ldr r0, _LIT0
    ldr r1, [sp, #0x34]
    add r0, r0, r2, lsl #0x6
    mov r2, r1, lsl #0x7
    add r0, r0, r3, lsl #0x2
    ldr ip, [sp, #0x3c]
    str lr, [sp, #0x8]
    str ip, [sp, #0xc]
    str r2, [sp, #0x10]
    ldr r1, [sp, #0x38]
    add r2, sp, #0x20
    str r1, [sp, #0x14]
    str lr, [sp, #0x18]
    str lr, [sp, #0x1c]
    ldr r1, [r0, #0x8]
    ldr r0, [sp, #0x30]
    ldr r1, [r1, #0x2c]
    mov r3, lr
    add r1, r1, r0, lsl #0x3
    mov r0, #0x2
    bl func_0201e964
    add sp, sp, #0x28
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov008_021b2d34
