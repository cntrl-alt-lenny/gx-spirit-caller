; func_02048bf4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dba0
        .extern func_02048094
        .extern func_020485a8
        .extern func_0204880c
        .extern func_02048950
        .extern func_02048a94
        .extern func_02049118
        .extern func_02052d68
        .extern func_02052d80
        .extern func_02052e90
        .extern func_02053560
        .extern func_020535dc
        .extern func_020555e0
        .extern func_020556c4
        .extern func_02055744
        .extern func_02055888
        .extern func_02055ce4
        .global func_02048bf4
        .arm
func_02048bf4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x24c
    ldr r2, _LIT0
    mov r6, r0
    ldr r2, [r2]
    mov r5, r1
    ldrb r0, [r2, #0x1e]
    cmp r0, #0x0
    bne .L_12c
    ldr r0, [r2, #0x4]
    add r1, sp, #0x18
    bl func_02055888
    bl func_0204880c
    ldr r0, [sp, #0x18]
    mov fp, #0x0
    str fp, [sp, #0x1c]
    cmp r0, #0x0
    ble .L_11c
    ldr r8, _LIT0
    mov r9, #0x1
    mov r7, #0xc
.L_54:
    ldr r0, [r8]
    ldr r1, [sp, #0x1c]
    ldr r0, [r0, #0x4]
    add r2, sp, #0x38
    bl func_02055744
    bl func_0204880c
    mov r4, fp
    cmp r5, #0x0
    ble .L_d0
.L_78:
    mov r0, r4
    bl func_02049118
    ldr r1, [sp, #0x38]
    cmp r1, r0
    bne .L_c4
    mul sl, r4, r7
    add r0, r6, sl
    bl func_020535dc
    cmp r0, #0x0
    bne .L_d0
    add sl, r6, sl
    ldr r1, [sp, #0x38]
    mov r0, sl
    bl func_02052d80
    mov r0, sl
    bl func_02053560
    ldr r0, [r8]
    strb r9, [r0, #0x1d]
    b .L_d0
.L_c4:
    add r4, r4, #0x1
    cmp r4, r5
    blt .L_78
.L_d0:
    cmp r4, r5
    bne .L_104
    ldr r0, [r8]
    ldr r1, [sp, #0x38]
    ldr r0, [r0, #0x4]
    bl func_020555e0
    bl func_0204880c
    ldr r1, [sp, #0x18]
    ldr r0, [sp, #0x1c]
    sub r1, r1, #0x1
    sub r0, r0, #0x1
    str r1, [sp, #0x18]
    str r0, [sp, #0x1c]
.L_104:
    ldr r1, [sp, #0x1c]
    ldr r0, [sp, #0x18]
    add r1, r1, #0x1
    str r1, [sp, #0x1c]
    cmp r1, r0
    blt .L_54
.L_11c:
    ldr r0, _LIT0
    mov r1, #0x1
    ldr r0, [r0]
    strb r1, [r0, #0x1e]
.L_12c:
    ldr sl, _LIT0
    ldr r0, [sl]
    ldrb r0, [r0, #0x1c]
    cmp r0, r5
    addge sp, sp, #0x24c
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r4, sp, #0x1c
    mov r8, #0xc
    mvn r9, #0x0
.L_150:
    bl func_02049118
    movs r7, r0
    beq .L_1a8
    ldr r1, [sl]
    mov r0, r6
    ldrb r1, [r1, #0x1c]
    mov r2, r7
    bl func_02048a94
    cmp r0, #0x0
    bne .L_23c
    ldr r0, [sl]
    mov r1, r7
    ldr r0, [r0, #0x4]
    mov r2, r4
    bl func_020556c4
    bl func_0204880c
    ldr r0, [sp, #0x1c]
    cmp r0, r9
    bne .L_23c
    mov r0, r7
    bl func_02048950
    b .L_23c
.L_1a8:
    bl func_02048094
    ldr r1, [sl]
    ldrb r2, [r1, #0x1c]
    mla r1, r2, r8, r6
    bl func_02052e90
    cmp r0, r9
    bne .L_23c
    bl func_02048094
    ldr r2, _LIT0
    mov r1, #0xc
    ldr r3, [r2]
    add r2, sp, #0x20
    ldrb r3, [r3, #0x1c]
    mla r1, r3, r1, r6
    bl func_02052d68
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r4, [r0]
    add r2, sp, #0x20
    str r1, [sp]
    str r2, [sp, #0x4]
    str r1, [sp, #0x8]
    ldr r0, _LIT1
    str r1, [sp, #0xc]
    str r0, [sp, #0x10]
    ldrb r0, [r4, #0x1c]
    mov r2, r1
    mov r3, r1
    str r0, [sp, #0x14]
    ldr r0, [r4, #0x4]
    bl func_02055ce4
    ldr r0, _LIT0
    mov r1, #0x2
    ldr r0, [r0]
    add sp, sp, #0x24c
    strb r1, [r0, #0x1e]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_23c:
    ldr r1, [sl]
    ldrb r0, [r1, #0x1c]
    add r0, r0, #0x1
    strb r0, [r1, #0x1c]
    ldr r0, [sl]
    ldrb r0, [r0, #0x1c]
    cmp r0, r5
    blt .L_150
    add sp, sp, #0x24c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219dba0
_LIT1: .word func_020485a8
