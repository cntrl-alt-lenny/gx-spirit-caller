; func_020746f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ee00
        .extern data_0219ee2c
        .extern func_020704ec
        .extern func_02075d0c
        .extern func_02094688
        .global func_020746f8
        .arm
func_020746f8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x24
    ldr r4, [sp, #0x48]
    mov r9, r1
    mov r1, r4
    mov sl, r0
    mov r0, #0x0
    ldr r1, [r1, #0xc]
    str r0, [sp, #0x8]
    str r0, [sp, #0x1c]
    str r0, [sp, #0x14]
    str r0, [sp, #0x18]
    mov r0, #0x17
    str r0, [sp, #0xc]
    mov r0, #0x3
    str r4, [sp, #0x48]
    str r1, [sp, #0x4]
    mov r8, r2
    add r6, r9, r3
    str r0, [sp, #0x10]
.L_50:
    ldr r0, _LIT0
    ldr r1, _LIT1
    cmp r6, r0
    movgt r5, r0
    movle r5, r6
    ldr r1, [r1]
    add r0, r5, #0x19
    blx r1
    movs r7, r0
    beq .L_13c
    cmp r9, r5
    movcs r4, r5
    movcc r4, r9
    mov r0, sl
    add r1, r7, #0x5
    mov r2, r4
    sub fp, r5, r4
    bl func_02094688
    add r1, r7, #0x5
    mov r0, r8
    add r1, r1, r4
    mov r2, fp
    add sl, sl, r4
    sub r9, r9, r4
    bl func_02094688
    ldr r0, [sp, #0xc]
    mov r1, r7
    strb r0, [r7]
    ldr r0, [sp, #0x10]
    add r8, r8, fp
    strb r0, [r7, #0x1]
    ldr r0, [sp, #0x14]
    strb r0, [r7, #0x2]
    mov r0, r5, asr #0x8
    strb r0, [r7, #0x3]
    ldr r0, [sp, #0x4]
    strb r5, [r7, #0x4]
    bl func_02075d0c
    ldr r1, [sp, #0x48]
    ldr r2, [sp, #0x18]
    mov r4, r0
    str r1, [sp]
    mov r0, r7
    mov r1, r4
    mov r3, r2
    bl func_020704ec
    cmp r0, r4
    ldr r1, _LIT2
    mov r0, r7
    ldr r1, [r1]
    ldrcc r5, [sp, #0x1c]
    blx r1
    ldr r0, [sp, #0x8]
    subs r6, r6, r5
    add r0, r0, r5
    str r0, [sp, #0x8]
    beq .L_13c
    cmp r5, #0x0
    bne .L_50
.L_13c:
    ldr r0, [sp, #0x8]
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
_LIT0: .word 0x00000b4f
_LIT1: .word data_0219ee00
_LIT2: .word data_0219ee2c
