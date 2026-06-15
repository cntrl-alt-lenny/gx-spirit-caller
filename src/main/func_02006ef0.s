; func_02006ef0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern data_020c3f44
        .extern data_02104f1c
        .extern func_02006b4c
        .extern func_02007104
        .extern func_02038ad4
        .extern func_0207d3ac
        .extern func_020928e8
        .extern func_020947d0
        .extern func_020948f0
        .extern func_020949f0
        .extern func_02097ea4
        .extern func_02097ff0
        .global func_02006ef0
        .arm
func_02006ef0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x160
    mov r3, r0
    str r1, [sp]
    add r0, sp, #0x118
    add r2, sp, #0x18
    mov r1, r3
    bl func_02006b4c
    cmp r0, #0x0
    addeq sp, sp, #0x160
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT0
    bl func_02007104
    mvn r1, #0x0
    cmp r0, r1
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    add r0, sp, #0x118
    beq .L_274
    mov r7, #0x4
    ldr r4, [sp, #0x140]
    ldr r3, [sp, #0x13c]
    add r1, sp, #0x4
    mov r2, r7
    sub r6, r4, r3
    bl func_02038ad4
    add r0, sp, #0x4
    mov r1, r7
    bl func_020928e8
    ldr r0, _LIT1
    mov r1, r7
    ldr r0, [r0, #0x1c]
    bl func_0207d3ac
    cmp r0, r6
    mov r2, #0x0
    blt .L_1b0
    mov r0, r6
    mov r1, r7
    bl Task_PostLocked
    mov r1, #0x0
    mov r4, r0
    add r0, sp, #0x118
    mov r2, r1
    bl func_02097ea4
    add r0, sp, #0x118
    mov r1, r4
    mov r2, r6
    bl func_02038ad4
    add r0, sp, #0x118
    bl func_02097ff0
    ldr r1, [sp]
    mov r0, r4
    bl func_020947d0
    mov r0, r4
    bl Task_InvokeLocked
    b .L_254
.L_1b0:
    sub sl, r6, #0x4
    cmp r0, sl
    movls sl, r0
    mov r0, sl
    mov r1, #0x4
    bl Task_PostLocked
    mov r8, r0
    ldr r1, [sp]
    add r0, sp, #0x8
    add r2, sp, #0x4
    bl func_020949f0
    cmp r6, #0x4
    ble .L_244
    add r5, sp, #0x118
    mov r4, #0x0
    add fp, sp, #0x8
.L_1f0:
    sub r9, r6, r7
    cmp sl, r9
    movle r9, sl
    mov r0, r5
    mov r1, r7
    mov r2, r4
    bl func_02097ea4
    mov r0, r5
    mov r1, r8
    mov r2, r9
    bl func_02038ad4
    mov r0, r8
    mov r1, r9
    bl func_020928e8
    mov r0, fp
    mov r1, r8
    mov r2, r9
    bl func_020948f0
    add r7, r7, r9
    cmp r7, r6
    blt .L_1f0
.L_244:
    add r0, sp, #0x118
    bl func_02097ff0
    mov r0, r8
    bl Task_InvokeLocked
.L_254:
    ldr r1, [sp, #0x4]
    ldr r0, [sp]
    mov r1, r1, lsr #0x8
    bl func_020928e8
    ldr r0, [sp, #0x4]
    add sp, sp, #0x160
    mov r0, r0, lsr #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_274:
    ldr r2, [sp, #0x140]
    ldr r1, [sp, #0x13c]
    sub r4, r2, r1
    ldr r1, [sp]
    mov r2, r4
    bl func_02038ad4
    add r0, sp, #0x118
    bl func_02097ff0
    ldr r0, [sp]
    mov r1, r4
    bl func_020928e8
    mov r0, r4
    add sp, sp, #0x160
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020c3f44
_LIT1: .word data_02104f1c
