; func_ov002_02269534 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf178
        .extern data_ov002_022cf198
        .extern data_ov002_022d016c
        .extern func_ov002_021b01f4
        .extern func_ov002_021b9ecc
        .extern func_ov002_021d479c
        .extern func_ov002_021d59cc
        .global func_ov002_02269534
        .arm
func_ov002_02269534:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r1, [r0, #0xd20]
    ldr r4, [r0, #0xcec]
    cmp r1, #0x0
    beq .L_30
    cmp r1, #0x1
    beq .L_74
    cmp r1, #0x2
    beq .L_104
    b .L_200
.L_30:
    cmp r4, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    mov r1, #0x0
    orr r0, r0, #0x3
    mov r0, r0, lsl #0x10
    mov r2, r1
    mov r3, r1
    mov r0, r0, lsr #0x10
    bl func_ov002_021d479c
    ldr r1, _LIT0
    add sp, sp, #0x4
    ldr r2, [r1, #0xd20]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd20]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_74:
    rsb r7, r4, #0x1
    ldr r0, _LIT1
    and r1, r7, #0x1
    mul r2, r1, r0
    ldr r0, _LIT2
    ldr r0, [r0, r2]
    cmp r0, #0x0
    bne .L_f4
    ldr r0, _LIT3
    mov r5, #0x0
    add r6, r0, r2
    mov sl, r5
    mov r9, #0x1740
    mov r8, #0x1
.L_ac:
    ldrh r0, [r6, #0x38]
    cmp r0, #0x0
    beq .L_e4
    mov r0, r7
    mov r1, r5
    bl func_ov002_021b9ecc
    cmp r0, #0x1740
    bne .L_e4
    mov r0, r7
    mov r1, r5
    mov r2, r9
    mov r3, r8
    str sl, [sp]
    bl func_ov002_021d59cc
.L_e4:
    add r5, r5, #0x1
    cmp r5, #0x4
    add r6, r6, #0x14
    ble .L_ac
.L_f4:
    ldr r0, _LIT0
    ldr r1, [r0, #0xd20]
    add r1, r1, #0x1
    str r1, [r0, #0xd20]
.L_104:
    ldr r0, _LIT0
    ldr r1, [r0, #0xd04]
    cmp r1, #0x3
    bne .L_120
    mov r0, r4
    bl func_ov002_021b01f4
    b .L_1e4
.L_120:
    ldr r1, [r0, #0xcf4]
    ldr r2, [r0, #0xcf0]
    add r0, r1, #0x3
    cmp r2, r0
    bne .L_1bc
    rsb r1, r4, #0x1
    ldr r0, _LIT1
    and r2, r4, #0x1
    and r1, r1, #0x1
    mul r3, r2, r0
    ldr r2, _LIT3
    mul r0, r1, r0
    ldr r1, [r2, r3]
    ldr r0, [r2, r0]
    cmp r1, r0
    beq .L_1bc
    ldr r1, [r2, #0x868]
    ldr r0, [r2]
    ldr r2, _LIT4
    cmp r1, r0
    ldr r0, _LIT5
    movgt r1, #0x1
    ldr r0, [r0, #0x4]
    movle r1, #0x0
    cmp r1, r0
    ldr r0, _LIT1
    and r1, r1, #0x1
    mul r3, r1, r0
    moveq r4, #0x1
    ldr r1, _LIT0
    movne r4, #0x2
    str r4, [r1, #0xd00]
    mov r4, #0x9
    ldr r0, _LIT5
    str r4, [r2, r3]
    str r4, [r0, #0x228]
    mov r0, #0x1
    str r0, [r1, #0xe0]
    b .L_1e4
.L_1bc:
    cmp r4, #0x0
    movne r0, #0x8000
    moveq r0, #0x0
    mov r1, #0x0
    orr r0, r0, #0x4
    mov r0, r0, lsl #0x10
    mov r2, r1
    mov r3, r1
    mov r0, r0, lsr #0x10
    bl func_ov002_021d479c
.L_1e4:
    ldr r1, _LIT0
    add sp, sp, #0x4
    ldr r2, [r1, #0xd20]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0xd20]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_200:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf178
_LIT3: .word data_ov002_022cf16c
_LIT4: .word data_ov002_022cf198
_LIT5: .word data_ov002_022cd73c
