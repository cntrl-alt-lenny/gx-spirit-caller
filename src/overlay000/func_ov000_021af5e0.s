; func_ov000_021af5e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021b569c
        .extern data_ov000_021c758c
        .extern func_02006c0c
        .extern func_0201d47c
        .extern func_0201e5b8
        .extern func_ov000_021ab4bc
        .extern func_ov000_021ab62c
        .global func_ov000_021af5e0
        .arm
func_ov000_021af5e0:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x40
    ldr lr, _LIT0
    add ip, sp, #0x0
    mov r5, r0
    mov r4, r1
    ldmia lr!, {r0, r1, r2, r3}
    stmia ip!, {r0, r1, r2, r3}
    ldmia lr, {r0, r1}
    stmia ip, {r0, r1}
    ldr r0, _LIT1
    mov r2, r4, lsl #0x1f
    ldr r3, [r0, #0x2ac]
    mov r1, r5, lsl #0x1c
    bic r3, r3, #0x1
    str r3, [r0, #0x2ac]
    ldr ip, [r0, #0x34]
    ldr r3, _LIT2
    bic ip, ip, #0x1000
    orr r2, ip, r2, lsr #0x13
    bic r2, r2, #0xf00
    orr r1, r2, r1, lsr #0x14
    str r1, [r0, #0x34]
    ldrh r2, [r3]
    mov r0, #0x1
    mov r1, #0x4
    and r2, r2, #0x43
    orr ip, r2, #0x8
    orr ip, ip, #0x400
    mov r2, #0x0
    strh ip, [r3]
    bl func_ov000_021ab62c
    add r0, sp, #0x18
    bl func_0201d47c
    ldr r0, _LIT1
    add r2, sp, #0x0
    ldr r0, [r0, #0x34]
    mov r1, #0x4
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1c
    ldr r0, [r2, r0, lsl #0x2]
    mov r2, #0x0
    bl func_02006c0c
    str r0, [sp, #0x18]
    mvn r0, #0x0
    ldrh r2, [sp, #0x2c]
    str r0, [sp, #0x20]
    ldr r1, [sp, #0x30]
    bic r0, r2, #0xf
    orr r0, r0, #0x7
    strh r0, [sp, #0x2c]
    bic r0, r1, #0x7f
    bic r0, r0, #0x3f80
    ldrh r1, [sp, #0x2c]
    str r0, [sp, #0x30]
    mov r0, #0x0
    str r0, [sp, #0x24]
    mov r0, #0xc0
    strh r0, [sp, #0x28]
    bic r1, r1, #0x10
    add r0, sp, #0x18
    strh r1, [sp, #0x2c]
    bl func_0201e5b8
    mov r0, #0x1
    mov r1, #0x4
    bl func_ov000_021ab4bc
    ldr r0, _LIT1
    ldr r1, _LIT3
    ldr r3, [r0, #0x34]
    mov r2, #0x0
    bic r3, r3, #0xff
    orr r3, r3, #0xff
    str r3, [r0, #0x34]
    str r2, [r1]
    add sp, sp, #0x40
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov000_021b569c
_LIT1: .word data_ov000_021c758c
_LIT2: .word 0x0400100c
_LIT3: .word 0x04001018
