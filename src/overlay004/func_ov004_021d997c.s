; func_ov004_021d997c - whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104bac
        .extern data_ov004_0220b500
        .extern func_02006110
        .extern func_02006164
        .extern func_0200617c
        .extern func_02006194
        .extern func_ov004_021d9724
        .extern func_ov004_021d9778
        .extern func_ov004_021d97c8
        .extern func_ov004_021d9810
        .extern func_ov004_021d9948
        .global func_ov004_021d997c
        .arm
func_ov004_021d997c:
    stmdb sp!, {r3, r4, r5, lr}
    sub sp, sp, #0x10
    ldr r4, _LIT0
    ldr r0, [r4, #0x5c]
    cmp r0, #0x0
    addne sp, sp, #0x10
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r0, [r4, #0x224]
    mov r1, #0x0
    str r1, [r4, #0x234]
    str r1, [r4, #0xa0]
    cmp r0, #0x0
    bne .L_144
    bl func_02006194
    cmp r0, #0x0
    bne .L_4c
    bl func_0200617c
    cmp r0, #0x0
    beq .L_ec
.L_4c:
    add r0, sp, #0xc
    add r1, sp, #0x8
    bl func_02006110
    ldr r1, [sp, #0x8]
    cmp r1, #0x58
    blt .L_134
    cmp r1, #0x8c
    bge .L_134
    ldr r0, [sp, #0xc]
    cmp r0, #0x2e
    blt .L_134
    cmp r0, #0xd2
    bge .L_134
    sub lr, r1, #0x58
    ldr r1, _LIT1
    mov r3, lr, lsr #0x1f
    smull r0, ip, r1, lr
    smull r0, r5, r1, lr
    add ip, r3, ip, asr #0x3
    mov r2, #0x1a
    smull r0, r1, r2, ip
    sub ip, lr, r0
    cmp ip, #0x15
    add r5, r3, r5, asr #0x3
    bge .L_134
    bl func_02006164
    cmp r0, #0x0
    beq .L_c4
    mov r0, r5
    bl func_ov004_021d9724
.L_c4:
    ldr r0, [r4, #0x22c]
    cmp r0, r5
    bne .L_134
    mov r0, #0x1
    str r0, [r4, #0x234]
    bl func_0200617c
    cmp r0, #0x0
    beq .L_134
    bl func_ov004_021d9778
    b .L_134
.L_ec:
    ldr r0, _LIT2
    ldrh r1, [r0, #0x54]
    tst r1, #0x1
    beq .L_104
    bl func_ov004_021d9778
    b .L_134
.L_104:
    ldrh r0, [r0, #0x56]
    tst r0, #0xc0
    beq .L_134
    tst r0, #0x40
    beq .L_124
    mov r0, #0x0
    bl func_ov004_021d9724
    b .L_134
.L_124:
    tst r0, #0x80
    beq .L_134
    mov r0, #0x1
    bl func_ov004_021d9724
.L_134:
    bl func_ov004_021d9810
    add sp, sp, #0x10
    str r0, [r4, #0xa0]
    ldmia sp!, {r3, r4, r5, pc}
.L_144:
    bl func_ov004_021d9948
    cmp r0, #0x0
    addne sp, sp, #0x10
    ldmneia sp!, {r3, r4, r5, pc}
    bl func_02006194
    cmp r0, #0x0
    bne .L_16c
    bl func_0200617c
    cmp r0, #0x0
    beq .L_1f0
.L_16c:
    add r0, sp, #0x4
    add r1, sp, #0x0
    bl func_02006110
    ldr r2, [sp]
    cmp r2, #0x58
    addlt sp, sp, #0x10
    ldmltia sp!, {r3, r4, r5, pc}
    cmp r2, #0x8c
    addge sp, sp, #0x10
    ldmgeia sp!, {r3, r4, r5, pc}
    ldr r0, [sp, #0x4]
    cmp r0, #0x2e
    addlt sp, sp, #0x10
    ldmltia sp!, {r3, r4, r5, pc}
    cmp r0, #0xd2
    addge sp, sp, #0x10
    ldmgeia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT1
    sub r2, r2, #0x58
    smull r0, r3, r1, r2
    mov r0, r2, lsr #0x1f
    ldr r1, [r4, #0x22c]
    add r3, r0, r3, asr #0x3
    cmp r1, r3
    addeq sp, sp, #0x10
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_0200617c
    cmp r0, #0x0
    addeq sp, sp, #0x10
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov004_021d97c8
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
.L_1f0:
    ldr r0, _LIT2
    ldrh r0, [r0, #0x54]
    tst r0, #0x2
    addeq sp, sp, #0x10
    ldmeqia sp!, {r3, r4, r5, pc}
    bl func_ov004_021d97c8
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov004_0220b500
_LIT1: .word 0x4ec4ec4f
_LIT2: .word data_02104bac
