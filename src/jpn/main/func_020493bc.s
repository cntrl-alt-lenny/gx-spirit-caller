; func_020493bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dba0
        .extern func_02045230
        .extern func_0204828c
        .extern func_02048bb4
        .extern func_02048bf4
        .extern func_02048e90
        .extern func_02060d60
        .extern func_02060ebc
        .global func_020493bc
        .arm
func_020493bc:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    ldr r0, [r0, #0x18]
    cmp r0, #0x0
    addeq sp, sp, #0x4
    ldmeqfd sp!, {pc}
    bl func_02045230
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
    bl func_0204828c
    cmp r0, #0x0
    bne .L_54
    bl func_02060ebc
    cmp r0, #0x0
    beq .L_58
.L_54:
    bl func_02060d60
.L_58:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    beq .L_f4
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_f4
    bl func_02048e90
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
    ldr r0, _LIT0
    ldr r3, [r0]
    ldr r0, [r3, #0x18]
    cmp r0, #0x0
    beq .L_f4
    ldrb r2, [r3, #0x1e]
    cmp r2, #0x3
    beq .L_f4
    ldr r1, [r3, #0x8]
    cmp r1, #0x7
    bls .L_f4
    cmp r2, #0x1
    bhi .L_c4
    ldr r1, [r3, #0x14]
    bl func_02048bf4
.L_c4:
    ldr r0, _LIT0
    ldr r3, [r0]
    ldrb r2, [r3, #0x1c]
    ldr r1, [r3, #0x14]
    cmp r2, r1
    blt .L_f4
    mov r1, #0x3
    strb r1, [r3, #0x1e]
    ldr r1, [r0]
    ldrb r0, [r1, #0x1f]
    add r0, r0, #0x1
    strb r0, [r1, #0x1f]
.L_f4:
    ldr r0, _LIT0
    ldr r1, [r0]
    ldrb r0, [r1, #0x1f]
    cmp r0, #0x2
    addcc sp, sp, #0x4
    ldmccfd sp!, {pc}
    mov r0, #0x0
    strb r0, [r1, #0x1f]
    bl func_02048bb4
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219dba0
