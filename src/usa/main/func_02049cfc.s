; func_02049cfc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020ff88c
        .extern func_02046948
        .extern func_0204987c
        .extern func_0204d908
        .extern func_02094688
        .extern func_020aaf60
        .global func_02049cfc
        .arm
func_02049cfc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x9c
    mov sl, r0
    mov r9, r1
    mov r8, #0x0
    bl func_02046948
    cmp r0, #0x5
    beq .L_54
    bl func_02046948
    cmp r0, #0x6
    addne sp, sp, #0x9c
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    beq .L_54
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    addne sp, sp, #0x9c
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_54:
    cmp r9, #0x14
    addcc sp, sp, #0x9c
    ldmccia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r4, sp, #0x1c
    add fp, sp, #0x8
    add r5, sl, #0x14
    mov r7, #0x14
    mov r6, #0x4
.L_74:
    mov r0, sl
    mov r1, fp
    mov r2, r7
    bl func_02094688
    ldr r1, _LIT0
    mov r0, fp
    mov r2, r6
    bl func_020aaf60
    cmp r0, #0x0
    addne sp, sp, #0x9c
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp, #0xc]
    cmp r0, #0x3
    addne sp, sp, #0x9c
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrb r2, [sp, #0x11]
    mov r0, r5
    mov r1, r4
    bl func_02094688
    str r4, [sp]
    ldrb r0, [sp, #0x11]
    mov r0, r0, asr #0x2
    str r0, [sp, #0x4]
    ldrb r0, [sp, #0x10]
    ldrh r3, [sp, #0x12]
    ldr r1, [sp, #0x18]
    ldr r2, [sp, #0x14]
    bl func_0204d908
    cmp r0, #0x0
    addeq sp, sp, #0x9c
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrb r0, [sp, #0x11]
    add r0, r0, #0x14
    add r8, r8, r0
    add r0, r8, #0x14
    cmp r0, r9
    bls .L_74
    add sp, sp, #0x9c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_020ff88c
