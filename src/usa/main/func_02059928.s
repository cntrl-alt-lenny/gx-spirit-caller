; func_02059928 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100230
        .extern data_021002d0
        .extern data_02100504
        .extern data_0210052c
        .extern data_02100560
        .extern data_02100588
        .extern data_021005b4
        .extern data_021005e4
        .extern data_02100618
        .extern data_02100638
        .extern func_02054b88
        .extern func_02054bbc
        .extern func_02054d28
        .extern func_02054d44
        .extern func_02054d88
        .extern func_02054e18
        .extern func_020551dc
        .extern func_02058560
        .extern func_0205ff60
        .extern func_0206eb74
        .extern func_020a6c60
        .global func_02059928
        .arm
func_02059928:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r0
    ldr r4, [r6]
    mov r5, r1
    ldr r0, [r4, #0x10c]
    cmp r0, #0x0
    bne .L_1a8
    mov r0, #0x2
    mov r1, #0x1
    mov r2, #0x0
    bl func_02054e18
    str r0, [r4, #0x204]
    ldr r0, [r4, #0x204]
    mvn r1, #0x0
    cmp r0, r1
    bne .L_70
    ldr r2, _LIT0
    mov r0, r6
    mov r1, #0x5
    bl func_0205ff60
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x10
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_70:
    mov r1, #0x0
    bl func_020551dc
    cmp r0, #0x0
    bne .L_ac
    ldr r2, _LIT1
    mov r0, r6
    mov r1, #0x5
    bl func_0205ff60
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x10
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_ac:
    add r1, sp, #0x0
    mov r0, #0x0
    str r0, [r1]
    str r0, [r1, #0x4]
    mov r0, #0x2
    strb r0, [sp, #0x1]
    ldr r0, [r4, #0x204]
    mov r2, #0x8
    bl func_02054d88
    mvn r1, #0x0
    cmp r0, r1
    bne .L_108
    ldr r2, _LIT2
    mov r0, r6
    mov r1, #0x5
    bl func_0205ff60
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x10
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_108:
    ldr r0, [r4, #0x204]
    mov r1, #0x5
    bl func_02054d28
    mvn r1, #0x0
    cmp r0, r1
    bne .L_14c
    ldr r2, _LIT3
    mov r0, r6
    mov r1, #0x5
    bl func_0205ff60
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x10
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_14c:
    mov r0, #0x8
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x204]
    add r1, sp, #0x0
    add r2, sp, #0x8
    bl func_02054bbc
    mvn r1, #0x0
    cmp r0, r1
    bne .L_19c
    ldr r2, _LIT4
    mov r0, r6
    mov r1, #0x5
    bl func_0205ff60
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x10
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_19c:
    ldrh r0, [sp, #0x2]
    str r0, [r4, #0x208]
    b .L_1b8
.L_1a8:
    mvn r0, #0x0
    str r0, [r4, #0x204]
    mov r0, #0x0
    str r0, [r4, #0x208]
.L_1b8:
    mov r0, #0x2
    mov r1, #0x1
    mov r2, #0x0
    bl func_02054e18
    str r0, [r4, #0x1d4]
    ldr r0, [r4, #0x1d4]
    mvn r1, #0x0
    cmp r0, r1
    bne .L_208
    ldr r2, _LIT0
    mov r0, r6
    mov r1, #0x5
    bl func_0205ff60
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x10
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_208:
    mov r1, #0x0
    bl func_020551dc
    cmp r0, #0x0
    bne .L_244
    ldr r2, _LIT1
    mov r0, r6
    mov r1, #0x5
    bl func_0205ff60
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x10
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_244:
    ldr r0, _LIT5
    bl func_0206eb74
    cmp r0, #0x0
    bne .L_280
    ldr r2, _LIT6
    mov r0, r6
    mov r1, #0x5
    bl func_0205ff60
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x10
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_280:
    add r1, sp, #0x0
    mov r2, #0x0
    str r2, [r1]
    str r2, [r1, #0x4]
    mov r1, #0x2
    strb r1, [sp, #0x1]
    ldr r0, [r0, #0xc]
    ldr r0, [r0]
    ldr r0, [r0]
    str r0, [sp, #0x4]
    cmp r0, #0x0
    bne .L_2c0
    ldr r0, _LIT7
    ldr r1, _LIT8
    mov r3, #0x90
    bl func_020a6c60
.L_2c0:
    ldr r0, _LIT9
    add r1, sp, #0x0
    strh r0, [sp, #0x2]
    ldr r0, [r4, #0x1d4]
    mov r2, #0x8
    bl func_02054d44
    mvn r1, #0x0
    cmp r0, r1
    bne .L_33c
    ldr r0, [r4, #0x1d4]
    bl func_02054b88
    mvn r1, #0x5
    cmp r0, r1
    beq .L_33c
    mvn r1, #0x19
    cmp r0, r1
    beq .L_33c
    mvn r1, #0x4b
    cmp r0, r1
    beq .L_33c
    ldr r2, _LIT10
    mov r0, r6
    mov r1, #0x5
    bl func_0205ff60
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x10
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_33c:
    mov r0, #0x1
    str r0, [r5, #0x14]
    str r0, [r4, #0x1d8]
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02100504
_LIT1: .word data_0210052c
_LIT2: .word data_02100560
_LIT3: .word data_02100588
_LIT4: .word data_021005b4
_LIT5: .word data_02100230
_LIT6: .word data_021005e4
_LIT7: .word data_02100618
_LIT8: .word data_021002d0
_LIT9: .word 0x0000cc74
_LIT10: .word data_02100638
