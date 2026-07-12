; func_ov008_021aca9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02103fcc
        .extern data_ov008_021b2660
        .extern data_ov008_021b2b60
        .extern data_ov008_021b2ca0
        .extern func_ov008_021ab3a4
        .extern func_ov008_021abbfc
        .extern func_ov008_021ac4b0
        .extern func_ov008_021ac710
        .extern func_ov008_021ac934
        .global func_ov008_021aca9c
        .arm
func_ov008_021aca9c:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x10
    ldr r0, _LIT0
    ldr r0, [r0, #0x38]
    mov r0, r0, asr #0x4
    and r4, r0, #0x1
    bl func_ov008_021ac710
    ldr r0, _LIT1
    ldrh r0, [r0, #0x4]
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x18
    beq .L_3ec
    mov r0, #0x1f
    str r0, [sp]
    mov r0, #0x2
    mov r2, #0x0
    str r0, [sp, #0x4]
    mov r0, #0x400
    str r0, [sp, #0x8]
    mov r3, r2
    rsb r0, r4, #0x1
    mov r1, #0x3e
    str r2, [sp, #0xc]
    bl func_ov008_021ab3a4
.L_3ec:
    ldr r0, _LIT2
    ldrh r1, [r0, #0x5a]
    cmp r1, #0x6
    bls .L_444
    ldr r0, _LIT1
    sub r1, r1, #0x6
    ldrh r0, [r0, #0x4]
    mov r0, r0, lsl #0x18
    cmp r1, r0, lsr #0x18
    ble .L_444
    mov r0, #0x20
    str r0, [sp]
    mov r0, #0x2
    mov r2, #0x0
    str r0, [sp, #0x4]
    mov r0, #0x400
    str r0, [sp, #0x8]
    mov r3, r2
    add r0, r4, #0xef
    mov r1, #0x3e
    str r2, [sp, #0xc]
    bl func_ov008_021ab3a4
.L_444:
    ldr r0, _LIT3
    mov r2, #0x0
    ldr r0, [r0, #0x634]
    mov r3, r2
    tst r0, #0x4
    movne r0, #0x3
    moveq r0, #0x2
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, #0x400
    str r0, [sp, #0x8]
    mov r0, #0x2e
    mov r1, #0xa4
    str r2, [sp, #0xc]
    bl func_ov008_021ab3a4
    ldr r0, _LIT3
    mov r2, #0x0
    ldr r0, [r0, #0x634]
    mov r3, r2
    tst r0, #0x8
    movne r0, #0x5
    moveq r0, #0x4
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, #0x400
    str r0, [sp, #0x8]
    mov r0, #0x4a
    mov r1, #0xa4
    str r2, [sp, #0xc]
    bl func_ov008_021ab3a4
    ldr r1, _LIT1
    ldr r0, _LIT2
    ldrh r2, [r1, #0x4]
    ldrh r1, [r0, #0x5a]
    mov r0, r2, lsl #0x18
    mov r0, r0, lsr #0x18
    sub r1, r1, #0x6
    bl func_ov008_021ac934
    ldr r0, _LIT1
    ldrh r0, [r0, #0x4]
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x18
    bl func_ov008_021ac4b0
    bl func_ov008_021abbfc
    add sp, sp, #0x10
    ldmia sp!, {r4, pc}
_LIT0: .word data_02103fcc
_LIT1: .word data_ov008_021b2ca0
_LIT2: .word data_ov008_021b2b60
_LIT3: .word data_ov008_021b2660
