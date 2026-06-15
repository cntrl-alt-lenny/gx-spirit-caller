; func_0204c1e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020498f0
        .extern func_0204c04c
        .extern func_0204c120
        .extern func_0204ce3c
        .extern func_0204d438
        .extern func_02062530
        .extern func_02065788
        .global func_0204c1e0
        .arm
func_0204c1e0:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x20c]
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x2
    bne .L_1140
    bl func_0204c120
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_1140:
    bl func_020498f0
    mov r1, #0x1
    strb r1, [r0, #0x1a9]
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    bne .L_11b4
    bl func_020498f0
    mov r1, #0x1
    strb r1, [r0, #0x1a9]
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x0
    beq .L_118c
    bl func_020498f0
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_02062530
    b .L_11a8
.L_118c:
    bl func_020498f0
    ldr r0, [r0, #0xf4]
    bl func_0204ce3c
    bl func_0204d438
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
.L_11a8:
    bl func_0204c120
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_11b4:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x4
    beq .L_1214
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x5
    beq .L_1214
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x6
    beq .L_1214
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x7
    beq .L_1214
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0xb
    beq .L_1214
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0xc
    bne .L_1254
.L_1214:
    bl func_020498f0
    ldr r0, [r0, #0x204]
    cmp r0, #0x0
    beq .L_1240
    bl func_020498f0
    ldr r0, [r0, #0xf4]
    bl func_0204ce3c
    bl func_0204d438
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
.L_1240:
    bl func_0204c04c
    bl func_0204d438
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
.L_1254:
    bl func_020498f0
    ldr r0, [r0, #0x19c]
    cmp r0, #0x0
    beq .L_127c
    bl func_020498f0
    ldr r0, [r0, #0x19c]
    bl func_02065788
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x19c]
.L_127c:
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x0
    beq .L_12a8
    bl func_020498f0
    mov r1, #0x1
    strb r1, [r0, #0x1a9]
    bl func_020498f0
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_02062530
.L_12a8:
    bl func_0204c120
    add sp, sp, #0x4
    ldmfd sp!, {pc}
