; func_020485a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dba0
        .extern func_0204880c
        .extern func_02048950
        .extern func_02048a94
        .extern func_02048f38
        .extern func_02052d80
        .extern func_02053560
        .extern func_020535d0
        .extern func_020556c4
        .global func_020485a8
        .arm
func_020485a8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    mov r9, r1
    ldr r1, [r9]
    mov sl, r0
    mov r8, r2
    cmp r1, #0x0
    bne .L_1e8
    ldr r0, [r9, #0x4]
    cmp r0, #0x0
    beq .L_1e8
    mov r0, #0xc
    ldr r1, _LIT0
    mul r6, r8, r0
    ldr r0, [r1]
    ldr r0, [r0, #0x18]
    add r0, r0, r6
    bl func_020535d0
    cmp r0, #0x0
    beq .L_1e8
    ldr r7, _LIT0
    ldr r1, [r7]
    ldr r0, [r1]
    cmp r0, #0x1
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, #0x1
    strb r0, [r1, #0x1d]
    ldr r0, [r9, #0x4]
    mov r5, #0x0
    cmp r0, #0x0
    ble .L_e8
    mov r4, r5
.L_84:
    ldr r0, [r7]
    ldr r1, [r9, #0xc]
    ldr r0, [r0, #0x18]
    ldr r2, [r1, r4]
    mov r1, r8
    bl func_02048a94
    cmp r0, #0x0
    beq .L_d4
    ldr r0, _LIT0
    mov r2, #0x1
    ldr r4, [r0]
    ldr r1, _LIT1
    ldrb r3, [r4, #0x1c]
    add sp, sp, #0x4
    add r3, r3, #0x1
    strb r3, [r4, #0x1c]
    ldr r0, [r0]
    strb r2, [r0, #0x1e]
    str r1, [r9, #0x8]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_d4:
    ldr r0, [r9, #0x4]
    add r5, r5, #0x1
    cmp r5, r0
    add r4, r4, #0xac
    blt .L_84
.L_e8:
    cmp r0, #0x0
    mov r5, #0x0
    ble .L_1b0
    mov r7, r5
    add fp, sp, #0x0
    mvn r4, #0x0
.L_100:
    ldr r1, [r9, #0xc]
    mov r0, sl
    ldr r1, [r1, r7]
    mov r2, fp
    bl func_020556c4
    bl func_0204880c
    ldr r0, [sp]
    cmp r0, r4
    bne .L_134
    ldr r0, [r9, #0xc]
    ldr r0, [r0, r7]
    bl func_02048950
    b .L_19c
.L_134:
    ldr r0, _LIT0
    ldr r1, [r9, #0xc]
    ldr r0, [r0]
    ldr r1, [r1]
    ldr r0, [r0, #0x18]
    add r0, r0, r6
    bl func_02052d80
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x18]
    add r0, r0, r6
    bl func_02053560
    mov r0, r8
    bl func_02048f38
    ldr r0, _LIT0
    mov r2, #0x1
    ldr r4, [r0]
    ldr r1, _LIT1
    ldrb r3, [r4, #0x1c]
    add sp, sp, #0x4
    add r3, r3, #0x1
    strb r3, [r4, #0x1c]
    ldr r0, [r0]
    strb r2, [r0, #0x1e]
    str r1, [r9, #0x8]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_19c:
    ldr r0, [r9, #0x4]
    add r5, r5, #0x1
    cmp r5, r0
    add r7, r7, #0xac
    blt .L_100
.L_1b0:
    ldr r0, [r9, #0x8]
    cmp r0, #0x600
    addeq sp, sp, #0x4
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT0
    mov r1, #0x1
    ldr r3, [r0]
    add sp, sp, #0x4
    ldrb r2, [r3, #0x1c]
    add r2, r2, #0x1
    strb r2, [r3, #0x1c]
    ldr r0, [r0]
    strb r1, [r0, #0x1e]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1e8:
    ldr r0, [r9]
    cmp r0, #0x0
    beq .L_204
    bl func_0204880c
    add sp, sp, #0x4
    cmp r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_204:
    ldr r0, _LIT0
    ldr r1, [r0]
    ldr r0, [r1]
    cmp r0, #0x1
    beq .L_234
    ldr r1, [r1, #0x18]
    mov r0, #0xc
    mla r0, r8, r0, r1
    bl func_020535d0
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_234:
    ldr r0, _LIT0
    mov r1, #0x1
    ldr r3, [r0]
    ldrb r2, [r3, #0x1c]
    add r2, r2, #0x1
    strb r2, [r3, #0x1c]
    ldr r0, [r0]
    strb r1, [r0, #0x1e]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_0219dba0
_LIT1: .word 0x00000601
