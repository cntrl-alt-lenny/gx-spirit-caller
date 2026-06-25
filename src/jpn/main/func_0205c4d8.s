; func_0205c4d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100ae8
        .extern data_02100b04
        .extern data_02100b2c
        .extern data_02100b60
        .extern func_02054b88
        .extern func_02054d44
        .extern func_02054e18
        .extern func_020551dc
        .extern func_02058560
        .extern func_0205c8b4
        .extern func_0205d648
        .extern func_0205ff4c
        .extern func_0205ff60
        .global func_0205c4d8
        .arm
func_0205c4d8:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r4, r1
    ldr r1, [r4, #0xc]
    add r2, sp, #0x8
    mov r5, r0
    bl func_0205d648
    cmp r0, #0x0
    bne .L_1c8
    ldr r1, _LIT0
    mov r0, r5
    bl func_0205ff4c
    add sp, sp, #0xc
    mov r0, #0x3
    ldmia sp!, {r4, r5, pc}
.L_1c8:
    mov r0, #0x2
    mov r1, #0x1
    mov r2, #0x0
    bl func_02054e18
    str r0, [r4, #0x8]
    ldr r0, [r4, #0x8]
    mvn r1, #0x0
    cmp r0, r1
    bne .L_218
    ldr r2, _LIT1
    mov r0, r5
    mov r1, #0x5
    bl func_0205ff60
    mov r0, r5
    mov r1, #0x3
    mov r2, #0x0
    bl func_02058560
    add sp, sp, #0xc
    mov r0, #0x3
    ldmia sp!, {r4, r5, pc}
.L_218:
    mov r1, #0x0
    bl func_020551dc
    cmp r0, #0x0
    bne .L_254
    ldr r2, _LIT2
    mov r0, r5
    mov r1, #0x5
    bl func_0205ff60
    mov r0, r5
    mov r1, #0x3
    mov r2, #0x0
    bl func_02058560
    add sp, sp, #0xc
    mov r0, #0x3
    ldmia sp!, {r4, r5, pc}
.L_254:
    ldr r0, [r4, #0x8]
    bl func_0205c8b4
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
    bl func_02054d44
    mvn r1, #0x0
    cmp r0, r1
    bne .L_300
    ldr r0, [r4, #0x8]
    bl func_02054b88
    mvn r1, #0x5
    cmp r0, r1
    beq .L_300
    mvn r1, #0x19
    cmp r0, r1
    beq .L_300
    mvn r1, #0x4b
    cmp r0, r1
    beq .L_300
    ldr r2, _LIT3
    mov r0, r5
    mov r1, #0x5
    bl func_0205ff60
    mov r0, r5
    mov r1, #0x3
    mov r2, #0x1
    bl func_02058560
    add sp, sp, #0xc
    mov r0, #0x3
    ldmia sp!, {r4, r5, pc}
.L_300:
    mov r0, #0x67
    str r0, [r4]
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
_LIT0: .word data_02100ae8
_LIT1: .word data_02100b04
_LIT2: .word data_02100b2c
_LIT3: .word data_02100b60
