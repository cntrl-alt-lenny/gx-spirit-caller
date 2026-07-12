; func_ov008_021ab2cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b229c
        .extern data_ov008_021b22ac
        .extern data_ov008_021b2c14
        .extern data_ov008_021b2c54
        .extern func_0201e78c
        .extern func_0201ef3c
        .global func_ov008_021ab2cc
        .arm
func_ov008_021ab2cc:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x38
    ldr r0, _LIT0
    add ip, sp, #0x28
    ldmia r0, {r0, r1, r2, r3}
    stmia ip, {r0, r1, r2, r3}
    ldr lr, _LIT1
    add ip, sp, #0x18
    ldmia lr, {r0, r1, r2, r3}
    stmia ip, {r0, r1, r2, r3}
    ldr r4, _LIT2
    bl func_0201e78c
    mov r0, #0x400
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    add r1, sp, #0x28
    str r1, [sp, #0x8]
    mov r0, #0x1
    str r0, [sp, #0xc]
    mov r0, #0x200
    str r0, [sp, #0x10]
    add r0, r4, #0x38
    str r0, [sp, #0x14]
    mov r0, r4
    add r1, r4, #0x4
    add r2, r4, #0x8
    mov r3, #0x100
    bl func_0201ef3c
    ldr r4, _LIT3
    bl func_0201e78c
    mov r0, #0x40
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    add r1, sp, #0x18
    str r1, [sp, #0x8]
    mov r0, #0x0
    str r0, [sp, #0xc]
    mov r0, #0x20
    str r0, [sp, #0x10]
    add r0, r4, #0x38
    str r0, [sp, #0x14]
    mov r0, r4
    add r1, r4, #0x4
    add r2, r4, #0x8
    mov r3, #0xf900
    bl func_0201ef3c
    add sp, sp, #0x38
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov008_021b229c
_LIT1: .word data_ov008_021b22ac
_LIT2: .word data_ov008_021b2c14
_LIT3: .word data_ov008_021b2c54
