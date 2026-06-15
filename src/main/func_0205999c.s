; func_0205999c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100310
        .extern data_021003b0
        .extern data_021005e4
        .extern data_0210060c
        .extern data_02100640
        .extern data_02100668
        .extern data_02100694
        .extern data_021006c4
        .extern data_021006f8
        .extern data_02100718
        .extern func_02054bfc
        .extern func_02054c30
        .extern func_02054d9c
        .extern func_02054db8
        .extern func_02054dfc
        .extern func_02054e8c
        .extern func_02055250
        .extern func_020585d4
        .extern func_0205ffd4
        .extern func_0206ebe8
        .extern func_020a6d54
        .global func_0205999c
        .arm
func_0205999c:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x10
    mov r6, r0
    ldr r4, [r6]
    mov r5, r1
    ldr r0, [r4, #0x10c]
    cmp r0, #0x0
    bne .L_1aa4
    mov r0, #0x2
    mov r1, #0x1
    mov r2, #0x0
    bl func_02054e8c
    str r0, [r4, #0x204]
    ldr r0, [r4, #0x204]
    mvn r1, #0x0
    cmp r0, r1
    bne .L_196c
    ldr r2, _LIT0
    mov r0, r6
    mov r1, #0x5
    bl func_0205ffd4
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x10
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_196c:
    mov r1, #0x0
    bl func_02055250
    cmp r0, #0x0
    bne .L_19a8
    ldr r2, _LIT1
    mov r0, r6
    mov r1, #0x5
    bl func_0205ffd4
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x10
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_19a8:
    add r1, sp, #0x0
    mov r0, #0x0
    str r0, [r1]
    str r0, [r1, #0x4]
    mov r0, #0x2
    strb r0, [sp, #0x1]
    ldr r0, [r4, #0x204]
    mov r2, #0x8
    bl func_02054dfc
    mvn r1, #0x0
    cmp r0, r1
    bne .L_1a04
    ldr r2, _LIT2
    mov r0, r6
    mov r1, #0x5
    bl func_0205ffd4
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x10
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_1a04:
    ldr r0, [r4, #0x204]
    mov r1, #0x5
    bl func_02054d9c
    mvn r1, #0x0
    cmp r0, r1
    bne .L_1a48
    ldr r2, _LIT3
    mov r0, r6
    mov r1, #0x5
    bl func_0205ffd4
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x10
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_1a48:
    mov r0, #0x8
    str r0, [sp, #0x8]
    ldr r0, [r4, #0x204]
    add r1, sp, #0x0
    add r2, sp, #0x8
    bl func_02054c30
    mvn r1, #0x0
    cmp r0, r1
    bne .L_1a98
    ldr r2, _LIT4
    mov r0, r6
    mov r1, #0x5
    bl func_0205ffd4
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x10
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_1a98:
    ldrh r0, [sp, #0x2]
    str r0, [r4, #0x208]
    b .L_1ab4
.L_1aa4:
    mvn r0, #0x0
    str r0, [r4, #0x204]
    mov r0, #0x0
    str r0, [r4, #0x208]
.L_1ab4:
    mov r0, #0x2
    mov r1, #0x1
    mov r2, #0x0
    bl func_02054e8c
    str r0, [r4, #0x1d4]
    ldr r0, [r4, #0x1d4]
    mvn r1, #0x0
    cmp r0, r1
    bne .L_1b04
    ldr r2, _LIT0
    mov r0, r6
    mov r1, #0x5
    bl func_0205ffd4
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x10
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_1b04:
    mov r1, #0x0
    bl func_02055250
    cmp r0, #0x0
    bne .L_1b40
    ldr r2, _LIT1
    mov r0, r6
    mov r1, #0x5
    bl func_0205ffd4
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x10
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_1b40:
    ldr r0, _LIT5
    bl func_0206ebe8
    cmp r0, #0x0
    bne .L_1b7c
    ldr r2, _LIT6
    mov r0, r6
    mov r1, #0x5
    bl func_0205ffd4
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x10
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_1b7c:
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
    bne .L_1bbc
    ldr r0, _LIT7
    ldr r1, _LIT8
    mov r3, #0x90
    bl func_020a6d54
.L_1bbc:
    ldr r0, _LIT9
    add r1, sp, #0x0
    strh r0, [sp, #0x2]
    ldr r0, [r4, #0x1d4]
    mov r2, #0x8
    bl func_02054db8
    mvn r1, #0x0
    cmp r0, r1
    bne .L_1c38
    ldr r0, [r4, #0x1d4]
    bl func_02054bfc
    mvn r1, #0x5
    cmp r0, r1
    beq .L_1c38
    mvn r1, #0x19
    cmp r0, r1
    beq .L_1c38
    mvn r1, #0x4b
    cmp r0, r1
    beq .L_1c38
    ldr r2, _LIT10
    mov r0, r6
    mov r1, #0x5
    bl func_0205ffd4
    mov r0, r6
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0x10
    mov r0, #0x3
    ldmia sp!, {r4, r5, r6, pc}
.L_1c38:
    mov r0, #0x1
    str r0, [r5, #0x14]
    str r0, [r4, #0x1d8]
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_021005e4
_LIT1: .word data_0210060c
_LIT2: .word data_02100640
_LIT3: .word data_02100668
_LIT4: .word data_02100694
_LIT5: .word data_02100310
_LIT6: .word data_021006c4
_LIT7: .word data_021006f8
_LIT8: .word data_021003b0
_LIT9: .word 0x0000cc74
_LIT10: .word data_02100718
