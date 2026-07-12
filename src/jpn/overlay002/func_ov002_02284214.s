; func_ov002_02284214 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd444
        .extern data_ov002_022cd46c
        .extern data_ov002_022cd470
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c2
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .extern func_ov002_021b9dec
        .extern func_ov002_021bd868
        .extern func_ov002_021c023c
        .extern func_ov002_0227b28c
        .extern func_ov002_02283ab8
        .global func_ov002_02284214
        .arm
func_ov002_02284214:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r6, r0
    mov r4, r2
    mov r5, r1
    mov r1, #0x14
    ldr r0, _LIT0
    and r2, r6, #0x1
    mul r8, r2, r0
    ldr r0, _LIT1
    cmp r4, #0x4
    movgt r9, #0x1
    mul r1, r5, r1
    add r0, r0, r8
    ldr r0, [r1, r0]
    mov sl, r3
    mov r0, r0, lsr #0x6
    movle r9, #0x0
    rsb r7, r6, #0x1
    tst r0, #0x1
    bne .L_9ec
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b9dec
    ldr r1, _LIT2
    cmp r0, r1
    bgt .L_780
    bge .L_9a8
    ldr r2, _LIT3
    cmp r0, r2
    bgt .L_754
    bge .L_860
    ldr r1, _LIT4
    cmp r0, r1
    bgt .L_744
    beq .L_7f8
    b .L_9ec
.L_744:
    sub r1, r2, #0x11
    cmp r0, r1
    beq .L_860
    b .L_9ec
.L_754:
    sub r2, r1, #0x130
    cmp r0, r2
    bgt .L_770
    sub r1, r1, #0x130
    cmp r0, r1
    beq .L_968
    b .L_9ec
.L_770:
    sub r1, r1, #0xbe
    cmp r0, r1
    beq .L_8e4
    b .L_9ec
.L_780:
    add r2, r1, #0x1e8
    cmp r0, r2
    bgt .L_7bc
    bge .L_9e4
    add r2, r1, #0x8f
    cmp r0, r2
    bgt .L_7ac
    add r1, r1, #0x8f
    cmp r0, r1
    beq .L_8e4
    b .L_9ec
.L_7ac:
    add r1, r1, #0xfb
    cmp r0, r1
    beq .L_8e4
    b .L_9ec
.L_7bc:
    ldr r2, _LIT5
    cmp r0, r2
    bgt .L_7d0
    beq .L_9d4
    b .L_9ec
.L_7d0:
    add r1, r2, #0xe8
    cmp r0, r1
    bgt .L_9ec
    add r1, r2, #0xe5
    cmp r0, r1
    blt .L_9ec
    addne r1, r2, #0xe8
    cmpne r0, r1
    beq .L_8e4
    b .L_9ec
.L_7f8:
    mov r0, r6
    mov r1, r5
    bl func_ov002_021c023c
    cmp r0, #0x0
    beq .L_840
    ldr ip, _LIT6
    mov r1, #0xdc
    mov r0, #0x2c
    ldr r2, _LIT0
    and r3, r7, #0x1
    mul r0, r5, r0
    mla ip, r6, r1, ip
    mul r2, r3, r2
    ldr r1, _LIT7
    ldr r3, [r0, ip]
    ldr r0, [r1, r2]
    cmp r3, r0
    bge .L_9ec
.L_840:
    cmp sl, #0x0
    beq .L_9ec
    ldr r0, _LIT7
    ldr r0, [r0, r8]
    cmp r0, #0xfa0
    ble .L_9ec
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_860:
    cmp sl, #0x0
    beq .L_9ec
    mov r0, #0xdc
    mov sl, #0x2c
    mul r3, r6, r0
    ldr r2, _LIT6
    ldr r1, _LIT7
    ldr r0, _LIT8
    add r1, r1, r8
    mul sl, r5, sl
    add r2, r2, r3
    add r0, r0, r3
    mov ip, #0x0
    ldr sl, [sl, r2]
    mov r2, ip
    add r1, r1, #0x30
    mov r3, #0x1
.L_8a4:
    ldr lr, [r1]
    mov lr, lr, lsl #0x13
    movs lr, lr, lsr #0x13
    beq .L_8c0
    ldr lr, [r0, #0x28]
    cmp lr, sl
    movlt ip, r3
.L_8c0:
    add r2, r2, #0x1
    cmp r2, #0x5
    add r1, r1, #0x14
    add r0, r0, #0x2c
    blt .L_8a4
    cmp ip, #0x0
    bne .L_9ec
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_8e4:
    cmp r9, #0x0
    bne .L_9ec
    ldr r0, _LIT0
    mov r1, #0x14
    ldr r2, _LIT9
    and r3, r7, #0x1
    mul r1, r4, r1
    mla r0, r3, r0, r2
    ldrh r0, [r1, r0]
    mov r1, #0x2c
    cmp r0, #0x0
    mov r0, #0xdc
    beq .L_93c
    ldr r3, _LIT10
    mul r2, r4, r1
    mla r0, r7, r0, r3
    ldr r2, [r2, r0]
    add r0, r1, #0x740
    cmp r2, r0
    bge .L_9ec
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_93c:
    ldr r3, _LIT6
    mul r2, r4, r1
    mla r0, r7, r0, r3
    ldr r2, [r2, r0]
    cmp r2, #0x3e8
    ble .L_9ec
    add r0, r1, #0x740
    cmp r2, r0
    bge .L_9ec
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_968:
    ldr r0, _LIT0
    mov r1, #0x14
    ldr r2, _LIT9
    and r3, r7, #0x1
    mul r1, r4, r1
    mla r0, r3, r0, r2
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT7
    ldr r0, [r0, r8]
    cmp r0, #0x7d0
    bgt .L_9ec
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_9a8:
    ldr r0, _LIT0
    mov r1, #0x14
    ldr r2, _LIT9
    and r3, r7, #0x1
    mul r1, r4, r1
    mla r0, r3, r0, r2
    ldrh r0, [r1, r0]
    cmp r0, #0x0
    beq .L_9ec
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_9d4:
    cmp r9, #0x0
    beq .L_9ec
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_9e4:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_9ec:
    ldr r0, _LIT7
    ldr r8, [r0, r8]
    cmp r8, #0x12c
    movge r8, #0x12c
    cmp r9, #0x0
    bne .L_af4
    mov r0, r7
    mov r1, r4
    bl func_ov002_021b9dec
    ldr r8, _LIT11
    cmp r0, r8
    bne .L_a90
    ldr r0, _LIT0
    and r2, r7, #0x1
    mov r1, #0x14
    mul r0, r2, r0
    ldr r3, _LIT12
    mul r2, r4, r1
    add r1, r3, r0
    ldrh r1, [r2, r1]
    cmp r1, #0x0
    beq .L_a90
    ldr r1, _LIT7
    mov r9, #0x0
    add sl, r1, r0
.L_a50:
    mov r0, r7
    mov r1, r9
    bl func_ov002_021b9dec
    cmp r0, #0x0
    beq .L_a80
    ldrh r1, [sl, #0x38]
    cmp r1, #0x0
    beq .L_a78
    cmp r0, r8
    beq .L_a80
.L_a78:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_a80:
    add r9, r9, #0x1
    cmp r9, #0x4
    add sl, sl, #0x14
    ble .L_a50
.L_a90:
    mov r0, r6
    mov r1, r5
    bl func_ov002_021bd868
    cmp r0, #0x0
    beq .L_c28
    mov r0, r6
    mov r1, r5
    bl func_ov002_0227b28c
    cmp r0, #0x1
    bne .L_c28
    mov r0, r7
    mov r1, r4
    mov r2, #0x1
    bl func_ov002_02283ab8
    mov r2, #0x2c
    ldr r3, _LIT6
    mov r1, #0xdc
    mul r2, r5, r2
    mla r1, r6, r1, r3
    ldr r1, [r2, r1]
    add r1, r1, #0x3e8
    cmp r1, r0
    bgt .L_c28
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_af4:
    ldr r4, _LIT6
    mov r0, #0xdc
    mla r9, r6, r0, r4
    mov r1, #0x2c
    ldr r2, _LIT0
    and r3, r7, #0x1
    mul r4, r5, r1
    mul r1, r3, r2
    ldr r0, _LIT7
    ldr r2, [r9, r4]
    ldr r0, [r0, r1]
    cmp r2, r0
    movge r0, #0x1
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, r6
    mov r1, r5
    bl func_ov002_021b9dec
    ldr r2, _LIT13
    cmp r0, r2
    bgt .L_ba0
    sub r1, r2, #0x3
    cmp r0, r1
    blt .L_b5c
    cmpne r0, r2
    beq .L_c28
    b .L_be0
.L_b5c:
    ldr r2, _LIT14
    cmp r0, r2
    bgt .L_b7c
    bge .L_c28
    sub r1, r2, #0xbd
    cmp r0, r1
    beq .L_c28
    b .L_be0
.L_b7c:
    add r1, r2, #0x90
    cmp r0, r1
    bgt .L_b90
    beq .L_c28
    b .L_be0
.L_b90:
    add r1, r2, #0xfc
    cmp r0, r1
    beq .L_c28
    b .L_be0
.L_ba0:
    ldr r2, _LIT15
    cmp r0, r2
    bgt .L_bc0
    bge .L_c28
    sub r1, r2, #0xbf
    cmp r0, r1
    beq .L_c28
    b .L_be0
.L_bc0:
    add r1, r2, #0xf
    cmp r0, r1
    bgt .L_bd4
    beq .L_c28
    b .L_be0
.L_bd4:
    add r1, r2, #0x26
    cmp r0, r1
    beq .L_c28
.L_be0:
    mov r0, r6
    mov r1, r5
    bl func_ov002_021bd868
    cmp r0, #0x0
    beq .L_c28
    ldr r0, [r9, r4]
    cmp r0, r8
    blt .L_c20
    mov r0, r7
    mvn r1, #0x0
    mov r2, #0x1
    bl func_ov002_02283ab8
    ldr r1, [r9, r4]
    add r1, r1, #0x3e8
    cmp r1, r0
    bgt .L_c28
.L_c20:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_c28:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0cc
_LIT2: .word 0x000014d7
_LIT3: .word 0x000012a0
_LIT4: .word 0x00001115
_LIT5: .word 0x0000182d
_LIT6: .word data_ov002_022cd46c
_LIT7: .word data_ov002_022cf08c
_LIT8: .word data_ov002_022cd444
_LIT9: .word data_ov002_022cf0c2
_LIT10: .word data_ov002_022cd470
_LIT11: .word 0x0000148a
_LIT12: .word data_ov002_022cf0c4
_LIT13: .word 0x00001915
_LIT14: .word 0x000014d6
_LIT15: .word 0x00001a52
