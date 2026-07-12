; func_ov008_021ac934 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2660
        .extern data_ov008_021b2b60
        .extern func_020b377c
        .extern func_ov008_021ab3a4
        .global func_ov008_021ac934
        .arm
func_ov008_021ac934:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r2, #0x15
    str r2, [sp]
    mov r3, #0x2
    mov r6, r0
    mov r5, r1
    mov r2, #0x0
    str r3, [sp, #0x4]
    mov r0, #0x400
    str r0, [sp, #0x8]
    mov r3, r2
    mov r0, #0x1b
    mov r1, #0x7e
    str r2, [sp, #0xc]
    mov r4, #0x28
    bl func_ov008_021ab3a4
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r0, [r0, #0x634]
    mov r3, r2
    tst r0, #0x10
    movne r0, #0xa
    moveq r0, #0x9
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, #0x400
    str r0, [sp, #0x8]
    mov r0, #0x13
    mov r1, #0x7e
    str r2, [sp, #0xc]
    bl func_ov008_021ab3a4
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r0, [r0, #0x634]
    mov r3, r2
    tst r0, #0x20
    movne r0, #0xc
    moveq r0, #0xb
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, #0x400
    str r0, [sp, #0x8]
    mov r0, #0xd3
    mov r1, #0x7e
    str r2, [sp, #0xc]
    bl func_ov008_021ab3a4
    ldr r0, _LIT1
    ldrh r0, [r0, #0x5a]
    cmp r0, #0x6
    addls sp, sp, #0x10
    ldmlsia sp!, {r4, r5, r6, pc}
    cmp r6, #0x0
    moveq r4, #0x28
    beq .L_33c
    cmp r6, r5
    moveq r4, #0xbe
    beq .L_33c
    mov r0, #0x96
    mul r0, r6, r0
    mov r1, r5
    bl func_020b377c
    add r4, r4, r0
    cmp r4, #0x28
    movlt r4, #0x28
    blt .L_33c
    cmp r4, #0xbe
    movgt r4, #0xbe
.L_33c:
    ldr r0, _LIT0
    mov r2, #0x0
    ldr r0, [r0, #0x634]
    mov r3, r2
    tst r0, #0x100
    movne r0, #0x12
    moveq r0, #0x11
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, #0x400
    str r0, [sp, #0x8]
    mov r0, r4
    mov r1, #0x7e
    str r2, [sp, #0xc]
    bl func_ov008_021ab3a4
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov008_021b2660
_LIT1: .word data_ov008_021b2b60
