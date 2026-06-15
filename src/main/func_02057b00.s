; func_02057b00 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021000d0
        .extern data_02100100
        .extern data_02100118
        .extern data_0210012c
        .extern data_02100140
        .extern data_02100154
        .extern data_02100164
        .extern data_02100190
        .extern data_021001b4
        .extern func_020453cc
        .extern func_02054bfc
        .extern func_02054d4c
        .extern func_0205ffc0
        .extern func_020604a4
        .extern func_020a6d54
        .global func_02057b00
        .arm
func_02057b00:
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
    bne .L_10e8
    ldr r0, _LIT0
    ldr r1, _LIT1
    mov r2, #0x0
    mov r3, #0x150
    bl func_020a6d54
.L_10e8:
    ldr r0, [sp]
    cmp r0, #0x0
    bne .L_1108
    ldr r0, _LIT2
    ldr r1, _LIT1
    ldr r3, _LIT3
    mov r2, #0x0
    bl func_020a6d54
.L_1108:
    ldr r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_1128
    ldr r0, _LIT4
    ldr r1, _LIT1
    ldr r3, _LIT5
    mov r2, #0x0
    bl func_020a6d54
.L_1128:
    ldr r0, [sp, #0x38]
    cmp r0, #0x0
    bne .L_1148
    ldr r0, _LIT6
    ldr r1, _LIT1
    ldr r3, _LIT7
    mov r2, #0x0
    bl func_020a6d54
.L_1148:
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
.L_1170:
    add r0, r8, #0x800
    cmp r0, r7
    ble .L_11ac
    mov r7, r0
    add r1, r0, #0x1
    mov r0, r9
    bl func_020453cc
    movs r9, r0
    bne .L_11ac
    ldr r1, _LIT8
    mov r0, fp
    bl func_0205ffc0
    add sp, sp, #0x14
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_11ac:
    ldr r3, [sp, #0x8]
    mov r0, sl
    add r1, r9, r8
    sub r2, r7, r8
    bl func_02054d4c
    mov r6, r0
    mvn r0, #0x0
    cmp r6, r0
    bne .L_1214
    mov r0, sl
    bl func_02054bfc
    mvn r1, #0x5
    cmp r0, r1
    beq .L_1238
    mvn r1, #0x19
    cmp r0, r1
    beq .L_1238
    mvn r1, #0x4b
    cmp r0, r1
    beq .L_1238
    ldr r1, _LIT9
    mov r0, fp
    bl func_0205ffc0
    add sp, sp, #0x14
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1214:
    cmp r6, #0x0
    addne r8, r8, r6
    addne r5, r5, r6
    bne .L_1238
    ldr r1, _LIT10
    ldr r2, [sp, #0x3c]
    mov r0, fp
    ldr r4, [sp, #0xc]
    bl func_020604a4
.L_1238:
    ldr r0, [sp, #0x10]
    strb r0, [r9, r8]
    mvn r0, #0x0
    cmp r6, r0
    beq .L_125c
    cmp r4, #0x0
    bne .L_125c
    cmp r5, #0x20000
    blt .L_1170
.L_125c:
    cmp r5, #0x0
    beq .L_1278
    ldr r1, _LIT11
    ldr r2, [sp, #0x3c]
    mov r0, fp
    mov r3, r5
    bl func_020604a4
.L_1278:
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
_LIT0: .word data_02100100
_LIT1: .word data_021000d0
_LIT2: .word data_02100118
_LIT3: .word 0x00000151
_LIT4: .word data_0210012c
_LIT5: .word 0x00000152
_LIT6: .word data_02100140
_LIT7: .word 0x00000153
_LIT8: .word data_02100154
_LIT9: .word data_02100164
_LIT10: .word data_02100190
_LIT11: .word data_021001b4
