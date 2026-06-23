; func_ov004_021cd9ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov004_0220b2a0
        .extern data_ov004_02291388
        .extern func_0201ca34
        .extern func_0201cfdc
        .extern func_0201d094
        .extern func_0201d2f8
        .extern func_0201d344
        .extern func_0202c06c
        .extern func_ov004_021c9cf4
        .extern func_ov004_021c9fc4
        .extern func_ov004_021ca0b8
        .extern func_ov004_021cbe58
        .extern func_ov004_021cbea4
        .extern func_ov004_021cc000
        .extern func_ov004_021cc55c
        .extern func_ov004_021cc89c
        .extern func_ov004_021cc950
        .extern func_ov004_021cd5e4
        .extern func_ov004_021cd844
        .extern func_ov004_021d86ac
        .extern func_ov004_021d8c6c
        .extern func_ov004_021d9000
        .global func_ov004_021cd9ac
        .arm
func_ov004_021cd9ac:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldr r4, _LIT0
    ldr r0, [r4, #0x54]
    cmp r0, #0x0
    bne .L_1c
    bl func_0201ca34
.L_1c:
    bl func_ov004_021cd844
    cmp r0, #0x0
    bne .L_1f8
    bl func_0201d2f8
    cmp r0, #0x0
    bne .L_1f8
    ldr r0, [r4, #0x54]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_1f8
    b .L_54
    b .L_a0
    b .L_11c
    b .L_17c
.L_54:
    mov r0, #0x0
    bl func_ov004_021cbe58
    ldr r0, [r4, #0x58]
    cmp r0, #0x0
    ldreq r0, [r4, #0x64]
    cmpeq r0, #0x0
    bne .L_90
    mov r0, #0xd6
    bl func_0202c06c
    mov r1, r0
    ldr r0, _LIT1
    mov r2, #0x12
    bl func_ov004_021d86ac
    mov r0, #0x1
    str r0, [r4, #0x58]
.L_90:
    mov r0, #0x0
    str r0, [r4, #0x64]
    bl func_ov004_021cc89c
    b .L_1f8
.L_a0:
    bl func_0201cfdc
    cmp r0, #0x0
    beq .L_c0
    cmp r0, #0x1
    beq .L_e4
    cmp r0, #0x3
    beq .L_f4
    b .L_f8
.L_c0:
    ldr r0, [r4, #0x70]
    add r0, r0, #0x1
    str r0, [r4, #0x70]
    cmp r0, #0x8
    blt .L_f8
    mov r0, #0x0
    str r0, [r4, #0x70]
    bl func_0201d344
    b .L_f8
.L_e4:
    mov r0, #0x0
    str r0, [r4, #0x54]
    str r0, [r4, #0x58]
    b .L_f8
.L_f4:
    bl func_ov004_021cc950
.L_f8:
    bl func_0201d094
    cmp r0, #0x0
    beq .L_110
    mov r0, #0x2
    bl func_ov004_021cbe58
    b .L_1f8
.L_110:
    mov r0, #0x1
    bl func_ov004_021cbe58
    b .L_1f8
.L_11c:
    bl func_0201cfdc
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_1f8
    b .L_16c
    b .L_16c
    b .L_1f8
    b .L_16c
    b .L_144
    b .L_154
.L_144:
    bl func_ov004_021cc55c
    mov r0, #0x3
    bl func_ov004_021cbe58
    b .L_1f8
.L_154:
    mov r0, #0x0
    bl func_ov004_021cc000
    ldr r0, [r4, #0x54]
    add r0, r0, #0x1
    str r0, [r4, #0x54]
    b .L_1f8
.L_16c:
    mov r0, #0x0
    str r0, [r4, #0x54]
    str r0, [r4, #0x58]
    b .L_1f8
.L_17c:
    bl func_0201cfdc
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    b .L_1f8
    b .L_1ec
    b .L_1ec
    b .L_1f8
    b .L_1ec
    b .L_1a4
    b .L_1ac
.L_1a4:
    bl func_ov004_021cc55c
    b .L_1f8
.L_1ac:
    ldr r0, [r4, #0x78]
    cmp r0, #0x1
    beq .L_1cc
    cmp r0, #0x2
    moveq r0, #0x0
    streq r0, [r4, #0x54]
    streq r0, [r4, #0x58]
    b .L_1e0
.L_1cc:
    ldr r0, [r4, #0x54]
    mov r1, #0x1
    add r0, r0, #0x1
    str r1, [r4, #0x48]
    str r0, [r4, #0x54]
.L_1e0:
    mov r0, #0x4
    bl func_ov004_021cbe58
    b .L_1f8
.L_1ec:
    mov r0, #0x0
    str r0, [r4, #0x54]
    str r0, [r4, #0x58]
.L_1f8:
    ldr r0, _LIT1
    bl func_ov004_021d8c6c
    bl func_ov004_021ca0b8
    bl func_ov004_021cd5e4
    ldr r0, _LIT1
    bl func_ov004_021d9000
    mov r1, #0x2
    str r1, [sp]
    mov r0, #0x1f
    str r0, [sp, #0x4]
    add r0, r4, #0xf90
    add r0, r0, #0x5000
    mov r2, #0x0
    mov r3, r2
    bl func_ov004_021c9fc4
    bl func_ov004_021cbea4
    mov r1, #0x2
    str r1, [sp]
    ldr r2, [r4, #0xa0]
    add r0, r4, #0xf90
    str r2, [sp, #0x4]
    add r0, r0, #0x5000
    mov r2, #0xe4
    mov r3, #0x3
    bl func_ov004_021c9fc4
    add r0, r4, #0xef0
    add r1, r0, #0x5000
    ldr r0, _LIT2
    mov r2, #0x4
    ldr r3, _LIT3
    bl func_ov004_021c9cf4
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov004_0220b2a0
_LIT1: .word data_ov004_02291388
_LIT2: .word 0x05000638
_LIT3: .word 0x00600100
