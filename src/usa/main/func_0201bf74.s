; func_0201bf74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_02102b84
        .extern data_02104e6c
        .extern func_020189f8
        .extern func_02018ca8
        .extern func_02018e0c
        .extern func_02018f4c
        .extern func_02018f5c
        .extern func_020193f8
        .extern func_02019648
        .extern func_0201a13c
        .extern func_0201a36c
        .extern func_0201bf40
        .extern func_0201c1d0
        .global func_0201bf74
        .arm
func_0201bf74:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    bl GetSystemWork
    mov r4, r0
    bl func_020189f8
    ldr r1, [r4, #0x820]
    mov r5, r0
    tst r1, #0x10
    mov r7, #0x0
    beq .L_44
    mov r1, r5
    add r0, r4, #0x810
    bl func_0201c1d0
    mov r0, r5
    mov r1, #0x1
    bl func_02018e0c
    bl func_0201a36c
    b .L_c4
.L_44:
    tst r1, #0x80
    movne r8, r7
    moveq r8, #0x1
    mov r0, r5
    moveq r7, r8
    bl func_02018ca8
    cmp r0, #0x0
    beq .L_a8
    ldr r0, [r4, #0x820]
    tst r0, #0x200
    bne .L_a8
    mov r0, r5
    bl func_020193f8
    cmp r0, #0x0
    bne .L_a8
    bl func_02018f4c
    mov r6, r0
    bl func_02018f5c
    mov r1, r0
    mov r0, r6
    mov r2, r5
    mov r3, #0x5
    .word 0xeb065c22
    cmp r0, #0x0
    movne r8, #0x5
.L_a8:
    mov r0, r5
    mov r1, #0x1
    bl func_02018e0c
    mov r0, r5
    mov r1, r8
    bl func_0201bf40
    str r0, [r4, #0x810]
.L_c4:
    cmp r7, #0x0
    beq .L_1a4
    mov r0, #0x4
    bl func_0201a13c
    mov r1, #0x2
    str r1, [r4, #0x918]
    ldr r1, [r4, #0x820]
    tst r1, #0x200
    beq .L_100
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x938]
    mov r0, #0x1
    str r0, [r4, #0x814]
    b .L_180
.L_100:
    cmp r0, #0x0
    beq .L_16c
    ldr r3, _LIT1
    mov r2, #0x0
    ldr ip, [r3]
    ldmib r3, {r1, lr}
    umull r7, r6, lr, ip
    mla r6, lr, r1, r6
    ldr r1, [r3, #0xc]
    ldr lr, [r3, #0x10]
    mla r6, r1, ip, r6
    ldr r1, [r3, #0x14]
    adds r7, lr, r7
    adc r6, r1, r6
    mov r1, #0x65
    umull ip, lr, r6, r1
    mla lr, r6, r2, lr
    mla lr, r2, r1, lr
    str r7, [r3]
    str r6, [r3, #0x4]
    cmp lr, r0
    bcs .L_16c
    ldr r0, _LIT0
    mov r1, #0x1
    str r1, [r0, #0x938]
    str r1, [r4, #0x918]
    b .L_180
.L_16c:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x938]
    mov r0, #0x1
    str r0, [r4, #0x814]
.L_180:
    ldr r1, [r4, #0x824]
    and r0, r5, #0xff
    bic r1, r1, #0xff
    orr r0, r1, r0
    str r0, [r4, #0x824]
    ldr r0, [r4, #0x82c]
    bic r0, r0, #0x1f0000
    str r0, [r4, #0x82c]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1a4:
    mov r0, #0x0
    str r0, [r4, #0x820]
    str r0, [r4, #0x814]
    str r0, [r4, #0x918]
    ldr r1, [r4, #0x824]
    bic r1, r1, #0xff
    str r1, [r4, #0x824]
    bl func_02019648
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_02104e6c
_LIT1: .word data_02102b84
