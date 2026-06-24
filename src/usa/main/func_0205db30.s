; func_0205db30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100d40
        .extern data_02100d70
        .extern data_02100d7c
        .extern data_02100d80
        .extern data_02100dac
        .extern data_02100db8
        .extern data_02100dc4
        .extern data_02100dd0
        .extern data_02100de0
        .extern data_02100de8
        .extern data_02100df8
        .extern data_02100e00
        .extern data_02100e0c
        .extern data_02100e18
        .extern data_02100e24
        .extern data_02100e2c
        .extern data_02100e34
        .extern data_02100e3c
        .extern data_02100e44
        .extern data_02100e50
        .extern data_02100e5c
        .extern data_02100e64
        .extern data_02100e70
        .extern data_02100e7c
        .extern data_02100e84
        .extern data_02100e90
        .extern data_02100ea0
        .extern data_02100eb0
        .extern data_02100eb4
        .extern data_02100ec0
        .extern data_02100ec8
        .extern data_02100ef4
        .extern data_02100efc
        .extern data_02100f04
        .extern data_02100f08
        .extern data_02100f10
        .extern data_02100f1c
        .extern data_02100f28
        .extern data_02100f34
        .extern data_02100f3c
        .extern data_02100f64
        .extern data_02100f68
        .extern data_02100f6c
        .extern data_02100f74
        .extern data_02100f7c
        .extern data_02100f80
        .extern data_02100f88
        .extern data_02100f94
        .extern data_02100f98
        .extern data_02100fa0
        .extern data_02100fa4
        .extern data_02100fac
        .extern data_02100fb4
        .extern data_02100fb8
        .extern data_02100fc0
        .extern data_02100fc8
        .extern data_02100fcc
        .extern data_02100fd4
        .extern data_0219e354
        .extern func_02045364
        .extern func_0204537c
        .extern func_02045398
        .extern func_020552b0
        .extern func_0205790c
        .extern func_02057a8c
        .extern func_02057fc4
        .extern func_02057ffc
        .extern func_020584b4
        .extern func_02058560
        .extern func_0205f7d0
        .extern func_0205ff4c
        .extern func_0205ff60
        .extern func_0205ff8c
        .extern func_0206015c
        .extern func_02060250
        .extern func_02060358
        .extern func_0206043c
        .extern func_020a6c60
        .extern func_020a72e0
        .extern func_020aad04
        .extern func_020aae4c
        .extern func_020aafd0
        .extern func_020acd0c
        .global func_0205db30
        .arm
func_0205db30:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr ip, _LIT0
    sub sp, sp, ip
    mov sl, r0
    ldr r0, [sl]
    str r1, [sp, #0x1c]
    ldr r1, [r1, #0x8]
    str r0, [sp, #0x24]
    ldr r0, [sp, #0x1c]
    cmp r1, #0x0
    movne r4, #0x1
    ldr r9, [r0, #0x4]
    moveq r4, #0x0
.L_34:
    mov r1, #0x1
    ldr r0, _LIT1
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r1, [r9, #0x4]
    add r3, sp, #0xa0
    mov r0, sl
    add r2, r9, #0x18
    bl func_0205790c
    cmp r0, #0x0
    ldrne ip, _LIT0
    addne sp, sp, ip
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp, #0x1c]
    ldr r0, [r0, #0x14]
    cmp r0, #0x1
    bne .L_6a4
    ldr r1, [r9, #0x4]
    add r2, sp, #0x8c
    mov r0, sl
    bl func_0206015c
    cmp r0, #0x0
    ldrne ip, _LIT0
    addne sp, sp, ip
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp, #0x8c]
    cmp r0, #0x4
    bne .L_d4
    ldr r1, _LIT2
    ldr r2, _LIT3
    mov r0, sl
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x4
    mov r2, #0x0
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x4
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d4:
    cmp r0, #0x3
    bne .L_1c34
    ldr r0, [r9]
    cmp r0, #0x1
    bne .L_29c
    ldr r2, _LIT4
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    ldr r2, _LIT5
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    ldr r0, [sp, #0x24]
    add r1, r9, #0x18
    ldr r2, [r0, #0x198]
    mov r0, sl
    bl func_02057fc4
    ldr r2, _LIT6
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    ldr r2, [sp, #0x24]
    mov r0, sl
    ldr r2, [r2, #0x1a0]
    add r1, r9, #0x18
    bl func_02057fc4
    ldr r2, _LIT7
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    ldr r2, [sp, #0x24]
    mov r0, sl
    ldr r2, [r2, #0x470]
    add r1, r9, #0x18
    bl func_02057fc4
    ldrsb r0, [r9, #0x28]
    cmp r0, #0x0
    beq .L_190
    ldr r2, _LIT8
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    mov r0, sl
    add r1, r9, #0x18
    add r2, r9, #0x28
    bl func_02057ffc
.L_190:
    ldrsb r0, [r9, #0x47]
    cmp r0, #0x0
    beq .L_1bc
    ldr r2, _LIT9
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    mov r0, sl
    add r1, r9, #0x18
    add r2, r9, #0x47
    bl func_02057ffc
.L_1bc:
    ldrsb r0, [r9, #0x5c]
    cmp r0, #0x0
    beq .L_1e8
    ldr r2, _LIT10
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    mov r0, sl
    add r1, r9, #0x18
    add r2, r9, #0x5c
    bl func_02057ffc
.L_1e8:
    ldrsb r0, [r9, #0x8f]
    cmp r0, #0x0
    beq .L_214
    ldr r2, _LIT11
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    mov r0, sl
    add r1, r9, #0x18
    add r2, r9, #0x8f
    bl func_02057ffc
.L_214:
    ldrsb r0, [r9, #0xae]
    cmp r0, #0x0
    beq .L_240
    ldr r2, _LIT12
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    mov r0, sl
    add r1, r9, #0x18
    add r2, r9, #0xae
    bl func_02057ffc
.L_240:
    ldr r0, [r9, #0x130]
    cmp r0, #0x0
    beq .L_26c
    ldr r2, _LIT13
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    ldr r2, [r9, #0x130]
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057fc4
.L_26c:
    ldr r0, [r9, #0x134]
    cmp r0, #0x0
    ble .L_664
    ldr r2, _LIT14
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    ldr r2, [r9, #0x134]
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057fc4
    b .L_664
.L_29c:
    cmp r0, #0x2
    bne .L_2d8
    ldr r2, _LIT15
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    ldr r2, _LIT10
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    mov r0, sl
    add r1, r9, #0x18
    add r2, r9, #0x5c
    bl func_02057ffc
    b .L_664
.L_2d8:
    cmp r0, #0x3
    bne .L_358
    ldr r2, _LIT16
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    ldr r2, _LIT10
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    mov r0, sl
    add r1, r9, #0x18
    add r2, r9, #0x5c
    bl func_02057ffc
    ldr r2, _LIT17
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    mov r0, sl
    add r1, r9, #0x18
    add r2, r9, #0xcd
    bl func_02057ffc
    ldr r2, _LIT7
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    ldr r2, [sp, #0x24]
    mov r0, sl
    ldr r2, [r2, #0x470]
    add r1, r9, #0x18
    bl func_02057fc4
    b .L_664
.L_358:
    cmp r0, #0x4
    bne .L_3dc
    ldr r2, _LIT18
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    ldr r2, _LIT5
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    ldr r0, [sp, #0x24]
    add r1, r9, #0x18
    ldr r2, [r0, #0x198]
    mov r0, sl
    bl func_02057fc4
    ldr r2, _LIT6
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    ldr r2, [sp, #0x24]
    mov r0, sl
    ldr r2, [r2, #0x1a0]
    add r1, r9, #0x18
    bl func_02057fc4
    ldr r2, _LIT19
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    ldr r2, [r9, #0x138]
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057fc4
    b .L_664
.L_3dc:
    cmp r0, #0x5
    bne .L_458
    ldr r2, _LIT20
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    ldr r2, _LIT8
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    mov r0, sl
    add r1, r9, #0x18
    add r2, r9, #0x28
    bl func_02057ffc
    mov r0, sl
    add r1, r9, #0x18
    ldr r2, _LIT10
    bl func_02057ffc
    mov r0, sl
    add r1, r9, #0x18
    add r2, r9, #0x5c
    bl func_02057ffc
    mov r0, sl
    add r1, r9, #0x18
    ldr r2, _LIT17
    bl func_02057ffc
    mov r0, sl
    add r1, r9, #0x18
    add r2, r9, #0xcd
    bl func_02057ffc
    b .L_664
.L_458:
    cmp r0, #0x6
    bne .L_568
    ldr r2, _LIT21
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    ldr r2, _LIT8
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    mov r0, sl
    add r1, r9, #0x18
    add r2, r9, #0x28
    bl func_02057ffc
    ldr r2, _LIT10
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    mov r0, sl
    add r1, r9, #0x18
    add r2, r9, #0x5c
    bl func_02057ffc
    ldr r2, _LIT17
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    mov r0, sl
    add r1, r9, #0x18
    add r2, r9, #0xcd
    bl func_02057ffc
    ldr r2, _LIT22
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    ldr r2, [sp, #0x24]
    mov r0, sl
    ldr r2, [r2, #0x46c]
    add r1, r9, #0x18
    bl func_02057fc4
    ldr r2, _LIT7
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    ldr r2, [sp, #0x24]
    mov r0, sl
    ldr r2, [r2, #0x470]
    add r1, r9, #0x18
    bl func_02057fc4
    ldr r2, _LIT9
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    mov r0, sl
    add r1, r9, #0x18
    add r2, r9, #0x47
    bl func_02057ffc
    ldrsb r0, [r9, #0xec]
    cmp r0, #0x0
    beq .L_664
    ldr r2, _LIT23
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    mov r0, sl
    add r1, r9, #0x18
    add r2, r9, #0xec
    bl func_02057ffc
    b .L_664
.L_568:
    cmp r0, #0x7
    bne .L_5f0
    ldr r2, _LIT24
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    ldr r2, _LIT5
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    ldr r0, [sp, #0x24]
    add r1, r9, #0x18
    ldr r2, [r0, #0x198]
    mov r0, sl
    bl func_02057fc4
    ldr r2, _LIT6
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    ldr r2, [sp, #0x24]
    mov r0, sl
    ldr r2, [r2, #0x1a0]
    add r1, r9, #0x18
    bl func_02057fc4
    ldr r2, _LIT7
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    ldr r2, [sp, #0x24]
    mov r0, sl
    ldr r2, [r2, #0x470]
    add r1, r9, #0x18
    bl func_02057fc4
    b .L_664
.L_5f0:
    cmp r0, #0x8
    bne .L_650
    ldr r2, _LIT25
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    ldr r2, _LIT26
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    mov r0, sl
    add r1, r9, #0x18
    add r2, r9, #0x47
    bl func_02057ffc
    ldr r2, _LIT7
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    ldr r2, [sp, #0x24]
    mov r0, sl
    ldr r2, [r2, #0x470]
    add r1, r9, #0x18
    bl func_02057fc4
    b .L_664
.L_650:
    ldr r0, _LIT27
    ldr r1, _LIT28
    ldr r3, _LIT29
    mov r2, #0x0
    bl func_020a6c60
.L_664:
    ldr r2, _LIT30
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    ldr r2, _LIT31
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    ldr r2, _LIT32
    mov r0, sl
    add r1, r9, #0x18
    bl func_02057ffc
    ldr r0, [sp, #0x1c]
    mov r1, #0x4
    str r1, [r0, #0x14]
    b .L_1c34
.L_6a4:
    cmp r0, #0x4
    bne .L_1c34
    add r1, sp, #0xa0
    ldr r0, _LIT1
    str r1, [sp]
    str r0, [sp, #0x4]
    ldr r1, [r9, #0x4]
    add r3, sp, #0x9c
    mov r0, sl
    add r2, r9, #0x8
    bl func_02057a8c
    cmp r0, #0x0
    beq .L_718
    cmp r0, #0x3
    ldrne ip, _LIT0
    addne sp, sp, ip
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT2
    ldr r2, _LIT33
    mov r0, sl
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x0
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_718:
    ldr r0, [r9, #0x8]
    ldr r1, _LIT32
    bl func_020aafd0
    cmp r0, #0x0
    beq .L_1c34
    mov r0, #0x0
    str r0, [sp, #0x90]
    ldr r0, [sp, #0x1c]
    mov r1, #0x5
    str r1, [r0, #0x14]
    ldr r1, [r9, #0x8]
    mov r0, sl
    mov r2, #0x1
    bl func_02060358
    cmp r0, #0x0
    ldrne ip, _LIT0
    movne r0, #0x1
    strne r0, [r9, #0x140]
    addne sp, sp, ip
    movne r0, #0x4
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [r9]
    cmp r0, #0x1
    bne .L_b30
    mov r0, #0x0
    str r0, [sp, #0x20]
    str r0, [sp, #0xdc]
    str r0, [sp, #0xe0]
    str r0, [sp, #0xe8]
    mov r0, #0x1
    str r0, [sp, #0x3c]
    mov r0, #0x33
    str r0, [sp, #0x50]
    mov r0, #0x15
    str r0, [sp, #0x4c]
    mov r0, #0x600
    str r0, [sp, #0x38]
    ldr r0, [sp, #0x20]
    ldr r1, _LIT34
    str r0, [sp, #0x40]
    mov r0, #0xac
    str r0, [sp, #0x44]
    ldr r0, [sp, #0x20]
    str r1, [sp, #0xe4]
    add r5, sp, #0xec
    add r6, sp, #0x2ec
    mov r4, #0x1f
    str r0, [sp, #0x48]
.L_7d8:
    str r6, [sp]
    ldr r1, [r9, #0x8]
    mov r0, sl
    add r2, sp, #0x90
    mov r3, r5
    bl func_0205ff8c
    cmp r0, #0x0
    ldrne ip, _LIT0
    addne sp, sp, ip
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT35
    mov r0, r5
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_874
    str r6, [sp]
    ldr r1, [r9, #0x8]
    mov r0, sl
    add r2, sp, #0x90
    mov r3, r5
    bl func_0205ff8c
    cmp r0, #0x0
    ldrne ip, _LIT0
    addne sp, sp, ip
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT36
    mov r0, r5
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_868
    ldr r1, _LIT27
    mov r0, r6
    bl func_020aae4c
    cmp r0, #0x0
    ldrne r0, [sp, #0x38]
    strne r0, [sp, #0xe4]
.L_868:
    ldr r0, [sp, #0x3c]
    str r0, [sp, #0x20]
    b .L_a60
.L_874:
    ldr r1, _LIT37
    mov r0, r5
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_a30
    ldr r1, [sp, #0xe0]
    ldr r0, [sp, #0xe8]
    add r2, r1, #0x1
    mov r1, #0xac
    mul r1, r2, r1
    str r2, [sp, #0xe0]
    bl func_0204537c
    movs r8, r0
    str r8, [sp, #0xe8]
    bne .L_8cc
    ldr r1, _LIT38
    mov r0, sl
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_8cc:
    ldr r1, [sp, #0xe0]
    mov r0, #0xac
    sub r1, r1, #0x1
    mul fp, r1, r0
    add r7, r8, fp
    ldr r1, [sp, #0x40]
    ldr r2, [sp, #0x44]
    mov r0, r7
    bl func_020a72e0
    mov r0, r6
    bl func_020acd0c
    str r0, [r8, fp]
    ldr r8, [sp, #0x48]
.L_900:
    ldr fp, [sp, #0x90]
    mov r0, sl
    str r6, [sp]
    ldr r1, [r9, #0x8]
    add r2, sp, #0x90
    mov r3, r5
    bl func_0205ff8c
    cmp r0, #0x0
    ldrne ip, _LIT0
    addne sp, sp, ip
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT39
    mov r0, r5
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_954
    add r0, r7, #0x4
    mov r1, r6
    mov r2, r4
    bl func_0206043c
    b .L_a24
.L_954:
    ldr r1, _LIT40
    mov r0, r5
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_97c
    ldr r2, [sp, #0x4c]
    add r0, r7, #0x23
    mov r1, r6
    bl func_0206043c
    b .L_a24
.L_97c:
    ldr r1, _LIT41
    mov r0, r5
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_9a4
    add r0, r7, #0x38
    mov r1, r6
    mov r2, r4
    bl func_0206043c
    b .L_a24
.L_9a4:
    ldr r1, _LIT42
    mov r0, r5
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_9cc
    add r0, r7, #0x57
    mov r1, r6
    mov r2, r4
    bl func_0206043c
    b .L_a24
.L_9cc:
    ldr r1, _LIT43
    mov r0, r5
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_9f4
    ldr r2, [sp, #0x50]
    add r0, r7, #0x76
    mov r1, r6
    bl func_0206043c
    b .L_a24
.L_9f4:
    ldr r1, _LIT37
    mov r0, r5
    bl func_020aae4c
    cmp r0, #0x0
    beq .L_a1c
    ldr r1, _LIT35
    mov r0, r5
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_a24
.L_a1c:
    ldr r8, [sp, #0x3c]
    str fp, [sp, #0x90]
.L_a24:
    cmp r8, #0x0
    beq .L_900
    b .L_a60
.L_a30:
    ldr r2, _LIT44
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_a60:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    beq .L_7d8
    ldr r0, [sp, #0x1c]
    ldr r4, [sp, #0xe4]
    ldr r3, [r0, #0xc]
    ldr r2, [r0, #0x10]
    cmp r3, #0x0
    str r3, [sp, #0x94]
    str r2, [sp, #0x98]
    beq .L_a98
    add r1, sp, #0xdc
    mov r0, sl
    blx r3
.L_a98:
    cmp r4, #0x600
    bne .L_b1c
    ldr r0, [sp, #0xe4]
    cmp r0, #0x600
    bne .L_b1c
    add r0, r9, #0x8f
    str r0, [sp]
    add r0, r9, #0xae
    str r0, [sp, #0x4]
    ldr r1, [r9, #0x130]
    mov r0, sl
    str r1, [sp, #0x8]
    ldr r3, [sp, #0xe0]
    ldr r2, [r9, #0x134]
    add r1, r9, #0x28
    add r2, r3, r2
    str r2, [sp, #0xc]
    ldr r2, [sp, #0x1c]
    ldr r3, [r2, #0x8]
    add r2, r9, #0x47
    str r3, [sp, #0x10]
    ldr r3, [sp, #0x1c]
    ldr r4, [r3, #0xc]
    add r3, r9, #0x5c
    str r4, [sp, #0x14]
    ldr r4, [sp, #0x1c]
    ldr r4, [r4, #0x10]
    str r4, [sp, #0x18]
    bl func_0205f7d0
    cmp r0, #0x0
    ldrne ip, _LIT0
    addne sp, sp, ip
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_b1c:
    ldr r0, [sp, #0xe8]
    bl func_02045364
    mov r0, #0x0
    str r0, [sp, #0xe8]
    b .L_1c28
.L_b30:
    cmp r0, #0x2
    bne .L_c5c
    ldr r0, [sp, #0x1c]
    ldr r1, [r0, #0xc]
    ldr r0, [r0, #0x10]
    cmp r1, #0x0
    str r1, [sp, #0xd4]
    str r0, [sp, #0xd8]
    beq .L_1c28
    add r0, sp, #0x2ec
    str r0, [sp]
    ldr r1, [r9, #0x8]
    add r2, sp, #0x90
    add r3, sp, #0xec
    mov r0, sl
    bl func_0205ff8c
    cmp r0, #0x0
    ldrne ip, _LIT0
    addne sp, sp, ip
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT45
    add r0, sp, #0xec
    bl func_020aae4c
    cmp r0, #0x0
    beq .L_bc4
    ldr r2, _LIT44
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_bc4:
    mov r0, #0x3c
    bl func_02045398
    movs r4, r0
    bne .L_bf0
    ldr r1, _LIT38
    mov r0, sl
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_bf0:
    mov r0, #0x0
    str r0, [r4]
    add r0, r4, #0x4
    add r1, r9, #0x5c
    mov r2, #0x33
    bl func_0206043c
    add r0, sp, #0x28c
    ldrsb r0, [r0, #0x60]
    add r1, sp, #0xd4
    mov r3, r4
    cmp r0, #0x30
    moveq r0, #0x0
    streq r0, [r4, #0x38]
    movne r0, #0x1
    strne r0, [r4, #0x38]
    ldr r0, [sp, #0x1c]
    str r0, [sp]
    mov r0, #0x0
    str r0, [sp, #0x4]
    mov r0, sl
    ldmia r1, {r1, r2}
    bl func_020584b4
    cmp r0, #0x0
    beq .L_1c28
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_c5c:
    cmp r0, #0x3
    bne .L_102c
    ldr r0, [sp, #0x1c]
    ldr r1, [r0, #0xc]
    ldr r0, [r0, #0x10]
    cmp r1, #0x0
    str r1, [sp, #0xcc]
    str r0, [sp, #0xd0]
    beq .L_1c28
    mov r0, #0x44
    bl func_02045398
    movs r8, r0
    bne .L_cac
    ldr r1, _LIT38
    mov r0, sl
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_cac:
    mov r2, #0x0
    add r0, r8, #0x4
    add r1, r9, #0x5c
    str r2, [r8]
    bl func_020aad04
    mov r1, #0x0
    str r1, [r8, #0x38]
    str r1, [r8, #0x3c]
    add r0, sp, #0x2ec
    str r1, [r8, #0x40]
    str r0, [sp]
    ldr r1, [r9, #0x8]
    add r2, sp, #0x90
    add r3, sp, #0xec
    mov r0, sl
    bl func_0205ff8c
    cmp r0, #0x0
    ldrne ip, _LIT0
    addne sp, sp, ip
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT46
    add r0, sp, #0xec
    bl func_020aae4c
    cmp r0, #0x0
    beq .L_d40
    ldr r2, _LIT44
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d40:
    mov r0, #0x1
    mov r7, #0x0
    add r6, sp, #0xec
    add fp, sp, #0x2ec
    mov r5, #0x1f
    mov r4, #0x15
    str r0, [sp, #0x54]
.L_d5c:
    str fp, [sp]
    ldr r1, [r9, #0x8]
    mov r0, sl
    add r2, sp, #0x90
    mov r3, r6
    bl func_0205ff8c
    cmp r0, #0x0
    ldrne ip, _LIT0
    addne sp, sp, ip
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT39
    mov r0, r6
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_e34
    ldr r0, [r8, #0x3c]
    ldr r1, [r8, #0x38]
    add r1, r1, #0x1
    mov r1, r1, lsl #0x2
    bl func_0204537c
    cmp r0, #0x0
    bne .L_dd0
    ldr r1, _LIT38
    mov r0, sl
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_dd0:
    str r0, [r8, #0x3c]
    mov r0, r5
    bl func_02045398
    cmp r0, #0x0
    bne .L_e00
    ldr r1, _LIT38
    mov r0, sl
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e00:
    ldr r3, [r8, #0x3c]
    ldr r2, [r8, #0x38]
    mov r1, fp
    str r0, [r3, r2, lsl #0x2]
    ldr r3, [r8, #0x3c]
    ldr r0, [r8, #0x38]
    mov r2, r5
    ldr r0, [r3, r0, lsl #0x2]
    bl func_0206043c
    ldr r0, [r8, #0x38]
    add r0, r0, #0x1
    str r0, [r8, #0x38]
    b .L_fec
.L_e34:
    ldr r1, _LIT40
    mov r0, r6
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_fa4
    ldr r0, [r8, #0x38]
    cmp r0, #0x0
    ble .L_fec
    mov r1, r0, lsl #0x2
    ldr r0, [r8, #0x40]
    bl func_0204537c
    cmp r0, #0x0
    bne .L_e84
    ldr r1, _LIT38
    mov r0, sl
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_e84:
    str r0, [r8, #0x40]
    mov r0, r4
    bl func_02045398
    cmp r0, #0x0
    bne .L_eb4
    ldr r1, _LIT38
    mov r0, sl
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_eb4:
    ldr r3, [r8, #0x40]
    ldr r2, [r8, #0x38]
    mov r1, fp
    sub r2, r2, #0x1
    str r0, [r3, r2, lsl #0x2]
    ldr r3, [r8, #0x40]
    ldr r0, [r8, #0x38]
    mov r2, r4
    sub r0, r0, #0x1
    ldr r0, [r3, r0, lsl #0x2]
    bl func_0206043c
    b .L_fec
_LIT0: .word 0x000004ec
_LIT1: .word data_02100d7c
_LIT2: .word 0x00000d01
_LIT3: .word data_02100d80
_LIT4: .word data_02100dac
_LIT5: .word data_02100db8
_LIT6: .word data_02100dc4
_LIT7: .word data_02100dd0
_LIT8: .word data_02100de0
_LIT9: .word data_02100de8
_LIT10: .word data_02100df8
_LIT11: .word data_02100e00
_LIT12: .word data_02100e0c
_LIT13: .word data_02100e18
_LIT14: .word data_02100e24
_LIT15: .word data_02100e2c
_LIT16: .word data_02100e34
_LIT17: .word data_02100e3c
_LIT18: .word data_02100e44
_LIT19: .word data_02100e50
_LIT20: .word data_02100e5c
_LIT21: .word data_02100e64
_LIT22: .word data_02100e70
_LIT23: .word data_02100e7c
_LIT24: .word data_02100e84
_LIT25: .word data_02100e90
_LIT26: .word data_02100ea0
_LIT27: .word data_02100eb0
_LIT28: .word data_02100d70
_LIT29: .word 0x00000275
_LIT30: .word data_02100eb4
_LIT31: .word data_0219e354
_LIT32: .word data_02100ec0
_LIT33: .word data_02100ec8
_LIT34: .word 0x00000601
_LIT35: .word data_02100ef4
_LIT36: .word data_02100efc
_LIT37: .word data_02100f04
_LIT38: .word data_02100d40
_LIT39: .word data_02100f08
_LIT40: .word data_02100f10
_LIT41: .word data_02100f1c
_LIT42: .word data_02100f28
_LIT43: .word data_02100f34
_LIT44: .word data_02100f3c
_LIT45: .word data_02100f64
_LIT46: .word data_02100f68
_LIT47: .word data_02100f6c
.L_fa4:
    ldr r1, _LIT47
    mov r0, r6
    bl func_020aae4c
    cmp r0, #0x0
    ldreq r7, [sp, #0x54]
    beq .L_fec
    ldr r2, _LIT44
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_fec:
    cmp r7, #0x0
    beq .L_d5c
    ldr r0, [sp, #0x1c]
    add r1, sp, #0xcc
    str r0, [sp]
    mov r0, #0x3
    str r0, [sp, #0x4]
    mov r0, sl
    mov r3, r8
    ldmia r1, {r1, r2}
    bl func_020584b4
    cmp r0, #0x0
    beq .L_1c28
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_102c:
    cmp r0, #0x4
    bne .L_1310
    ldr r0, [sp, #0x1c]
    ldr r1, [r0, #0xc]
    ldr r0, [r0, #0x10]
    cmp r1, #0x0
    str r1, [sp, #0xc4]
    str r0, [sp, #0xc8]
    beq .L_1c28
    mov r0, #0x10
    bl func_02045398
    str r0, [sp, #0x28]
    cmp r0, #0x0
    bne .L_1080
    ldr r1, _LIT38
    mov r0, sl
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1080:
    mov r0, #0x0
    str r0, [sp, #0x34]
    ldr r1, [r9, #0x138]
    ldr r0, [sp, #0x28]
    add r4, sp, #0xec
    str r1, [r0, #0x4]
    ldr r1, [sp, #0x34]
    add r5, sp, #0x2ec
    str r1, [r0]
    str r1, [r0, #0x8]
    str r1, [r0, #0xc]
    mov r0, #0x1f
    str r0, [sp, #0x68]
    mov r0, #0x100
    str r0, [sp, #0x64]
    mov r0, r1
    str r0, [sp, #0x58]
    mov r0, #0x128
    str r0, [sp, #0x5c]
    mov r0, r1
    mov fp, #0x1
    str r0, [sp, #0x60]
.L_10d8:
    str r5, [sp]
    ldr r1, [r9, #0x8]
    mov r0, sl
    add r2, sp, #0x90
    mov r3, r4
    bl func_0205ff8c
    cmp r0, #0x0
    ldrne ip, _LIT0
    addne sp, sp, ip
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT48
    mov r0, r4
    bl func_020aae4c
    cmp r0, #0x0
    streq fp, [sp, #0x34]
    beq .L_12cc
    ldr r1, _LIT49
    mov r0, r4
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_129c
    ldr r0, [sp, #0x28]
    mov r2, #0x128
    ldr r0, [r0, #0x8]
    add r1, r0, #0x1
    ldr r0, [sp, #0x28]
    str r1, [r0, #0x8]
    ldr r1, [sp, #0x28]
    ldr r0, [r0, #0xc]
    ldr r3, [r1, #0x8]
    mul r1, r3, r2
    bl func_0204537c
    ldr r1, [sp, #0x28]
    str r0, [r1, #0xc]
    mov r0, r1
    ldr r6, [r0, #0xc]
    cmp r6, #0x0
    bne .L_118c
    ldr r1, _LIT38
    mov r0, sl
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_118c:
    ldr r1, [r0, #0x8]
    mov r0, #0x128
    sub r1, r1, #0x1
    mul r7, r1, r0
    add r8, r6, r7
    ldr r1, [sp, #0x58]
    ldr r2, [sp, #0x5c]
    mov r0, r8
    bl func_020a72e0
    mov r0, r5
    str fp, [r8, #0x24]
    bl func_020acd0c
    str r0, [r6, r7]
    ldr r7, [sp, #0x60]
.L_11c4:
    ldr r6, [sp, #0x90]
    mov r0, sl
    str r5, [sp]
    ldr r1, [r9, #0x8]
    add r2, sp, #0x90
    mov r3, r4
    bl func_0205ff8c
    cmp r0, #0x0
    ldrne ip, _LIT0
    addne sp, sp, ip
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT50
    mov r0, r4
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_1218
    ldr r2, [sp, #0x64]
    add r0, r8, #0x28
    mov r1, r5
    bl func_0206043c
    b .L_123c
.L_1218:
    ldr r1, _LIT39
    mov r0, r4
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_123c
    ldr r2, [sp, #0x68]
    add r0, r8, #0x4
    mov r1, r5
    bl func_0206043c
.L_123c:
    ldr r1, _LIT51
    mov r0, r4
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_1260
    mov r0, r5
    bl func_020acd0c
    str r0, [r8, #0x24]
    b .L_1290
.L_1260:
    ldr r1, _LIT49
    mov r0, r4
    bl func_020aae4c
    cmp r0, #0x0
    beq .L_1288
    ldr r1, _LIT48
    mov r0, r4
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_1290
.L_1288:
    str r6, [sp, #0x90]
    mov r7, fp
.L_1290:
    cmp r7, #0x0
    beq .L_11c4
    b .L_12cc
.L_129c:
    ldr r2, _LIT44
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_12cc:
    ldr r0, [sp, #0x34]
    cmp r0, #0x0
    beq .L_10d8
    ldr r0, [sp, #0x1c]
    ldr r3, [sp, #0x28]
    str r0, [sp]
    mov r0, #0x4
    str r0, [sp, #0x4]
    add r1, sp, #0xc4
    mov r0, sl
    ldmia r1, {r1, r2}
    bl func_020584b4
    cmp r0, #0x0
    beq .L_1c28
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1310:
    cmp r0, #0x5
    bne .L_1480
    ldr r0, [sp, #0x1c]
    ldr r1, [r0, #0xc]
    ldr r0, [r0, #0x10]
    cmp r1, #0x0
    str r1, [sp, #0xbc]
    str r0, [sp, #0xc0]
    beq .L_1c28
    add r0, sp, #0x2ec
    str r0, [sp]
    ldr r1, [r9, #0x8]
    add r2, sp, #0x90
    add r3, sp, #0xec
    mov r0, sl
    bl func_0205ff8c
    cmp r0, #0x0
    ldrne ip, _LIT0
    addne sp, sp, ip
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT52
    add r0, sp, #0xec
    bl func_020aae4c
    cmp r0, #0x0
    beq .L_13a4
    ldr r2, _LIT44
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_13a4:
    add r0, sp, #0x2ec
    bl func_020acd0c
    movs r5, r0
    ldrne r0, [sp, #0x24]
    movne r4, #0x0
    strne r5, [r0, #0x418]
    bne .L_1418
    ldr r0, [r9, #0x8]
    ldr r1, _LIT53
    add r2, sp, #0x2ec
    mov r3, #0x200
    bl func_02060250
    cmp r0, #0x0
    bne .L_140c
    ldr r2, _LIT44
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_140c:
    add r0, sp, #0x2ec
    bl func_020acd0c
    mov r4, r0
.L_1418:
    mov r0, #0x8
    bl func_02045398
    movs r3, r0
    bne .L_1444
    ldr r1, _LIT38
    mov r0, sl
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1444:
    str r5, [r3]
    ldr r0, [sp, #0x1c]
    str r4, [r3, #0x4]
    str r0, [sp]
    mov r0, #0x0
    str r0, [sp, #0x4]
    add r1, sp, #0xbc
    mov r0, sl
    ldmia r1, {r1, r2}
    bl func_020584b4
    cmp r0, #0x0
    beq .L_1c28
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1480:
    cmp r0, #0x6
    bne .L_15f8
    ldr r0, [sp, #0x1c]
    ldr r1, [r0, #0xc]
    ldr r0, [r0, #0x10]
    cmp r1, #0x0
    str r1, [sp, #0xb4]
    str r0, [sp, #0xb8]
    beq .L_1c28
    add r0, sp, #0x2ec
    str r0, [sp]
    ldr r1, [r9, #0x8]
    add r2, sp, #0x90
    add r3, sp, #0xec
    mov r0, sl
    bl func_0205ff8c
    cmp r0, #0x0
    ldrne ip, _LIT0
    addne sp, sp, ip
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT54
    add r0, sp, #0xec
    bl func_020aae4c
    cmp r0, #0x0
    beq .L_1514
    ldr r2, _LIT44
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1514:
    add r0, sp, #0x2ec
    bl func_020acd0c
    movs r5, r0
    ldrne r0, [sp, #0x24]
    ldr r1, _LIT53
    strne r5, [r0, #0x418]
    ldr r0, [r9, #0x8]
    add r2, sp, #0x2ec
    mov r3, #0x200
    bl func_02060250
    cmp r0, #0x0
    bne .L_1584
    cmp r5, #0x0
    bne .L_157c
    ldr r2, _LIT44
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_157c:
    mov r4, #0x0
    b .L_1590
.L_1584:
    add r0, sp, #0x2ec
    bl func_020acd0c
    mov r4, r0
.L_1590:
    mov r0, #0x8
    bl func_02045398
    movs r3, r0
    bne .L_15bc
    ldr r1, _LIT38
    mov r0, sl
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_15bc:
    str r5, [r3]
    ldr r0, [sp, #0x1c]
    str r4, [r3, #0x4]
    str r0, [sp]
    mov r0, #0x0
    str r0, [sp, #0x4]
    add r1, sp, #0xb4
    mov r0, sl
    ldmia r1, {r1, r2}
    bl func_020584b4
    cmp r0, #0x0
    beq .L_1c28
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_15f8:
    cmp r0, #0x7
    bne .L_19a4
    ldr r0, [sp, #0x1c]
    ldr r1, [r0, #0xc]
    ldr r0, [r0, #0x10]
    cmp r1, #0x0
    str r1, [sp, #0xac]
    str r0, [sp, #0xb0]
    beq .L_1c28
    mov r0, #0xc
    bl func_02045398
    str r0, [sp, #0x2c]
    cmp r0, #0x0
    bne .L_164c
    ldr r1, _LIT38
    mov r0, sl
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_164c:
    mov r2, #0x0
    str r2, [r0]
    str r2, [r0, #0x4]
    str r2, [r0, #0x8]
    add r1, sp, #0x2ec
    str r1, [sp]
    ldr r1, [r9, #0x8]
    add r2, sp, #0x90
    add r3, sp, #0xec
    mov r0, sl
    bl func_0205ff8c
    cmp r0, #0x0
    ldrne ip, _LIT0
    addne sp, sp, ip
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT55
    add r0, sp, #0xec
    bl func_020aae4c
    cmp r0, #0x0
    beq .L_16cc
    ldr r2, _LIT44
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_16cc:
    mov r0, #0x0
    str r0, [sp, #0x30]
    mov r0, #0x1
    str r0, [sp, #0x6c]
    mov r0, #0x33
    str r0, [sp, #0x80]
    mov r0, #0x15
    str r0, [sp, #0x7c]
    ldr r0, [sp, #0x30]
    add r5, sp, #0xec
    str r0, [sp, #0x70]
    mov r0, #0xac
    str r0, [sp, #0x74]
    ldr r0, [sp, #0x30]
    add r6, sp, #0x2ec
    mov r4, #0x1f
    str r0, [sp, #0x78]
.L_1710:
    str r6, [sp]
    ldr r1, [r9, #0x8]
    mov r0, sl
    add r2, sp, #0x90
    mov r3, r5
    bl func_0205ff8c
    cmp r0, #0x0
    ldrne ip, _LIT0
    addne sp, sp, ip
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT56
    mov r0, r5
    bl func_020aae4c
    cmp r0, #0x0
    ldreq r0, [sp, #0x6c]
    streq r0, [sp, #0x30]
    beq .L_1960
    ldr r1, _LIT57
    mov r0, r5
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_1930
    ldr r1, [sp, #0x2c]
    ldr r0, [sp, #0x2c]
    ldr r2, [r1, #0x4]
    mov r1, #0xac
    add r2, r2, #0x1
    mul r1, r2, r1
    ldr r0, [r0, #0x8]
    bl func_0204537c
    cmp r0, #0x0
    bne .L_17ac
    ldr r1, _LIT38
    mov r0, sl
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_17ac:
    ldr r1, [sp, #0x2c]
    ldr r2, [sp, #0x74]
    str r0, [r1, #0x8]
    mov r0, r1
    ldr r1, [r0, #0x4]
    ldr r7, [r0, #0x8]
    mov r0, #0xac
    mul fp, r1, r0
    add r8, r7, fp
    ldr r1, [sp, #0x70]
    mov r0, r8
    bl func_020a72e0
    ldr r0, [sp, #0x2c]
    ldr r1, [r0, #0x4]
    mov r0, r6
    add r2, r1, #0x1
    ldr r1, [sp, #0x2c]
    str r2, [r1, #0x4]
    bl func_020acd0c
    str r0, [r7, fp]
    ldr r7, [sp, #0x78]
.L_1800:
    ldr fp, [sp, #0x90]
    mov r0, sl
    str r6, [sp]
    ldr r1, [r9, #0x8]
    add r2, sp, #0x90
    mov r3, r5
    bl func_0205ff8c
    cmp r0, #0x0
    ldrne ip, _LIT0
    addne sp, sp, ip
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT39
    mov r0, r5
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_1854
    add r0, r8, #0x4
    mov r1, r6
    mov r2, r4
    bl func_0206043c
    b .L_1924
.L_1854:
    ldr r1, _LIT40
    mov r0, r5
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_187c
    ldr r2, [sp, #0x7c]
    add r0, r8, #0x23
    mov r1, r6
    bl func_0206043c
    b .L_1924
.L_187c:
    ldr r1, _LIT58
    mov r0, r5
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_18a4
    add r0, r8, #0x38
    mov r1, r6
    mov r2, r4
    bl func_0206043c
    b .L_1924
.L_18a4:
    ldr r1, _LIT59
    mov r0, r5
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_18cc
    add r0, r8, #0x57
    mov r1, r6
    mov r2, r4
    bl func_0206043c
    b .L_1924
.L_18cc:
    ldr r1, _LIT43
    mov r0, r5
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_18f4
    ldr r2, [sp, #0x80]
    add r0, r8, #0x76
    mov r1, r6
    bl func_0206043c
    b .L_1924
.L_18f4:
    ldr r1, _LIT57
    mov r0, r5
    bl func_020aae4c
    cmp r0, #0x0
    beq .L_191c
    ldr r1, _LIT56
    mov r0, r5
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_1924
.L_191c:
    ldr r7, [sp, #0x6c]
    str fp, [sp, #0x90]
.L_1924:
    cmp r7, #0x0
    beq .L_1800
    b .L_1960
.L_1930:
    ldr r2, _LIT44
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1960:
    ldr r0, [sp, #0x30]
    cmp r0, #0x0
    beq .L_1710
    ldr r0, [sp, #0x1c]
    ldr r3, [sp, #0x2c]
    str r0, [sp]
    mov r0, #0x8
    str r0, [sp, #0x4]
    add r1, sp, #0xac
    mov r0, sl
    ldmia r1, {r1, r2}
    bl func_020584b4
    cmp r0, #0x0
    beq .L_1c28
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_19a4:
    cmp r0, #0x8
    bne .L_1c14
    ldr r0, [sp, #0x1c]
    ldr r1, [r0, #0xc]
    ldr r0, [r0, #0x10]
    cmp r1, #0x0
    str r1, [sp, #0xa4]
    str r0, [sp, #0xa8]
    beq .L_1c28
    mov r0, #0xc
    mov r8, #0x0
    bl func_02045398
    movs r7, r0
    bne .L_19f8
    ldr r1, _LIT38
    mov r0, sl
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_19f8:
    mov r1, r8
    str r1, [r7]
    str r1, [r7, #0x4]
    add r0, sp, #0x2ec
    str r1, [r7, #0x8]
    str r0, [sp]
    ldr r1, [r9, #0x8]
    add r2, sp, #0x90
    add r3, sp, #0xec
    mov r0, sl
    bl func_0205ff8c
    cmp r0, #0x0
    ldrne ip, _LIT0
    addne sp, sp, ip
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT60
    add r0, sp, #0xec
    bl func_020aae4c
    cmp r0, #0x0
    beq .L_1a78
    ldr r2, _LIT44
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1a78:
    add r0, sp, #0x2ec
    bl func_020acd0c
    str r0, [r7, #0x4]
    ldr r0, [r7, #0x4]
    mov r0, r0, lsl #0x2
    bl func_02045398
    str r0, [r7, #0x8]
    ldr r0, [r7, #0x8]
    cmp r0, #0x0
    bne .L_1abc
    ldr r1, _LIT38
    mov r0, sl
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1abc:
    mov r6, r8
    mov r0, #0x1
    add r5, sp, #0xec
    add fp, sp, #0x2ec
    mov r4, #0x15
    str r6, [sp, #0x84]
    str r0, [sp, #0x88]
.L_1ad8:
    str fp, [sp]
    ldr r1, [r9, #0x8]
    mov r0, sl
    add r2, sp, #0x90
    mov r3, r5
    bl func_0205ff8c
    cmp r0, #0x0
    ldrne ip, _LIT0
    addne sp, sp, ip
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT39
    mov r0, r5
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_1b64
    mov r0, r4
    bl func_02045398
    ldr r1, [r7, #0x8]
    str r0, [r1, r8, lsl #0x2]
    ldr r0, [r7, #0x8]
    ldr r0, [r0, r8, lsl #0x2]
    cmp r0, #0x0
    bne .L_1b50
    ldr r1, _LIT38
    mov r0, sl
    bl func_0205ff4c
    ldr ip, _LIT0
    mov r0, #0x1
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1b50:
    mov r1, fp
    mov r2, r4
    bl func_0206043c
    add r8, r8, #0x1
    b .L_1bd4
.L_1b64:
    ldr r1, _LIT61
    mov r0, r5
    bl func_020aae4c
    cmp r0, #0x0
    bne .L_1ba4
    ldr r0, [r7, #0x4]
    cmp r8, r0
    beq .L_1b98
    ldr r0, _LIT62
    ldr r1, _LIT28
    ldr r2, [sp, #0x84]
    ldr r3, _LIT63
    bl func_020a6c60
.L_1b98:
    str r8, [r7, #0x4]
    ldr r6, [sp, #0x88]
    b .L_1bd4
.L_1ba4:
    ldr r2, _LIT44
    mov r0, sl
    mov r1, #0x1
    bl func_0205ff60
    mov r0, sl
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    ldr ip, _LIT0
    mov r0, #0x3
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1bd4:
    cmp r6, #0x0
    beq .L_1ad8
    ldr r0, [sp, #0x1c]
    add r1, sp, #0xa4
    str r0, [sp]
    mov r0, #0x9
    str r0, [sp, #0x4]
    mov r0, sl
    mov r3, r7
    ldmia r1, {r1, r2}
    bl func_020584b4
    cmp r0, #0x0
    beq .L_1c28
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1c14:
    ldr r0, _LIT27
    ldr r1, _LIT28
    ldr r3, _LIT64
    mov r2, #0x0
    bl func_020a6c60
.L_1c28:
    mov r0, #0x1
    str r0, [r9, #0x140]
    mov r4, #0x0
.L_1c34:
    cmp r4, #0x0
    beq .L_1c44
    mov r0, #0xa
    bl func_020552b0
.L_1c44:
    cmp r4, #0x0
    bne .L_34
    mov r0, #0x0
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT48: .word data_02100f74
_LIT49: .word data_02100f7c
_LIT50: .word data_02100f80
_LIT51: .word data_02100f88
_LIT52: .word data_02100f94
_LIT53: .word data_02100f98
_LIT54: .word data_02100fa0
_LIT55: .word data_02100fa4
_LIT56: .word data_02100fac
_LIT57: .word data_02100fb4
_LIT58: .word data_02100fb8
_LIT59: .word data_02100fc0
_LIT60: .word data_02100fc8
_LIT61: .word data_02100fcc
_LIT62: .word data_02100fd4
_LIT63: .word 0x00000515
_LIT64: .word 0x0000052a
