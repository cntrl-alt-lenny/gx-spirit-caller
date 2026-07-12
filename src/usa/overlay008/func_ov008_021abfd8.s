; func_ov008_021abfd8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2660
        .extern func_020b377c
        .extern func_ov008_021ab3a4
        .global func_ov008_021abfd8
        .arm
func_ov008_021abfd8:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    cmp r2, #0x0
    mov r4, #0x2e
    beq .L_88
    cmp r0, #0x0
    beq .L_48
    cmp r0, r1
    moveq r4, #0x6d
    beq .L_48
    rsb r0, r0, r0, lsl #0x6
    bl func_020b377c
    add r4, r4, r0
    cmp r4, #0x2e
    movlt r4, #0x2e
    blt .L_48
    cmp r4, #0x6d
    movgt r4, #0x6d
.L_48:
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r0, [r0, #0x634]
    mov r1, r4
    tst r0, #0x100
    movne r0, #0x14
    moveq r0, #0x13
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, #0x400
    str r0, [sp, #0x8]
    mov r3, r2
    mov r0, #0xdc
    str r2, [sp, #0xc]
    bl func_ov008_021ab3a4
.L_88:
    mov r0, #0x16
    str r0, [sp]
    mov r0, #0x2
    mov r2, #0x0
    str r0, [sp, #0x4]
    mov r0, #0x400
    str r0, [sp, #0x8]
    mov ip, #0x1
    mov r3, r2
    mov r0, #0xdc
    mov r1, #0x29
    str ip, [sp, #0xc]
    bl func_ov008_021ab3a4
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r0, [r0, #0x634]
    mov r3, r2
    tst r0, #0x40
    movne r0, #0xe
    moveq r0, #0xd
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, #0x400
    str r0, [sp, #0x8]
    mov ip, #0x1
    mov r0, #0xdc
    mov r1, #0x19
    str ip, [sp, #0xc]
    bl func_ov008_021ab3a4
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r0, [r0, #0x634]
    mov r3, r2
    tst r0, #0x80
    movne r0, #0x10
    moveq r0, #0xf
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, #0x400
    str r0, [sp, #0x8]
    mov ip, #0x1
    mov r0, #0xdc
    mov r1, #0x82
    str ip, [sp, #0xc]
    bl func_ov008_021ab3a4
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov008_021b2660
