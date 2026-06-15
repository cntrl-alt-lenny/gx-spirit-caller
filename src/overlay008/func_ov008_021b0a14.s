; func_ov008_021b0a14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_ov008_021b2780
        .extern data_ov008_021b2de4
        .extern func_02005dac
        .extern func_020944a4
        .extern func_ov008_021ab484
        .extern func_ov008_021abcdc
        .extern func_ov008_021ac0b8
        .extern func_ov008_021afc2c
        .extern func_ov008_021afec8
        .extern func_ov008_021b23ac
        .global func_ov008_021b0a14
        .arm
func_ov008_021b0a14:
    stmdb sp!, {r3, lr}
    sub sp, sp, #0x18
    ldr r0, _LIT0
    ldrh r0, [r0, #0x2]
    bl func_ov008_021afc2c
    bl func_ov008_021afec8
    ldr r0, _LIT0
    ldrh r1, [r0, #0xa8]
    ldrh r0, [r0]
    cmp r1, #0x3
    sub r1, r1, #0x3
    bls .L_698
    mov r2, #0x1
    bl func_ov008_021ac0b8
    b .L_6a0
.L_698:
    mov r2, #0x0
    bl func_ov008_021ac0b8
.L_6a0:
    ldr r0, _LIT0
    ldr r1, [r0, #0xb4]
    cmp r1, #0x0
    beq .L_6f4
    ldr r0, _LIT1
    mov r2, #0x0
    ldr r0, [r0, #0x634]
    mov r3, r2
    tst r0, #0x1
    movne r0, #0x8
    moveq r0, #0x7
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, #0x400
    str r0, [sp, #0x8]
    mov r0, #0xe3
    mov r1, #0xa4
    str r2, [sp, #0xc]
    bl func_ov008_021ab484
    b .L_794
.L_6f4:
    ldr r0, [r0, #0xac]
    cmp r0, #0x0
    bne .L_744
    ldr r0, _LIT1
    mov r2, #0x0
    ldr r0, [r0, #0x634]
    mov r3, r2
    tst r0, #0x200
    movne r0, #0x25
    moveq r0, #0x24
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, #0x400
    str r0, [sp, #0x8]
    mov r0, #0x56
    mov r1, #0xa4
    str r2, [sp, #0xc]
    bl func_ov008_021ab484
    b .L_794
.L_744:
    ldr r0, _LIT2
    ldr r3, _LIT3
    ldr r0, [r0, #0x38]
    mov r1, #0x0
    mov r0, r0, asr #0x4
    and r0, r0, #0x3
    cmp r0, #0x3
    moveq r0, #0x2
    mov r0, r0, lsl #0x3
    add r0, r0, #0x93
    add r0, r0, #0x200
    orr r2, r0, #0x3000
    mov r0, #0x2
    str r3, [sp, #0x10]
    strh r2, [sp, #0x14]
    bl func_02005dac
    mov r1, r0
    add r0, sp, #0x10
    mov r2, #0x8
    bl func_020944a4
.L_794:
    bl func_ov008_021b23ac
    cmp r0, #0x0
    beq .L_7e0
    ldr r0, _LIT1
    mov r1, #0x0
    ldr r0, [r0, #0x634]
    mov r2, r1
    tst r0, #0x400
    movne r0, #0x18
    moveq r0, #0x17
    str r0, [sp]
    mov r0, #0x2
    str r0, [sp, #0x4]
    mov r0, #0x400
    str r0, [sp, #0x8]
    mov r3, r1
    mov r0, #0xe3
    str r1, [sp, #0xc]
    bl func_ov008_021ab484
.L_7e0:
    ldr r0, _LIT1
    ldr r1, [r0, #0x634]
    bic r1, r1, #0x400
    str r1, [r0, #0x634]
    bl func_ov008_021abcdc
    add sp, sp, #0x18
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov008_021b2de4
_LIT1: .word data_ov008_021b2780
_LIT2: .word data_021040ac
_LIT3: .word 0x80e320a4
