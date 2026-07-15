; func_ov010_021b64e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern data_02104e6c
        .extern data_ov010_021b90b4
        .extern data_ov010_021b9160
        .extern data_ov010_021b92b4
        .extern data_ov010_021b92b8
        .extern data_ov010_021b92bc
        .extern data_ov010_021b92c0
        .extern func_ov005_021aae60
        .extern func_ov005_021ab180
        .extern func_ov005_021ab194
        .extern func_ov005_021ab200
        .extern func_ov005_021ab2a4
        .extern func_ov005_021abb1c
        .extern func_ov010_021b34a4
        .global func_ov010_021b64e4
        .arm
func_ov010_021b64e4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x30
    ldr r0, _LIT0
    ldr r1, _LIT1
    ldr r2, _LIT2
    ldr r3, _LIT3
    bl func_ov010_021b34a4
    mov r5, #0x0
    ldr r0, _LIT4
    add r2, sp, #0x0
    ldr r0, [r0, #0x128]
    mov r1, r5
    mov r6, r5
    bl func_ov005_021ab194
    mov r7, r0
    mov r8, r7
    mov r9, #0x1
.L_44:
    ldr r0, _LIT5
    mov r1, r7
    ldr r0, [r0, #0x7c]
    bl func_ov005_021ab180
    cmp r0, #0x0
    ble .L_84
    add r1, sp, #0x0
    add r6, r6, #0x1
    mov r0, #0xc
    mla r2, r6, r0, r1
    ldr r0, _LIT5
    mov r1, r7
    ldr r0, [r0, #0x7c]
    bl func_ov005_021ab194
    mov r7, r0
    b .L_19c
.L_84:
    ldr r0, _LIT5
    mov r1, r7
    ldr r0, [r0, #0x7c]
    mov r2, #0x1
    bl func_ov005_021ab2a4
    cmp r0, #0x0
    add r1, sp, #0x0
    mov r0, #0xc
    mla sl, r6, r0, r1
    ldr r0, _LIT5
    mov r1, sl
    ldr r0, [r0, #0x7c]
    moveq r9, #0x0
    bl func_ov005_021ab200
    movs r7, r0
    bne .L_19c
    ldr r0, _LIT6
    mov fp, #0x1
    add r4, r0, #0x18c0
.L_d0:
    sub sl, sl, #0xc
    subs r6, r6, #0x1
    bmi .L_19c
    ldr r0, _LIT5
    mov r1, sl
    ldr r0, [r0, #0x7c]
    bl func_ov005_021ab200
    mov r7, r0
    cmp r6, #0x0
    bne .L_194
    cmp r9, #0x1
    bne .L_15c
    ldr r0, _LIT6
    mov r1, r8, asr #0x5
    add r0, r0, r1, lsl #0x2
    add r0, r0, #0x1000
    ldr r0, [r0, #0x888]
    and r2, r8, #0x1f
    tst r0, fp, lsl r2
    movne r0, fp
    moveq r0, #0x0
    cmp r0, #0x1
    bne .L_15c
    ldrh r2, [r4]
    mov r0, #0x1
    mov r1, r0, lsl r5
    bic r0, r2, #0xf
    mov r2, r2, lsl #0x1c
    orr r1, r1, r2, lsr #0x1c
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    and r1, r1, #0xf
    orr r0, r0, r1
    strh r0, [r4]
    b .L_188
.L_15c:
    ldrh r2, [r4]
    mov r0, #0x1
    mvn r1, r0, lsl r5
    bic r0, r2, #0xf
    mov r2, r2, lsl #0x1c
    and r1, r1, r2, lsr #0x1c
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    and r1, r1, #0xf
    orr r0, r0, r1
    strh r0, [r4]
.L_188:
    mov r8, r7
    add r5, r5, #0x1
    mov r9, #0x1
.L_194:
    cmp r7, #0x0
    beq .L_d0
.L_19c:
    cmp r6, #0x0
    bge .L_44
    ldr r0, _LIT5
    ldr r0, [r0, #0x80]
    bl func_ov005_021abb1c
    ldr r0, _LIT5
    ldr r0, [r0, #0x7c]
    bl func_ov005_021aae60
    ldr r0, _LIT5
    ldr r0, [r0, #0x164]
    bl Task_InvokeLocked
    ldr r0, _LIT5
    ldr r0, [r0, #0x16c]
    bl Task_InvokeLocked
    ldr r0, _LIT5
    ldr r0, [r0, #0x168]
    bl Task_InvokeLocked
    mov r0, #0x1
    add sp, sp, #0x30
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov010_021b92b4
_LIT1: .word data_ov010_021b92b8
_LIT2: .word data_ov010_021b92bc
_LIT3: .word data_ov010_021b92c0
_LIT4: .word data_ov010_021b90b4
_LIT5: .word data_ov010_021b9160
_LIT6: .word data_02104e6c
