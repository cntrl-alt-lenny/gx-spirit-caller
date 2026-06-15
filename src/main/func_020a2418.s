; func_020a2418 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a9844
        .extern data_021a98fc
        .extern func_02094688
        .extern func_020a2100
        .extern func_020a2394
        .extern func_020a333c
        .extern func_020a34e0
        .extern func_020a3634
        .extern func_020a5864
        .extern func_020a5878
        .extern func_020a5894
        .global func_020a2418
        .arm
func_020a2418:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r9, r0
    mov r8, r1
    mov r6, #0xff
    bl OS_DisableIrq
    mov r5, r0
    bl func_020a3634
    cmp r0, #0x0
    bne .L_5f0
    mov r0, r5
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
.L_5f0:
    ldr r0, _LIT0
    ldr r0, [r0]
    add r1, r0, #0x1000
    ldrb r1, [r1, #0x524]
    add r1, r1, #0x1
    cmp r1, #0x10
    ble .L_624
    mov r0, r5
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
.L_624:
    ldr r1, _LIT1
    mov r4, #0x0
.L_62c:
    mla r2, r4, r1, r0
    add r2, r2, #0x1000
    ldr r3, [r2, #0xd40]
    cmp r3, r9
    bne .L_658
    mov r0, r5
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
.L_658:
    ldrb r2, [r2, #0xd52]
    cmp r2, #0x0
    moveq r6, r4
    beq .L_678
    add r2, r4, #0x1
    and r4, r2, #0xff
    cmp r4, #0x10
    bcc .L_62c
.L_678:
    cmp r4, #0x10
    bne .L_698
    mov r0, r5
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
.L_698:
    ldr r1, _LIT1
    ldr r2, _LIT0
    mul r4, r6, r1
    add r0, r0, r4
    add r0, r0, #0x1000
    str r9, [r0, #0xd40]
    ldr r2, [r2]
    ldr r0, _LIT2
    mov r1, r8
    add r0, r2, r0
    add r7, r0, r4
    mov r0, r7
    bl func_020a2394
    add r0, r9, #0x1c
    add r1, r7, #0xc4
    mov r2, #0x20
    bl func_02094688
    ldr r1, _LIT0
    ldr r0, _LIT3
    ldr r2, [r1]
    mov r1, r7
    add r0, r2, r0
    add r0, r0, r4
    bl func_020a2100
    cmp r0, #0x0
    bne .L_718
    mov r0, r5
    bl OS_RestoreIrq
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
.L_718:
    ldr r1, _LIT0
    ldr r0, _LIT4
    ldr r2, [r1]
    mov r1, r9
    add r0, r2, r0
    add r0, r0, r4
    add r2, r2, #0x1300
    bl func_020a34e0
    ldr r2, _LIT0
    ldr r1, _LIT4
    ldr r0, [r2]
    add r0, r0, r4
    add r0, r0, #0x1000
    strb r6, [r0, #0xd21]
    ldr r0, [r2]
    add r0, r0, r1
    add r0, r0, r4
    bl func_020a333c
    ldr r0, _LIT5
    ldr r1, _LIT0
    ldrb r7, [r0]
    ldr r3, [r1]
    mov r2, #0x1
    add r6, r7, #0x1
    add r3, r3, r4
    strb r6, [r0]
    add r0, r3, #0x1000
    strb r7, [r0, #0xd1f]
    ldr r0, [r1]
    add r3, r8, #0x1e8
    add r0, r0, r4
    add r0, r0, #0x1d00
    strh r2, [r0, #0x4e]
    ldr r0, [r1]
    add r2, r8, #0x258
    add r0, r0, r4
    add r0, r0, #0x1000
    str r8, [r0, #0xd44]
    ldr r0, [r1]
    add r0, r0, r4
    add r0, r0, #0x1000
    str r3, [r0, #0xd54]
    ldr r0, [r1]
    add r0, r0, r4
    add r0, r0, #0x1000
    str r2, [r0, #0xd58]
    ldr r0, [r1]
    add r0, r0, r4
    add r0, r0, #0x1000
    ldr r0, [r0, #0xd54]
    ldr r0, [r0, #0x6c]
    cmp r0, #0x0
    beq .L_824
    bl func_020a5878
    cmp r0, #0x0
    bne .L_824
    ldr r1, _LIT0
    ldr r0, _LIT6
    ldr r1, [r1]
    add r0, r1, r0
    bl func_020a5864
    ldr r1, _LIT0
    ldr r0, _LIT7
    ldr r2, [r1]
    mov r1, #0x800
    add r0, r2, r0
    bl func_020a5894
.L_824:
    ldr r2, _LIT0
    mov r3, #0x1
    ldr r1, [r2]
    mov r0, r5
    add r1, r1, r4
    add r1, r1, #0x1000
    strb r3, [r1, #0xd52]
    ldr r1, [r2]
    add r1, r1, #0x1000
    ldrb r2, [r1, #0x524]
    add r2, r2, #0x1
    strb r2, [r1, #0x524]
    bl OS_RestoreIrq
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
_LIT0: .word data_021a98fc
_LIT1: .word 0x000005d4
_LIT2: .word 0x00001788
_LIT3: .word 0x00001d2c
_LIT4: .word 0x0000186c
_LIT5: .word data_021a9844
_LIT6: .word 0x00007ce0
_LIT7: .word 0x000074e0
