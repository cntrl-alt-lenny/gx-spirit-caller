; func_0201c6a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern data_020c5d90
        .extern data_02104f4c
        .extern func_02013a64
        .extern func_02018a2c
        .extern func_02018b34
        .extern func_0201942c
        .extern func_020195ec
        .extern func_02019664
        .extern func_0201967c
        .extern func_020196b0
        .extern func_020196d8
        .extern func_0201bba4
        .extern func_0201bc3c
        .extern func_0201bddc
        .extern func_0201bfb4
        .extern func_0201c1bc
        .extern func_0201c2a8
        .extern func_0201c498
        .extern func_0201c560
        .extern func_0201c5b4
        .extern func_0201c64c
        .global func_0201c6a0
        .arm
func_0201c6a0:
    stmdb sp!, {r3, r4, r5, lr}
    bl GetSystemWork
    mov r4, r0
    ldr r0, [r4, #0x8e8]
    bic r0, r0, #0x80000
    bic r0, r0, #0x100000
    str r0, [r4, #0x8e8]
    ldr r0, [r4, #0x918]
    cmp r0, #0x4
    addls pc, pc, r0, lsl #0x2
    b .L_688
    b .L_688
    b .L_5a8
    b .L_5e8
    b .L_524
    b .L_550
.L_524:
    ldr r0, [r4, #0x820]
    tst r0, #0x10000
    beq .L_53c
    mov r0, #0x10000
    mov r1, #0x1
    bl func_0201bc3c
.L_53c:
    mov r0, #0x0
    str r0, [r4, #0x814]
    str r0, [r4, #0x918]
    str r0, [r4, #0x820]
    b .L_7d0
.L_550:
    ldr r0, [r4, #0x820]
    tst r0, #0x8000
    beq .L_578
    mov r0, #0x8000
    mov r1, #0x1
    bl func_0201bc3c
    mov r0, #0x0
    str r0, [r4, #0x918]
    str r0, [r4, #0x820]
    b .L_59c
.L_578:
    tst r0, #0x20000
    beq .L_59c
    mov r0, #0x20000
    mov r1, #0x1
    bl func_0201bc3c
    mov r0, #0x3
    str r0, [r4, #0x918]
    mov r0, #0x10000
    str r0, [r4, #0x820]
.L_59c:
    mov r0, #0x0
    str r0, [r4, #0x814]
    b .L_7d0
.L_5a8:
    ldr r0, _LIT0
    ldr r0, [r0, #0x938]
    cmp r0, #0x1
    bne .L_5cc
    mov r0, #0x2
    str r0, [r4, #0x918]
    mov r0, #0x1
    str r0, [r4, #0x814]
    b .L_5dc
.L_5cc:
    mov r0, #0x0
    str r0, [r4, #0x814]
    str r0, [r4, #0x918]
    bl func_0201967c
.L_5dc:
    mov r0, #0x0
    str r0, [r4, #0x810]
    b .L_7d0
.L_5e8:
    bl func_020195ec
    ldr r1, [r4, #0x824]
    mov r5, r0
    mov r0, r1, lsl #0x18
    mov r0, r0, lsr #0x18
    bl func_0201c498
    ldr r0, [r4, #0x824]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    bl func_0201c5b4
    bl func_0201c560
    ldr r0, [r4, #0x824]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    bl func_0201c64c
    add r0, r4, #0x810
    bl func_0201c2a8
    mov r0, #0x0
    str r0, [r4, #0x814]
    str r0, [r4, #0x918]
    str r0, [r4, #0x820]
    ldr r0, [r4, #0x824]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    bl func_0201942c
    cmp r0, #0x0
    ldr r0, [r4, #0x8e8]
    orrne r0, r0, #0x100000
    orreq r0, r0, #0x80000
    str r0, [r4, #0x8e8]
    mov r0, #0x0
    bl func_0201967c
    cmp r5, #0x1
    bne .L_7d0
    bl func_020196d8
    cmp r0, #0x0
    beq .L_7d0
    mov r0, #0x7
    bl func_02018b34
    b .L_7d0
.L_688:
    bl func_02013a64
    ldr r0, [r4, #0x820]
    cmp r0, #0x0
    ldreq r0, [r4, #0x818]
    cmpeq r0, #0x0
    bne .L_6a8
    add r0, r4, #0x810
    bl func_0201bddc
.L_6a8:
    ldr r0, [r4, #0x828]
    bic r0, r0, #0x2000000
    str r0, [r4, #0x828]
    ldr r0, [r4, #0x818]
    cmp r0, #0x0
    beq .L_6e4
    bl func_0201c1bc
    mov r0, #0x0
    str r0, [r4, #0x820]
    str r0, [r4, #0x818]
    ldr r1, [r4, #0x828]
    orr r1, r1, #0x2000000
    str r1, [r4, #0x828]
    bl func_0201967c
    b .L_7b8
.L_6e4:
    bl func_02018a2c
    mov r5, r0
    bl func_020196b0
    cmp r0, #0x0
    beq .L_70c
    bl func_02019664
    cmp r0, #0x65
    beq .L_70c
    bl func_0201bfb4
    b .L_794
.L_70c:
    ldr r0, [r4, #0x820]
    tst r0, #0x2000
    beq .L_728
    bl func_0201bba4
    mov r0, #0x0
    str r0, [r4, #0x820]
    b .L_794
.L_728:
    tst r0, #0x4000
    mov r1, #0x0
    beq .L_748
    mov r0, #0x4000
    bl func_0201bc3c
    mov r0, #0x0
    str r0, [r4, #0x820]
    b .L_794
.L_748:
    tst r0, #0x8000
    beq .L_75c
    mov r0, #0x8000
    bl func_0201bc3c
    b .L_794
.L_75c:
    tst r0, #0x10000
    beq .L_770
    mov r0, #0x10000
    bl func_0201bc3c
    b .L_794
.L_770:
    tst r0, #0x20000
    beq .L_784
    mov r0, #0x20000
    bl func_0201bc3c
    b .L_794
.L_784:
    ldr r0, _LIT1
    str r1, [r4, #0x820]
    str r1, [r4, #0x818]
    .word 0xeb065299
.L_794:
    mov r0, r5
    bl func_0201942c
    cmp r0, #0x0
    ldr r0, [r4, #0x8e8]
    orrne r0, r0, #0x100000
    orreq r0, r0, #0x80000
    str r0, [r4, #0x8e8]
    mov r0, #0x0
    bl func_0201967c
.L_7b8:
    ldr r0, [r4, #0x81c]
    bic r0, r0, #0xf
    str r0, [r4, #0x81c]
    ldr r0, [r4, #0x828]
    bic r0, r0, #0x1000000
    str r0, [r4, #0x828]
.L_7d0:
    add r0, r4, #0x810
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02104f4c
_LIT1: .word data_020c5d90
