; func_0205468c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffaa0
        .extern data_020ffaac
        .extern data_020ffab4
        .extern data_020ffabc
        .extern data_020ffac4
        .extern data_020ffad0
        .extern data_020ffadc
        .extern func_02045398
        .extern func_02054144
        .extern func_020a6c60
        .global func_0205468c
        .arm
func_0205468c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    movs r7, r3
    mov sl, r0
    mov r9, r1
    mov r8, r2
    ldr r6, [sp, #0x24]
    bne .L_30
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x38
    bl func_020a6c60
.L_30:
    ldr r0, [sp, #0x20]
    cmp r0, #0x0
    bne .L_50
    ldr r0, _LIT2
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x39
    bl func_020a6c60
.L_50:
    cmp sl, #0x0
    bne .L_6c
    ldr r0, _LIT3
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x3a
    bl func_020a6c60
.L_6c:
    cmp r9, #0x0
    bne .L_88
    ldr r0, _LIT4
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x3b
    bl func_020a6c60
.L_88:
    mov r0, #0x14
    bl func_02045398
    movs r5, r0
    bne .L_ac
    ldr r0, _LIT5
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x3e
    bl func_020a6c60
.L_ac:
    mov r0, r9, lsl #0x2
    bl func_02045398
    str r0, [r5]
    ldr r0, [r5]
    cmp r0, #0x0
    bne .L_d8
    ldr r0, _LIT6
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x41
    bl func_020a6c60
.L_d8:
    cmp r9, #0x0
    mov r4, #0x0
    ble .L_108
.L_e4:
    mov r0, sl
    mov r1, r8
    mov r2, r6
    bl func_02054144
    ldr r1, [r5]
    str r0, [r1, r4, lsl #0x2]
    add r4, r4, #0x1
    cmp r4, r9
    blt .L_e4
.L_108:
    str r9, [r5, #0x4]
    ldr r0, [sp, #0x20]
    str r6, [r5, #0x8]
    str r0, [r5, #0x10]
    mov r0, r5
    str r7, [r5, #0xc]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_020ffab4
_LIT1: .word data_020ffaa0
_LIT2: .word data_020ffabc
_LIT3: .word data_020ffac4
_LIT4: .word data_020ffad0
_LIT5: .word data_020ffaac
_LIT6: .word data_020ffadc
