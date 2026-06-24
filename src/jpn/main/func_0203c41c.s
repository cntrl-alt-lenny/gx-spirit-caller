; func_0203c41c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_0219b248
        .extern data_0219b28c
        .extern data_0219b2a4
        .extern data_0219cf90
        .extern data_0219cf9c
        .extern func_0203ba50
        .extern func_0203bb5c
        .extern func_0203c5e8
        .extern func_0207cef4
        .extern func_0207cf0c
        .extern func_0207d044
        .extern func_020881ec
        .extern func_02088430
        .extern func_02092660
        .extern func_020926d0
        .global func_0203c41c
        .arm
func_0203c41c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    movs r4, r0
    mov r2, r1
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r2, #0x0
    beq .L_30
    ldrh r3, [r4, #0xb0]
    mov r1, #0x0
    orr r3, r3, #0x1000
    strh r3, [r4, #0xb0]
    bl func_0203c5e8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_30:
    ldr r1, _LIT0
    mov r2, #0x1
    ldr r0, _LIT1
    str r2, [r1]
    bl func_020926d0
    ldr r0, _LIT2
    bl func_020926d0
    ldrh r1, [r4, #0xb0]
    add r0, r4, #0x4
    orr r1, r1, #0x1
    strh r1, [r4, #0xb0]
    bl func_020881ec
    ldrh r0, [r4, #0xb0]
    tst r0, #0x2000
    bne .L_7c
    add r0, r4, #0x4
    bl func_02088430
    mov r0, r4
    bl func_0203ba50
.L_7c:
    bl OS_DisableIrq
    ldr r6, _LIT3
    ldr r5, _LIT4
    mov r7, r0
    mov r8, #0x0
.L_90:
    mov r0, r6
    mov r1, r8
    bl func_0207cef4
    movs r8, r0
    beq .L_cc
    ldr r0, [r8, #0x8]
    cmp r0, r4
    bne .L_90
    mov r0, r6
    mov r1, r8
    bl func_0207cf0c
    mov r0, r5
    mov r1, r8
    bl func_0207d044
    b .L_90
.L_cc:
    mov r0, r7
    bl OS_RestoreIrq
    mov r0, r4
    bl func_0203bb5c
    mov r2, #0x0
    strh r2, [r4, #0xb0]
    ldr r1, [r4]
    ldr r0, _LIT2
    str r2, [r1]
    bl func_02092660
    ldr r0, _LIT1
    bl func_02092660
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_0219b248
_LIT1: .word data_0219b2a4
_LIT2: .word data_0219b28c
_LIT3: .word data_0219cf90
_LIT4: .word data_0219cf9c
