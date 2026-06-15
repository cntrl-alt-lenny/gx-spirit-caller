; func_020964a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern data_021a8284
        .extern data_021a8288
        .extern func_020905a8
        .extern func_02090624
        .extern func_020907b4
        .extern func_02096234
        .global func_020964a0
        .arm
func_020964a0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    bl OS_DisableIrq
    ldr r1, _LIT0
    mov r4, r0
    ldrh r0, [r1]
    cmp r0, #0x0
    bne .L_dc
    mov r2, #0x1
    ldr r0, _LIT1
    strh r2, [r1]
    mov r2, #0x0
    str r2, [r0, #0x388]
    ldr r0, _LIT2
    mov r1, r2
.L_3c:
    str r1, [r0, r2, lsl #0x2]
    add r2, r2, #0x1
    cmp r2, #0x20
    blt .L_3c
    ldr r2, _LIT3
    ldr r1, _LIT4
    mov r0, #0x40000
    strh r2, [r1]
    bl func_020905a8
    ldr r1, _LIT5
    mov r0, #0x40000
    bl func_020907b4
    mov r0, #0x40000
    bl func_02090624
    mov ip, #0x0
    ldr r3, _LIT6
    mov r1, ip
    mov r2, #0x3e8
.L_84:
    ldrh r0, [r3]
    ands lr, r0, #0xf
    mov r0, lr, lsl #0x8
    strh r0, [r3]
    bne .L_a0
    cmp ip, #0x4
    bgt .L_dc
.L_a0:
    ldrh r0, [r3]
    mov r5, r2
    and r0, r0, #0xf
    cmp r0, lr
    bne .L_d4
.L_b4:
    cmp r5, #0x0
    movle ip, r1
    ble .L_d4
    ldrh r0, [r3]
    sub r5, r5, #0x1
    and r0, r0, #0xf
    cmp r0, lr
    beq .L_b4
.L_d4:
    add ip, ip, #0x1
    b .L_84
.L_dc:
    mov r0, r4
    bl OS_RestoreIrq
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, lr}
    bx lr
_LIT0: .word data_021a8284
_LIT1: .word 0x027ffc00
_LIT2: .word data_021a8288
_LIT3: .word 0x0000c408
_LIT4: .word 0x04000184
_LIT5: .word func_02096234
_LIT6: .word 0x04000180
