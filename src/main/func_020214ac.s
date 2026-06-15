; func_020214ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern data_02194340
        .extern func_02021a3c
        .extern func_02021cbc
        .extern func_02023574
        .extern func_020240a0
        .extern func_020245e8
        .extern func_02027144
        .extern func_02028804
        .extern func_0202a2f8
        .global func_020214ac
        .arm
func_020214ac:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    movs r5, r0
    mov r4, r1
    ldr r2, _LIT0
    bne .L_54
    ldr r1, [r2, #0x4]
    ldr r0, _LIT1
    add r2, r2, #0x34
    mla r5, r1, r0, r2
.L_54:
    ldr r0, [r5, #0x14]
    mov r6, #0x0
    cmp r0, #0x0
    ble .L_f8
    add r7, r5, #0x18
.L_68:
    ldr r0, [r7]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_e4
    b .L_94
    b .L_a0
    b .L_ac
    b .L_b8
    b .L_c4
    b .L_d0
    b .L_dc
.L_94:
    ldr r0, [r7, #0x4]
    bl func_02021cbc
    b .L_e4
.L_a0:
    ldr r0, [r7, #0x4]
    bl func_02023574
    b .L_e4
.L_ac:
    ldr r0, [r7, #0x4]
    bl func_020240a0
    b .L_e4
.L_b8:
    ldr r0, [r7, #0x4]
    bl func_020245e8
    b .L_e4
.L_c4:
    ldr r0, [r7, #0x4]
    bl func_02027144
    b .L_e4
.L_d0:
    ldr r0, [r7, #0x4]
    bl func_02028804
    b .L_e4
.L_dc:
    ldr r0, [r7, #0x4]
    bl func_0202a2f8
.L_e4:
    ldr r0, [r5, #0x14]
    add r6, r6, #0x1
    cmp r6, r0
    add r7, r7, #0xc
    blt .L_68
.L_f8:
    ldr r2, _LIT1
    mov r1, r5
    mov r0, #0x0
    bl Fill32
    mov r1, r4
    str r4, [r5, #0x4]
.L_110:
    ldr r0, [r1]
    movs r0, r0, lsr #0x18
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r0, #0xf1
    bne .L_138
    mov r0, r5
    bl func_02021a3c
    str r0, [r5, #0x14]
    b .L_140
.L_138:
    add r1, r1, #0x4
    b .L_110
.L_140:
    ldr r1, [r5, #0x8]
    mov r0, #0x1
    orr r1, r1, #0x8
    str r1, [r5, #0x8]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_02194340
_LIT1: .word 0x00000618
