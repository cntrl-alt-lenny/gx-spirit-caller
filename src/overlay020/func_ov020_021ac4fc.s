; func_ov020_021ac4fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov020_021ae0a8
        .extern data_ov020_021ae0e8
        .extern func_020373cc
        .extern func_0207ec68
        .extern func_0207ed94
        .extern func_0207f05c
        .extern func_0208c884
        .extern func_0208c940
        .extern func_020b3870
        .extern func_ov020_021ab81c
        .global func_ov020_021ac4fc
        .arm
func_ov020_021ac4fc:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x10
    mov r6, #0x0
    add r0, sp, #0x0
    ldr r5, _LIT0
    ldr r7, _LIT1
    mov r4, r6
    str r6, [r0]
    str r6, [r0, #0x4]
.L_18c:
    mov r0, r7
    bl func_0207ed94
    mov r0, r7
    bl func_0207ec68
    add r0, r7, #0x1c
    add r4, r4, #0x1
    cmp r4, #0x2
    add r7, r0, #0x400
    blt .L_18c
    add r0, r5, #0x78
    add r2, r0, #0x400
    add r3, r5, #0x5c
    add r1, sp, #0x8
    add r0, r5, #0x40
    str r3, [sp, #0x8]
    str r2, [sp, #0xc]
    bl func_ov020_021ab81c
    ldr r1, [sp]
    add r7, r5, #0x5c
    add r0, r1, r0
    str r0, [sp]
    add r8, r5, #0x40
    mov r9, #0x0
    add r4, sp, #0x0
.L_1ec:
    ldr r0, [r4, r9, lsl #0x2]
    cmp r0, #0x0
    ble .L_20c
    mov r2, r0, lsl #0x10
    mov r0, r8
    mov r1, r7
    mov r2, r2, lsr #0x10
    bl func_0207f05c
.L_20c:
    add r0, r7, #0x1c
    add r1, r8, #0x1c
    add r9, r9, #0x1
    cmp r9, #0x2
    add r7, r0, #0x400
    add r8, r1, #0x400
    blt .L_1ec
    mov r1, #0x4000000
    ldr r0, [r1]
    add r2, r1, #0x1000
    bic r0, r0, #0x1f00
    orr r0, r0, #0x1b00
    str r0, [r1]
    ldrh r3, [r1, #0x8]
    ldr r0, _LIT2
    bic r3, r3, #0x3
    orr r3, r3, #0x1
    strh r3, [r1, #0x8]
    ldrh r3, [r1, #0xa]
    bic r3, r3, #0x3
    orr r3, r3, #0x2
    strh r3, [r1, #0xa]
    ldrh r3, [r1, #0xc]
    bic r3, r3, #0x3
    strh r3, [r1, #0xc]
    ldrh r3, [r1, #0xe]
    bic r3, r3, #0x3
    orr r3, r3, #0x3
    strh r3, [r1, #0xe]
    ldr r1, [r2]
    bic r1, r1, #0x1f00
    orr r1, r1, #0x1900
    str r1, [r2]
    ldrh r1, [r0]
    bic r1, r1, #0x3
    strh r1, [r0]
    ldrh r1, [r0, #0x2]
    bic r1, r1, #0x3
    orr r1, r1, #0x1
    strh r1, [r0, #0x2]
    ldrh r1, [r0, #0x4]
    bic r1, r1, #0x3
    orr r1, r1, #0x2
    strh r1, [r0, #0x4]
    ldrh r1, [r0, #0x6]
    bic r1, r1, #0x3
    orr r1, r1, #0x3
    strh r1, [r0, #0x6]
    bl func_0208c940
    ldr r1, _LIT3
    ldr r0, [r1]
    orr r0, r0, #0x10000
    str r0, [r1]
    ldr r0, [r5, #0x87c]
    ldr r1, [r5, #0x878]
    subs r0, r0, #0x1000
    str r0, [r5, #0x87c]
    movmi r0, #0x0
    strmi r0, [r5, #0x87c]
    ldr r0, [r5, #0x87c]
    mov r0, r0, lsl #0x4
    rsb r0, r0, #0x0
    bl func_020b3870
    mov r4, r0
    ldr r0, _LIT4
    mov r1, r4
    bl func_0208c884
    ldr r0, _LIT5
    mov r1, r4
    bl func_0208c884
    ldr r0, [r5, #0x87c]
    cmp r0, #0x0
    bne .L_364
    ldr r0, _LIT4
    mov r1, #0x0
    bl func_0208c884
    ldr r0, _LIT5
    mov r1, #0x0
    bl func_0208c884
    mov r2, #0x0
    mov r1, #0x1
    sub r3, r2, #0x1
    mov r0, #0x1b
    str r1, [r5]
    bl func_020373cc
    mov r6, #0x1
.L_364:
    mov r0, r6
    add sp, sp, #0x10
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov020_021ae0a8
_LIT1: .word data_ov020_021ae0e8
_LIT2: .word 0x04001008
_LIT3: .word 0x04001000
_LIT4: .word 0x0400006c
_LIT5: .word 0x0400106c
