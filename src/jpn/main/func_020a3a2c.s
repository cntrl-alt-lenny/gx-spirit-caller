; func_020a3a2c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a9814
        .extern data_021a9818
        .extern data_021a981c
        .extern func_02094398
        .extern func_02094500
        .extern func_02096318
        .extern func_020a1600
        .extern func_020a1d48
        .extern func_020a3214
        .extern func_020a3c40
        .extern func_020a4a78
        .extern func_020a5c60
        .extern func_020a5c80
        .global func_020a3a2c
        .arm
func_020a3a2c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r4, r0
    bl OS_DisableIrq
    ldr r1, _LIT0
    ldr r2, _LIT1
    ldr r3, [r1]
    ldr r1, _LIT2
    strh r4, [r3, #0x32]
    ldr r3, [r2]
    ldr r2, _LIT3
    add r1, r3, r1
    bic r1, r1, #0x1f
    mov r4, r0
    str r1, [r2]
    add r0, r3, #0x1000
    ldr r5, [r0, #0x4e4]
    ldr r2, _LIT4
    add r1, r3, #0x1340
    mov r0, #0x0
    bl func_02094398
    mov r0, r5
    bl func_020a1d48
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r3, [r1]
    ldr r2, [r0]
    add r0, r3, #0x500
    ldrh r3, [r0]
    add r0, r2, #0x1000
    sub r2, r3, #0x6
    str r2, [r0, #0x318]
    ldr r0, [r1]
    add r0, r0, #0x500
    ldrh r0, [r0, #0x2]
    bl func_020a5c80
    ldr r1, _LIT1
    ldr r0, _LIT5
    ldr r1, [r1]
    add r0, r1, r0
    bl func_020a5c60
    mov r5, #0x0
    ldr r2, _LIT1
    mov r0, r5
    mvn r3, #0x0
.L_b4:
    ldr r1, [r2]
    add r1, r1, r5, lsl #0x2
    add r1, r1, #0x1000
    str r0, [r1, #0x4e8]
    ldr r1, [r2]
    add r1, r1, r5
    add r1, r1, #0x1000
    add r5, r5, #0x1
    strb r3, [r1, #0x526]
    cmp r5, #0xf
    blt .L_b4
    ldr r1, [r2]
    ldr r3, _LIT6
    add r1, r1, #0x1000
    strb r0, [r1, #0x524]
    ldr r1, [r2]
    ldr r2, _LIT7
    add r1, r1, r3
    bl func_02094398
    ldr r1, _LIT1
    ldr r0, _LIT8
    ldr r2, [r1]
    mov r1, #0x0
    add r0, r2, r0
    mov r2, #0x1e
    bl func_02094500
    ldr r2, _LIT0
    mov r3, #0x1
    ldr r0, [r2]
    ldr r1, _LIT9
    add r0, r0, #0x500
    strh r3, [r0, #0x24]
    ldr r0, [r2]
    ldr r3, _LIT10
    str r1, [r0, #0x51c]
    ldr r0, [r2]
    mov r1, #0xf
    str r3, [r0, #0x508]
    ldr r3, [r2]
    add r0, r3, #0x500
    ldrh r0, [r0]
    strh r0, [r3, #0x34]
    ldr r0, [r2]
    ldrh r3, [r0, #0x34]
    add r0, r0, #0x500
    add r3, r3, #0x23
    bic r3, r3, #0x1f
    strh r3, [r0, #0x18]
    ldr r3, [r2]
    add r0, r3, #0x500
    ldrh r0, [r0, #0x2]
    strh r0, [r3, #0x36]
    ldr r0, [r2]
    ldrh r2, [r0, #0x36]
    add r0, r0, #0x500
    add r2, r2, #0xe
    mul r1, r2, r1
    add r1, r1, #0x29
    bic r1, r1, #0x1f
    mov r1, r1, lsl #0x1
    strh r1, [r0, #0x1a]
    bl func_020a3214
    bl func_020a3c40
    mov r5, r0
    mov r0, r4
    bl OS_RestoreIrq
    mov r0, #0xf
    mov r1, #0x1
    bl func_02096318
    ldr r1, _LIT1
    ldr r1, [r1]
    add r1, r1, #0x7000
    str r0, [r1, #0x4c8]
    mov r0, r5
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a9818
_LIT1: .word data_021a981c
_LIT2: .word 0x00007d1f
_LIT3: .word data_021a9814
_LIT4: .word 0x000069c0
_LIT5: .word 0x00001538
_LIT6: .word 0x00001788
_LIT7: .word 0x00005d40
_LIT8: .word 0x00001754
_LIT9: .word func_020a1600
_LIT10: .word func_020a4a78
