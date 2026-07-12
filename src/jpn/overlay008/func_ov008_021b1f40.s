; func_ov008_021b1f40 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020f84f0
        .extern data_ov008_021b25ec
        .extern data_ov008_021b2624
        .extern data_ov008_021b2660
        .extern func_02006bf0
        .extern func_02006e00
        .extern func_0200acf0
        .extern func_0200f838
        .extern func_0201d428
        .extern func_0201e564
        .extern func_02021010
        .extern func_0202113c
        .extern func_02021160
        .extern func_02021174
        .extern func_02021428
        .extern func_0202c8f4
        .extern func_02094410
        .global func_ov008_021b1f40
        .arm
func_ov008_021b1f40:
    stmdb sp!, {r3, r4, lr}
    sub sp, sp, #0x2c
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r1, [r1]
    mov r2, #0x90
    bl func_02094410
    ldr r1, _LIT0
    mov ip, #0x0
    ldr r2, [r1]
    ldr r0, _LIT1
    str ip, [r2, #0xc]
    ldrh r4, [r0, #0x10]
    ldr r2, [r1]
    mov r3, #0x100
    str r4, [r2, #0x10]
    ldr r2, [r1]
    str r3, [r2, #0x1c]
    ldr r2, [r1]
    strb ip, [r2, #0x70]
    ldr r2, [r0, #0x14]
    ldr r0, [r1]
    str r2, [r0, #0x14]
    bl func_02021010
    mov r0, #0x0
    mov r1, #0x1
    bl func_0202113c
    mov r0, #0x3
    mov r1, #0x8
    bl func_02021160
    mov r0, #0x8
    bl func_0200acf0
    mov r0, #0x3000
    str r0, [sp]
    mov r0, #0x3
    mov r1, #0x10
    mov r2, #0x18000
    mov r3, #0x0
    bl func_0200f838
    mov r0, #0x1
    mov r1, #0x2
    bl func_0202c8f4
    ldr r0, _LIT2
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006bf0
    mov r4, r0
    add r0, sp, #0x4
    bl func_0201d428
    mvn r0, #0x0
    ldrh r1, [sp, #0x18]
    str r0, [sp, #0xc]
    str r4, [sp, #0x4]
    bic r0, r1, #0xf
    orr r0, r0, #0x1
    strh r0, [sp, #0x18]
    mov r0, #0x5200
    str r0, [sp, #0x10]
    mov r0, #0x80
    strh r0, [sp, #0x14]
    add r0, sp, #0x4
    bl func_0201e564
    mov r0, r4
    bl func_02006e00
    ldr r0, _LIT3
    bl func_02021174
    ldr r1, _LIT0
    ldr r2, [r1]
    str r0, [r2]
    ldr r0, [r1]
    ldr r0, [r0]
    bl func_02021428
    add sp, sp, #0x2c
    ldmia sp!, {r3, r4, pc}
_LIT0: .word data_ov008_021b25ec
_LIT1: .word data_ov008_021b2660
_LIT2: .word data_ov008_021b2624
_LIT3: .word data_020f84f0
