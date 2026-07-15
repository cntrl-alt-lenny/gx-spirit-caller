; func_ov009_021ac134 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov009_021ad778
        .extern data_ov009_021ada28
        .extern data_ov009_021ada48
        .extern data_ov009_021ada64
        .extern data_ov009_021ada80
        .extern data_ov009_021ada9c
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0201d428
        .extern func_0201e564
        .extern func_0201e78c
        .extern func_0201ef3c
        .global func_ov009_021ac134
        .arm
func_ov009_021ac134:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x50
    mov r4, r0
    add r0, sp, #0x28
    bl func_0201d428
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    ldrh r1, [sp, #0x3c]
    mov r2, #0x0
    str r0, [sp, #0x28]
    bic r0, r1, #0xf
    orr r0, r0, #0x8
    strh r0, [sp, #0x3c]
    ldrh r1, [sp, #0x3c]
    add r0, sp, #0x28
    str r2, [sp, #0x34]
    bic r1, r1, #0x10
    strh r1, [sp, #0x3c]
    strh r2, [sp, #0x38]
    str r2, [sp, #0x30]
    bl func_0201e564
    ldr r0, [sp, #0x28]
    bl func_02006e00
    add r0, sp, #0x28
    bl func_0201d428
    ldr r0, _LIT1
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp, #0x28]
    mov r0, #0x2bc0
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x34]
    bic r0, r1, #0xf
    orr r0, r0, #0x6
    strh r0, [sp, #0x3c]
    ldrh r1, [sp, #0x3c]
    mov r0, #0x100
    strh r0, [sp, #0x38]
    rsb r0, r0, #0xff
    bic r1, r1, #0x10
    str r0, [sp, #0x30]
    add r0, sp, #0x28
    strh r1, [sp, #0x3c]
    bl func_0201e564
    ldr r0, [sp, #0x28]
    bl func_02006e00
    add r0, sp, #0x28
    bl func_0201d428
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp, #0x28]
    mov r0, #0x0
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x34]
    strh r0, [sp, #0x38]
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x3c]
    ldrh r1, [sp, #0x3c]
    add r0, sp, #0x28
    bic r1, r1, #0x10
    strh r1, [sp, #0x3c]
    bl func_0201e564
    ldr r0, [sp, #0x28]
    bl func_02006e00
    add r0, sp, #0x28
    bl func_0201d428
    ldr r0, _LIT3
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp, #0x28]
    mov r0, #0x600
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x34]
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x3c]
    mov r0, #0x20
    ldrh r1, [sp, #0x3c]
    strh r0, [sp, #0x38]
    bic r0, r1, #0x10
    strh r0, [sp, #0x3c]
    add r0, sp, #0x28
    bl func_0201e564
    ldr r0, [sp, #0x28]
    bl func_02006e00
    add r0, sp, #0x28
    bl func_0201d428
    ldr r0, _LIT4
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    str r0, [sp, #0x28]
    mov r0, #0x1600
    ldrh r1, [sp, #0x3c]
    str r0, [sp, #0x34]
    bic r0, r1, #0xf
    orr r0, r0, #0x9
    strh r0, [sp, #0x3c]
    mov r0, #0x40
    ldrh r1, [sp, #0x3c]
    strh r0, [sp, #0x38]
    bic r0, r1, #0x10
    strh r0, [sp, #0x3c]
    add r0, sp, #0x28
    bl func_0201e564
    ldr r0, [sp, #0x28]
    bl func_02006e00
    ldr r0, _LIT5
    add ip, sp, #0x18
    ldmia r0, {r0, r1, r2, r3}
    stmia ip, {r0, r1, r2, r3}
    bl func_0201e78c
    mov r0, #0x0
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    add r1, sp, #0x18
    str r1, [sp, #0x8]
    mov r0, #0x1
    str r0, [sp, #0xc]
    mov r0, #0x200
    str r0, [sp, #0x10]
    add r0, r4, #0x10
    str r0, [sp, #0x14]
    add r0, r4, #0x4
    add r1, r4, #0x8
    add r2, r4, #0xc
    mov r3, #0x2200
    bl func_0201ef3c
    mov r0, #0x1
    add sp, sp, #0x50
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov009_021ada28
_LIT1: .word data_ov009_021ada48
_LIT2: .word data_ov009_021ada64
_LIT3: .word data_ov009_021ada80
_LIT4: .word data_ov009_021ada9c
_LIT5: .word data_ov009_021ad778
