; func_020a3f48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Fill32
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021026ec
        .extern data_021026f0
        .extern data_021026f4
        .extern data_021026f8
        .extern data_021026fc
        .extern data_02102700
        .extern data_021a98f0
        .extern data_021a98f8
        .extern data_021a98fc
        .extern func_0209448c
        .extern func_02094688
        .extern func_0209e124
        .extern func_020a4180
        .global func_020a3f48
        .arm
func_020a3f48:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    ldr r4, _LIT0
    mov r9, r1
    ldr r1, [r4]
    mov r8, r2
    mov r7, r3
    cmp r1, #0x0
    beq .L_4c8
    add r1, r1, #0x1300
    ldrh r1, [r1, #0x16]
    cmp r1, #0x0
    addne sp, sp, #0x4
    movne r0, #0x2
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxne lr
.L_4c8:
    add r1, r0, #0x1f
    ldr r0, _LIT1
    bic r6, r1, #0x1f
    add r0, r6, r0
    cmp r7, #0x10000
    bic r5, r0, #0x1f
    bne .L_4ec
    bl func_0209e124
    mov r7, r0
.L_4ec:
    bl OS_DisableIrq
    ldr ip, _LIT2
    ldr r3, _LIT0
    mov r4, r0
    ldr r1, [sp, #0x20]
    ldr r0, _LIT3
    ldr r2, _LIT4
    strh r1, [r0]
    ldr r0, _LIT5
    ldr r1, _LIT6
    strh r2, [r0]
    mov r2, #0x5
    ldr r0, _LIT7
    strh r2, [r1]
    mov r2, #0x28
    ldr r1, _LIT8
    strh r2, [r0]
    ldr r0, _LIT9
    strh r2, [r1]
    mov r2, #0x1
    mov r1, r6
    str r2, [r0]
    mov r0, #0x0
    mov r2, #0x1e00
    str r6, [ip]
    str r5, [r3]
    bl Fill32
    mov r1, r5
    mov r0, #0x0
    mov r2, #0x1340
    bl func_0209448c
    ldrb r0, [r9, #0x1]
    add r1, r6, #0x530
    mov r2, #0x0
    cmp r0, #0x0
    ble .L_598
.L_57c:
    add r0, r9, r2, lsl #0x1
    ldrh r0, [r0, #0x2]
    add r2, r2, #0x1
    strh r0, [r1], #0x2
    ldrb r0, [r9, #0x1]
    cmp r2, r0
    blt .L_57c
.L_598:
    ldr r0, _LIT10
    mov r3, #0x0
    add ip, r6, r0
    ldr r0, _LIT11
.L_5a8:
    ldr r2, [r0]
    ldrh r1, [r2]
    cmp r1, #0x0
    beq .L_5d4
    add r1, r2, #0x2
    str r1, [r0]
    ldrh r1, [r2]
    add r3, r3, #0x1
    cmp r3, #0x10
    strh r1, [ip], #0x2
    blt .L_5a8
.L_5d4:
    mov r0, r9
    add r1, r5, #0x1300
    mov r2, #0x16
    bl func_02094688
    ldrb r0, [r9, #0x1]
    mov r2, #0x0
    cmp r0, #0xa
    addcc r0, r5, r0, lsl #0x1
    addcc r0, r0, #0x1300
    movcc r1, #0x0
    strcch r1, [r0, #0x2]
    add r0, r6, #0x500
    mov r1, #0x100
    strh r1, [r0]
    mov r1, #0x8
    strh r1, [r0, #0x2]
    strh r2, [r0, #0x18]
    strh r2, [r0, #0x1a]
    mov r1, #0x1
    strh r1, [r0, #0x2c]
    add r0, r5, #0x400
    str r0, [r6, #0x504]
    strh r2, [r6, #0xe]
    strh r2, [r6, #0x12]
    strh r1, [r6, #0x16]
    strh r2, [r6, #0x14]
    str r8, [r6, #0x8]
    strh r7, [r6, #0xc]
    bl func_020a4180
    add r0, r0, #0xc8
    strh r0, [r6, #0x18]
    mov r0, #0xf
    strh r0, [r6, #0x10]
    mov r3, #0x0
    strb r3, [r6, #0x50c]
    strb r3, [r6, #0x50d]
    add r1, r5, #0x1300
    mov r2, #0x1
    strh r2, [r1, #0x16]
    add r1, r5, #0x1000
    mov r0, r4
    str r3, [r1, #0x31c]
    bl OS_RestoreIrq
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
_LIT0: .word data_021a98fc
_LIT1: .word 0x00001e1f
_LIT2: .word data_021a98f8
_LIT3: .word data_021a98f0
_LIT4: .word 0x0000ffff
_LIT5: .word data_021026f8
_LIT6: .word data_021026ec
_LIT7: .word data_021026f0
_LIT8: .word data_021026f4
_LIT9: .word data_02102700
_LIT10: .word 0x00000538
_LIT11: .word data_021026fc
