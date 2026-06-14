; func_ov009_021ab1bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov009_021ad83c
        .extern data_ov009_021ad960
        .extern data_ov009_021ad978
        .extern data_ov009_021adc00
        .extern func_02006c0c
        .extern func_02006e1c
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_0201e7e0
        .extern func_0201ef90
        .extern func_0202c948
        .extern func_02094504
        .global func_ov009_021ab1bc
        .arm
func_ov009_021ab1bc:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x50
    ldr r1, _LIT0
    mov r4, r0
    mov r0, #0x0
    mov r2, #0x48
    bl func_02094504
    mov r2, #0x0
    str r2, [r4, #0x4]
    str r2, [r4, #0xc]
    strb r2, [r4, #0x14]
    mov r0, #0x1
    mov r1, #0x2
    str r2, [r4, #0x8]
    bl func_0202c948
    add r0, sp, #0x28
    bl func_0201d47c
    ldr r0, _LIT1
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x28]
    mov r0, #0x0
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x34]
    strh r0, [sp, #0x38]
    bic r0, r1, #0xf
    orr r0, r0, #0x3
    strh r0, [sp, #0x3c]
    ldrh r2, [sp, #0x3c]
    ldr r1, [sp, #0x40]
    add r0, sp, #0x28
    bic r1, r1, #0x1c000
    orr r2, r2, #0x10
    orr r1, r1, #0xc000
    strh r2, [sp, #0x3c]
    str r1, [sp, #0x40]
    bl func_0201e5b8
    ldr r0, [sp, #0x28]
    bl func_02006e1c
    add r0, sp, #0x28
    bl func_0201d47c
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x28]
    mov r0, #0x0
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x34]
    bic r0, r1, #0xf
    orr r0, r0, #0x4
    strh r0, [sp, #0x3c]
    mov r0, #0x80
    ldrh r1, [sp, #0x3c]
    strh r0, [sp, #0x38]
    bic r0, r1, #0x10
    strh r0, [sp, #0x3c]
    add r0, sp, #0x28
    bl func_0201e5b8
    ldr r0, [sp, #0x28]
    bl func_02006e1c
    ldr r0, _LIT3
    add ip, sp, #0x18
    ldmia r0, {r0, r1, r2, r3}
    stmia ip, {r0, r1, r2, r3}
    bl func_0201e7e0
    mov r2, #0x0
    str r2, [sp]
    mov r0, #0x1
    str r0, [sp, #0x4]
    add r1, sp, #0x18
    str r1, [sp, #0x8]
    str r2, [sp, #0xc]
    mov r0, #0x80
    str r0, [sp, #0x10]
    add r0, r4, #0x40
    str r0, [sp, #0x14]
    add r0, r4, #0x34
    add r1, r4, #0x38
    add r2, r4, #0x3c
    mov r3, #0xc00
    bl func_0201ef90
    mov r0, #0x1
    add sp, sp, #0x50
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov009_021adc00
_LIT1: .word data_ov009_021ad960
_LIT2: .word data_ov009_021ad978
_LIT3: .word data_ov009_021ad83c
