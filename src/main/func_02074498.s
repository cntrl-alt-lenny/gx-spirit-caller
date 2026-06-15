; func_02074498 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219eed8
        .extern data_0219eee8
        .extern data_0219eeec
        .extern data_0219eef8
        .extern data_0219ef0c
        .extern data_0219ef1c
        .extern data_0219ef34
        .extern data_0219ef90
        .extern data_0219f538
        .extern data_021a63d0
        .extern func_020745e0
        .extern func_020919d8
        .extern func_020945f4
        .global func_02074498
        .arm
func_02074498:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    ldr r5, _LIT1
    ldr r1, [r1]
    ldr r3, _LIT2
    cmp r1, #0x0
    mov r1, #0x0
    movne r6, #0x1
    ldr ip, _LIT3
    ldr r2, _LIT4
    moveq r6, #0x0
    ldr lr, _LIT0
    ldr r4, _LIT5
    cmp r6, #0x0
    str r1, [ip]
    str r1, [r3]
    str r1, [r3, #0x4]
    str r1, [r2]
    addeq sp, sp, #0x4
    str r0, [r5]
    str r1, [lr]
    str r1, [r4]
    ldmeqia sp!, {r4, r5, r6, r7, lr}
    bxeq lr
    ldr r0, _LIT6
    mov r2, #0x60
    bl func_020945f4
    ldr r0, _LIT7
    ldr r5, [r0, #0x8]
    cmp r5, #0x0
    beq .L_110
    mov r4, #0x0
.L_c0:
    ldr r1, [r5, #0xa4]
    cmp r1, #0x0
    beq .L_104
    ldr r0, [r1]
    cmp r0, #0x0
    beq .L_104
    ldrb r0, [r1, #0x8]
    cmp r0, #0xa
    beq .L_ec
    cmp r0, #0xb
    strneb r4, [r1, #0x8]
.L_ec:
    ldr r0, [r1, #0x4]
    cmp r0, #0x0
    beq .L_104
    str r4, [r1, #0x4]
    ldr r0, [r1]
    bl func_020919d8
.L_104:
    ldr r5, [r5, #0x68]
    cmp r5, #0x0
    bne .L_c0
.L_110:
    ldr r6, _LIT8
    mov r7, #0x0
    ldr r4, _LIT9
    mov r5, r7
.L_120:
    ldrh r0, [r6, #0x4]
    cmp r0, #0x0
    beq .L_13c
    ldr r0, [r6, #0x34]
    ldr r1, [r4]
    blx r1
    strh r5, [r6, #0x4]
.L_13c:
    add r7, r7, #0x1
    cmp r7, #0x8
    add r6, r6, #0x38
    blt .L_120
    bl func_020745e0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, lr}
    bx lr
_LIT0: .word data_0219ef1c
_LIT1: .word data_0219eed8
_LIT2: .word data_0219ef34
_LIT3: .word data_0219eee8
_LIT4: .word data_0219eeec
_LIT5: .word data_0219eef8
_LIT6: .word data_0219ef90
_LIT7: .word data_021a63d0
_LIT8: .word data_0219f538
_LIT9: .word data_0219ef0c
