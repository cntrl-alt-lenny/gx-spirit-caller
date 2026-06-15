; func_0205c54c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100bc8
        .extern data_02100be4
        .extern data_02100c0c
        .extern data_02100c40
        .extern func_02054bfc
        .extern func_02054db8
        .extern func_02054e8c
        .extern func_02055250
        .extern func_020585d4
        .extern func_0205c928
        .extern func_0205d6bc
        .extern func_0205ffc0
        .extern func_0205ffd4
        .global func_0205c54c
        .arm
func_0205c54c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r4, r1
    ldr r1, [r4, #0xc]
    add r2, sp, #0x8
    mov r5, r0
    bl func_0205d6bc
    cmp r0, #0x0
    bne .L_16bc
    ldr r1, _LIT0
    mov r0, r5
    bl func_0205ffc0
    add sp, sp, #0xc
    mov r0, #0x3
    ldmia sp!, {r4, r5, pc}
.L_16bc:
    mov r0, #0x2
    mov r1, #0x1
    mov r2, #0x0
    bl func_02054e8c
    str r0, [r4, #0x8]
    ldr r0, [r4, #0x8]
    mvn r1, #0x0
    cmp r0, r1
    bne .L_170c
    ldr r2, _LIT1
    mov r0, r5
    mov r1, #0x5
    bl func_0205ffd4
    mov r0, r5
    mov r1, #0x3
    mov r2, #0x0
    bl func_020585d4
    add sp, sp, #0xc
    mov r0, #0x3
    ldmia sp!, {r4, r5, pc}
.L_170c:
    mov r1, #0x0
    bl func_02055250
    cmp r0, #0x0
    bne .L_1748
    ldr r2, _LIT2
    mov r0, r5
    mov r1, #0x5
    bl func_0205ffd4
    mov r0, r5
    mov r1, #0x3
    mov r2, #0x0
    bl func_020585d4
    add sp, sp, #0xc
    mov r0, #0x3
    ldmia sp!, {r4, r5, pc}
.L_1748:
    ldr r0, [r4, #0x8]
    bl func_0205c928
    add r1, sp, #0x0
    mov r0, #0x0
    str r0, [r1]
    str r0, [r1, #0x4]
    mov r0, #0x2
    ldr r3, [sp, #0x8]
    strb r0, [sp, #0x1]
    ldr r0, [r3, #0x8]
    mov r2, #0x8
    ldr r0, [r0, #0x10]
    str r0, [sp, #0x4]
    ldr r0, [r3, #0x8]
    ldr r0, [r0, #0x14]
    strh r0, [sp, #0x2]
    ldr r0, [r4, #0x8]
    bl func_02054db8
    mvn r1, #0x0
    cmp r0, r1
    bne .L_17f4
    ldr r0, [r4, #0x8]
    bl func_02054bfc
    mvn r1, #0x5
    cmp r0, r1
    beq .L_17f4
    mvn r1, #0x19
    cmp r0, r1
    beq .L_17f4
    mvn r1, #0x4b
    cmp r0, r1
    beq .L_17f4
    ldr r2, _LIT3
    mov r0, r5
    mov r1, #0x5
    bl func_0205ffd4
    mov r0, r5
    mov r1, #0x3
    mov r2, #0x1
    bl func_020585d4
    add sp, sp, #0xc
    mov r0, #0x3
    ldmia sp!, {r4, r5, pc}
.L_17f4:
    mov r0, #0x67
    str r0, [r4]
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_02100bc8
_LIT1: .word data_02100be4
_LIT2: .word data_02100c0c
_LIT3: .word data_02100c40
