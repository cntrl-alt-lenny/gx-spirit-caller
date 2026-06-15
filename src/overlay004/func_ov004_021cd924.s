; func_ov004_021cd924 - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021040ac
        .extern data_02104c7a
        .extern data_02104c94
        .extern data_ov004_0220b500
        .extern data_ov004_022915e8
        .extern func_02007218
        .extern func_0201cbd8
        .extern func_02094688
        .extern func_020aadf8
        .extern func_ov004_021d8cd0
        .global func_ov004_021cd924
        .arm
func_ov004_021cd924:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x200
    add r1, sp, #0x0
    mov r0, #0x2
    ldr r4, _LIT0
    bl func_0201cbd8
    cmp r0, #0x0
    addeq sp, sp, #0x200
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [sp]
    cmp r0, #0x0
    beq .L_11b8
    cmp r0, #0x1
    beq .L_121c
    cmp r0, #0x13
    moveq r0, r4
    moveq r1, #0x2
    streq r1, [r0, #0x78]
    b .L_12b0
.L_11b8:
    add r1, r4, #0xd4
    add r0, sp, #0x2
    add r1, r1, #0x3c00
    mov r2, #0x54
    bl func_02094688
    add r0, r4, #0x3d00
    ldrh r0, [r0, #0x14]
    ldr r3, _LIT1
    add r1, r4, #0x3000
    str r0, [r3, #0xba4]
    ldrb ip, [r1, #0xce4]
    add r2, r4, #0xe5
    ldr r0, _LIT2
    strb ip, [r3, #0xbcd]
    ldr ip, [r1, #0xd18]
    add r1, r2, #0x3c00
    str ip, [r3, #0xba8]
    bl func_020aadf8
    bl func_02007218
    add r1, r4, #0x3000
    str r0, [r1, #0xce0]
    mov r2, r4
    mov r0, #0x1
    str r0, [r2, #0x74]
    b .L_12b0
.L_121c:
    mov r1, r4
    ldr r0, [r1, #0x44]
    cmp r0, #0x0
    beq .L_1244
    ldrh r3, [sp, #0x2]
    ldrh r2, [sp, #0x4]
    ldr r0, _LIT1
    str r3, [r1, #0x78]
    str r2, [r0, #0xba4]
    b .L_12a8
.L_1244:
    add r1, r4, #0xd4
    add r0, sp, #0x2
    add r1, r1, #0x3c00
    mov r2, #0x54
    bl func_02094688
    add r0, r4, #0x3d00
    ldrh r0, [r0, #0x14]
    ldr r3, _LIT1
    add r1, r4, #0x3000
    str r0, [r3, #0xba4]
    ldrb ip, [r1, #0xce4]
    add r2, r4, #0xe5
    ldr r0, _LIT3
    strb ip, [r3, #0xbcc]
    ldr ip, [r1, #0xd18]
    add r1, r2, #0x3c00
    str ip, [r3, #0xba8]
    bl func_020aadf8
    bl func_02007218
    add r1, r4, #0x3000
    mov r3, #0x1
    mov r2, r4
    str r0, [r1, #0xce0]
    str r3, [r1, #0xcd0]
    str r3, [r2, #0x78]
.L_12a8:
    ldr r0, _LIT4
    bl func_ov004_021d8cd0
.L_12b0:
    mov r0, #0x1
    add sp, sp, #0x200
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word data_021040ac
_LIT2: .word data_02104c94
_LIT3: .word data_02104c7a
_LIT4: .word data_ov004_022915e8
