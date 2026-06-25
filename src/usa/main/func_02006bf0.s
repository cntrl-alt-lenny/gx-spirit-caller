; func_02006bf0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern Task_InvokeLocked
        .extern Task_PostLocked
        .extern data_020c3e64
        .extern data_02104e3c
        .extern func_02006b30
        .extern func_020070e8
        .extern func_02038a84
        .extern func_0207d2c4
        .extern func_02092800
        .extern func_0209281c
        .extern func_020946dc
        .extern func_020947fc
        .extern func_020948fc
        .extern func_02097db0
        .extern func_02097efc
        .global func_02006bf0
        .arm
func_02006bf0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x160
    mov r3, r0
    mov r4, r2
    mov r5, r1
    add r0, sp, #0x118
    add r2, sp, #0x18
    mov r1, r3
    bl func_02006b30
    ldr r1, _LIT0
    bl func_020070e8
    mvn r1, #0x0
    cmp r0, r1
    movne r0, #0x1
    moveq r0, #0x0
    cmp r0, #0x0
    beq .L_1b8
    mov r7, #0x4
    ldr r6, [sp, #0x140]
    ldr r3, [sp, #0x13c]
    add r0, sp, #0x118
    add r1, sp, #0x4
    mov r2, r7
    sub r6, r6, r3
    bl func_02038a84
    add r0, sp, #0x4
    mov r1, r7
    bl func_02092800
    ldr r0, [sp, #0x4]
    mov r1, r5
    mov r2, r4
    mov r0, r0, lsr #0x8
    bl Task_PostLocked
    ldr r1, _LIT1
    str r0, [sp]
    ldr r0, [r1, #0x1c]
    mov r1, r7
    bl func_0207d2c4
    cmp r0, r6
    blt .L_f4
    mov r0, r6
    mov r1, r5
    mov r2, r4
    bl Task_PostLocked
    mov r1, #0x0
    mov r4, r0
    add r0, sp, #0x118
    mov r2, r1
    bl func_02097db0
    add r0, sp, #0x118
    mov r1, r4
    mov r2, r6
    bl func_02038a84
    add r0, sp, #0x118
    bl func_02097efc
    ldr r1, [sp]
    mov r0, r4
    bl func_020946dc
    mov r0, r4
    bl Task_InvokeLocked
    b .L_19c
.L_f4:
    sub sl, r6, #0x4
    cmp r0, sl
    movls sl, r0
    mov r0, sl
    mov r1, r5
    mov r2, r4
    bl Task_PostLocked
    mov r8, r0
    ldr r1, [sp]
    add r0, sp, #0x8
    add r2, sp, #0x4
    bl func_020948fc
    cmp r6, #0x4
    ble .L_18c
    add r5, sp, #0x118
    mov r4, #0x0
    add fp, sp, #0x8
.L_138:
    sub r9, r6, r7
    cmp sl, r9
    movle r9, sl
    mov r0, r5
    mov r1, r7
    mov r2, r4
    bl func_02097db0
    mov r0, r5
    mov r1, r8
    mov r2, r9
    bl func_02038a84
    mov r0, r8
    mov r1, r9
    bl func_02092800
    mov r0, fp
    mov r1, r8
    mov r2, r9
    bl func_020947fc
    add r7, r7, r9
    cmp r7, r6
    blt .L_138
.L_18c:
    add r0, sp, #0x118
    bl func_02097efc
    mov r0, r8
    bl Task_InvokeLocked
.L_19c:
    ldr r1, [sp, #0x4]
    ldr r0, [sp]
    mov r1, r1, lsr #0x8
    bl func_0209281c
    ldr r0, [sp]
    add sp, sp, #0x160
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1b8:
    ldr r2, [sp, #0x140]
    ldr r0, [sp, #0x13c]
    mov r1, r5
    sub r5, r2, r0
    mov r0, r5
    mov r2, r4
    bl Task_PostLocked
    mov r4, r0
    add r0, sp, #0x118
    mov r1, r4
    mov r2, r5
    bl func_02038a84
    add r0, sp, #0x118
    bl func_02097efc
    mov r0, r4
    mov r1, r5
    bl func_0209281c
    mov r0, r4
    add sp, sp, #0x160
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020c3e64
_LIT1: .word data_02104e3c
