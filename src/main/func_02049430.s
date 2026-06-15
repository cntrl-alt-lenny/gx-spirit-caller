; func_02049430 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc80
        .extern func_02045280
        .extern func_02048300
        .extern func_02048c28
        .extern func_02048c68
        .extern func_02048f04
        .extern func_02060dd4
        .extern func_02060f30
        .global func_02049430
        .arm
func_02049430:
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
    bl func_02045280
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
    bl func_02048300
    cmp r0, #0x0
    bne .L_4d8
    bl func_02060f30
    cmp r0, #0x0
    beq .L_4dc
.L_4d8:
    bl func_02060dd4
.L_4dc:
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x4]
    cmp r0, #0x0
    beq .L_578
    ldr r0, [r0]
    cmp r0, #0x0
    beq .L_578
    bl func_02048f04
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
    ldr r0, _LIT0
    ldr r3, [r0]
    ldr r0, [r3, #0x18]
    cmp r0, #0x0
    beq .L_578
    ldrb r2, [r3, #0x1e]
    cmp r2, #0x3
    beq .L_578
    ldr r1, [r3, #0x8]
    cmp r1, #0x7
    bls .L_578
    cmp r2, #0x1
    bhi .L_548
    ldr r1, [r3, #0x14]
    bl func_02048c68
.L_548:
    ldr r0, _LIT0
    ldr r3, [r0]
    ldrb r2, [r3, #0x1c]
    ldr r1, [r3, #0x14]
    cmp r2, r1
    blt .L_578
    mov r1, #0x3
    strb r1, [r3, #0x1e]
    ldr r1, [r0]
    ldrb r0, [r1, #0x1f]
    add r0, r0, #0x1
    strb r0, [r1, #0x1f]
.L_578:
    ldr r0, _LIT0
    ldr r1, [r0]
    ldrb r0, [r1, #0x1f]
    cmp r0, #0x2
    addcc sp, sp, #0x4
    ldmccfd sp!, {pc}
    mov r0, #0x0
    strb r0, [r1, #0x1f]
    bl func_02048c28
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word data_0219dc80
