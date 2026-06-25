; func_02057a8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ffff0
        .extern data_02100020
        .extern data_02100038
        .extern data_0210004c
        .extern data_02100060
        .extern data_02100074
        .extern data_02100084
        .extern data_021000b0
        .extern data_021000d4
        .extern func_0204537c
        .extern func_02054b88
        .extern func_02054cd8
        .extern func_0205ff4c
        .extern func_02060430
        .extern func_020a6c60
        .global func_02057a8c
        .arm
func_02057a8c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    mov fp, r0
    ldr r0, [sp, #0x3c]
    mov sl, r1
    mvn r1, #0x0
    str r2, [sp]
    str r3, [sp, #0x4]
    cmp sl, r1
    str r0, [sp, #0x3c]
    bne .L_40
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x150
    bl func_020a6c60
.L_40:
    ldr r0, [sp]
    cmp r0, #0x0
    bne .L_60
    ldr r0, _LIT2
    ldr r1, _LIT1
    ldr r3, _LIT3
    mov r2, #0x0
    bl func_020a6c60
.L_60:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_80
    ldr r0, _LIT4
    ldr r1, _LIT1
    ldr r3, _LIT5
    mov r2, #0x0
    bl func_020a6c60
.L_80:
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    bne .L_a0
    ldr r0, _LIT6
    ldr r1, _LIT1
    ldr r3, _LIT7
    mov r2, #0x0
    bl func_020a6c60
.L_a0:
    ldr r0, [sp]
    mov r5, #0x0
    ldr r9, [r0]
    ldr r8, [r0, #0x8]
    ldr r7, [r0, #0x4]
    mov r0, #0x1
    mov r4, r5
    str r5, [sp, #0x8]
    str r5, [sp, #0x10]
    str r0, [sp, #0xc]
.L_c8:
    add r0, r8, #0x800
    cmp r0, r7
    ble .L_104
    mov r7, r0
    add r1, r0, #0x1
    mov r0, r9
    bl func_0204537c
    movs r9, r0
    bne .L_104
    ldr r1, _LIT8
    mov r0, fp
    bl func_0205ff4c
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_104:
    ldr r3, [sp, #0x8]
    mov r0, sl
    add r1, r9, r8
    sub r2, r7, r8
    bl func_02054cd8
    mov r6, r0
    mvn r0, #0x0
    cmp r6, r0
    bne .L_16c
    mov r0, sl
    bl func_02054b88
    mvn r1, #0x5
    cmp r0, r1
    beq .L_190
    mvn r1, #0x19
    cmp r0, r1
    beq .L_190
    mvn r1, #0x4b
    cmp r0, r1
    beq .L_190
    ldr r1, _LIT9
    mov r0, fp
    bl func_0205ff4c
    add sp, sp, #0x14
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_16c:
    cmp r6, #0x0
    addne r8, r8, r6
    addne r5, r5, r6
    bne .L_190
    ldr r1, _LIT10
    ldr r2, [sp, #0x3c]
    mov r0, fp
    ldr r4, [sp, #0xc]
    bl func_02060430
.L_190:
    ldr r0, [sp, #0x10]
    strb r0, [r9, r8]
    mvn r0, #0x0
    cmp r6, r0
    beq .L_1b4
    cmp r4, #0x0
    bne .L_1b4
    cmp r5, #0x20000
    blt .L_c8
.L_1b4:
    cmp r5, #0x0
    beq .L_1d0
    ldr r1, _LIT11
    ldr r2, [sp, #0x3c]
    mov r0, fp
    mov r3, r5
    bl func_02060430
.L_1d0:
    ldr r0, [sp]
    ldr r1, [sp, #0x38]
    str r9, [r0]
    str r8, [r0, #0x8]
    str r7, [r0, #0x4]
    ldr r0, [sp, #0x4]
    str r5, [r0]
    str r4, [r1]
    mov r0, #0x0
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_02100020
_LIT1: .word data_020ffff0
_LIT2: .word data_02100038
_LIT3: .word 0x00000151
_LIT4: .word data_0210004c
_LIT5: .word 0x00000152
_LIT6: .word data_02100060
_LIT7: .word 0x00000153
_LIT8: .word data_02100074
_LIT9: .word data_02100084
_LIT10: .word data_021000b0
_LIT11: .word data_021000d4
