; func_0205fb14 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100d00
        .extern data_02100d40
        .extern data_02100d70
        .extern data_02101008
        .extern data_02101030
        .extern data_02101064
        .extern data_02101094
        .extern data_021010b4
        .extern func_02045398
        .extern func_02054b88
        .extern func_02054d44
        .extern func_02054e18
        .extern func_020551dc
        .extern func_02058560
        .extern func_0205ff4c
        .extern func_0205ff60
        .extern func_0206eb74
        .extern func_020a6c60
        .global func_0205fb14
        .arm
func_0205fb14:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r5, r1
    ldr r4, [r5, #0x4]
    mov r1, #0x1000
    str r1, [r4, #0xc]
    ldr r1, [r4, #0xc]
    mov r6, r0
    add r0, r1, #0x1
    bl func_02045398
    str r0, [r4, #0x8]
    ldr r0, [r4, #0x8]
    cmp r0, #0x0
    bne .L_50
    ldr r1, _LIT0
    mov r0, r6
    bl func_0205ff4c
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_50:
    mov r0, #0x2
    mov r1, #0x1
    mov r2, #0x0
    bl func_02054e18
    str r0, [r4, #0x4]
    ldr r0, [r4, #0x4]
    mvn r1, #0x0
    cmp r0, r1
    bne .L_a0
    ldr r2, _LIT1
    mov r0, r6
    mov r1, #0x5
    bl func_0205ff60
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x8
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_a0:
    mov r1, #0x0
    bl func_020551dc
    cmp r0, #0x0
    bne .L_dc
    ldr r2, _LIT2
    mov r0, r6
    mov r1, #0x5
    bl func_0205ff60
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x8
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_dc:
    ldr r0, _LIT3
    bl func_0206eb74
    cmp r0, #0x0
    bne .L_118
    ldr r2, _LIT4
    mov r0, r6
    mov r1, #0x5
    bl func_0205ff60
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x8
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_118:
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
    bne .L_158
    ldr r0, _LIT5
    ldr r1, _LIT6
    mov r3, #0x59
    bl func_020a6c60
.L_158:
    ldr r0, _LIT7
    add r1, sp, #0x0
    strh r0, [sp, #0x2]
    ldr r0, [r4, #0x4]
    mov r2, #0x8
    bl func_02054d44
    mvn r1, #0x0
    cmp r0, r1
    bne .L_1d4
    ldr r0, [r4, #0x4]
    bl func_02054b88
    mvn r1, #0x5
    cmp r0, r1
    beq .L_1d4
    mvn r1, #0x19
    cmp r0, r1
    beq .L_1d4
    mvn r1, #0x4b
    cmp r0, r1
    beq .L_1d4
    ldr r2, _LIT8
    mov r0, r6
    mov r1, #0x5
    bl func_0205ff60
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0x8
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_1d4:
    mov r0, #0x1
    str r0, [r5, #0x14]
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02100d40
_LIT1: .word data_02101008
_LIT2: .word data_02101030
_LIT3: .word data_02100d00
_LIT4: .word data_02101064
_LIT5: .word data_02101094
_LIT6: .word data_02100d70
_LIT7: .word 0x0000cd74
_LIT8: .word data_021010b4
