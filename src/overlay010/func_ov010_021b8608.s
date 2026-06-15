; func_ov010_021b8608 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_02104f4c
        .extern data_ov010_021b9884
        .extern data_ov010_021b9890
        .extern data_ov010_021b99ec
        .extern data_ov010_021b99f0
        .extern data_ov010_021b99f4
        .extern data_ov010_021b99f8
        .extern func_ov005_021aaf40
        .extern func_ov005_021ab0fc
        .extern func_ov005_021ab260
        .extern func_ov005_021ab274
        .extern func_ov005_021ab2e0
        .extern func_ov005_021ab318
        .extern func_ov005_021ab384
        .extern func_ov005_021ab3b4
        .extern func_ov005_021abbfc
        .extern func_ov010_021b35a4
        .global func_ov010_021b8608
        .arm
func_ov010_021b8608:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x14
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r2, _LIT2
    ldr r3, _LIT3
    ldr r4, _LIT4
    ldr r5, _LIT5
    bl func_ov010_021b35a4
    ldr r0, _LIT6
    mov r9, #0x0
    ldr r0, [r0, #0x90]
    add r2, sp, #0x8
    mov r1, r9
    bl func_ov005_021ab274
    strh r0, [sp]
    add r7, sp, #0x8
    add r6, sp, #0x0
.L_1a04:
    ldr r0, [r4, #0x84]
    mov r1, r7
    add r9, r9, #0x1
    bl func_ov005_021ab2e0
    mov r1, r9, lsl #0x1
    strh r0, [r6, r1]
    ldrh r0, [r6, r1]
    cmp r0, #0x0
    beq .L_1a30
    cmp r9, #0x4
    blt .L_1a04
.L_1a30:
    add r2, r5, #0x1800
    ldrh r6, [r2, #0xc2]
    mvn r1, #0x0
    ldr r0, [r4, #0x84]
    mov r3, r6, lsl #0x1c
    orr r1, r1, r3, lsr #0x1c
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    bic r3, r6, #0xf
    and r1, r1, #0xf
    orr r1, r3, r1
    strh r1, [r2, #0xc2]
    mov r6, #0x1
    bl func_ov005_021ab0fc
    cmp r0, #0x1
    blt .L_1bb4
.L_1a70:
    ldr r0, [r4, #0x84]
    mov r1, r6
    bl func_ov005_021ab3b4
    ldr r0, _LIT6
    mov r1, r6
    ldr r0, [r0, #0x90]
    bl func_ov005_021ab3b4
    mov r2, r0, lsl #0x10
    ldr r0, [r4, #0x84]
    mov r1, r6
    mov r8, r2, lsr #0x10
    mov r7, #0x1
    bl func_ov005_021ab260
    cmp r0, #0x0
    bgt .L_1ba0
    ldr r0, [r4, #0x84]
    mov r1, r6
    mov r2, #0x8
    bl func_ov005_021ab384
    cmp r0, #0x0
    ldr r0, _LIT5
    mov r1, r8, asr #0x5
    add r0, r0, r1, lsl #0x2
    add r0, r0, #0x1000
    ldr r0, [r0, #0x8b8]
    and r1, r8, #0x1f
    mov r2, #0x1
    movne r7, #0x0
    tst r0, r2, lsl r1
    moveq r2, #0x0
    cmp r2, #0x0
    moveq r7, #0x0
    cmp r7, #0x0
    bne .L_1ba0
    ldr r0, [r4, #0x84]
    mov r1, r6
    bl func_ov005_021ab318
    mov r7, r0
    ldr r0, [r4, #0x84]
    mov r1, r7
    bl func_ov005_021ab318
    cmp r0, #0x0
    ble .L_1b40
.L_1b1c:
    ldr r0, [r4, #0x84]
    mov r1, r7
    bl func_ov005_021ab318
    mov r7, r0
    ldr r0, [r4, #0x84]
    mov r1, r7
    bl func_ov005_021ab318
    cmp r0, #0x0
    bgt .L_1b1c
.L_1b40:
    cmp r9, #0x0
    mov r2, #0x0
    ble .L_1ba0
    add r1, sp, #0x0
.L_1b50:
    mov r0, r2, lsl #0x1
    ldrh r0, [r1, r0]
    cmp r7, r0
    bne .L_1b94
    add r1, r5, #0x1800
    ldrh r3, [r1, #0xc2]
    mov r0, #0x1
    mvn r0, r0, lsl r2
    mov r2, r3, lsl #0x1c
    and r0, r0, r2, lsr #0x1c
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r2, r3, #0xf
    and r0, r0, #0xf
    orr r0, r2, r0
    strh r0, [r1, #0xc2]
    b .L_1ba0
.L_1b94:
    add r2, r2, #0x1
    cmp r2, r9
    blt .L_1b50
.L_1ba0:
    ldr r0, [r4, #0x84]
    add r6, r6, #0x1
    bl func_ov005_021ab0fc
    cmp r6, r0
    ble .L_1a70
.L_1bb4:
    ldr r0, [r4, #0x88]
    bl func_ov005_021abbfc
    ldr r0, [r4, #0x84]
    bl func_ov005_021aaf40
    ldr r0, [r4, #0x344]
    bl Task_InvokeLocked
    ldr r0, [r4, #0x354]
    bl Task_InvokeLocked
    mov r0, #0x1
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov010_021b99ec
_LIT1: .word data_ov010_021b99f0
_LIT2: .word data_ov010_021b99f4
_LIT3: .word data_ov010_021b99f8
_LIT4: .word data_ov010_021b9890
_LIT5: .word data_02104f4c
_LIT6: .word data_ov010_021b9884
