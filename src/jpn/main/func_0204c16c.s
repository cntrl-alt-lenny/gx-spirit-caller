; func_0204c16c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204987c
        .extern func_0204bfd8
        .extern func_0204c0ac
        .extern func_0204cdc8
        .extern func_0204d3c4
        .extern func_020624bc
        .extern func_02065714
        .global func_0204c16c
        .arm
func_0204c16c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x204]
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x2
    bne .L_30
    bl func_0204c0ac
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_30:
    bl func_0204987c
    mov r1, #0x1
    strb r1, [r0, #0x1a1]
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    bne .L_a4
    bl func_0204987c
    mov r1, #0x1
    strb r1, [r0, #0x1a1]
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x0
    beq .L_7c
    bl func_0204987c
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_020624bc
    b .L_98
.L_7c:
    bl func_0204987c
    ldr r0, [r0, #0xf4]
    bl func_0204cdc8
    bl func_0204d3c4
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
.L_98:
    bl func_0204c0ac
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_a4:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x4
    beq .L_104
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x5
    beq .L_104
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x6
    beq .L_104
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x7
    beq .L_104
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0xb
    beq .L_104
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0xc
    bne .L_144
.L_104:
    bl func_0204987c
    ldr r0, [r0, #0x1fc]
    cmp r0, #0x0
    beq .L_130
    bl func_0204987c
    ldr r0, [r0, #0xf4]
    bl func_0204cdc8
    bl func_0204d3c4
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
.L_130:
    bl func_0204bfd8
    bl func_0204d3c4
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {pc}
.L_144:
    bl func_0204987c
    ldr r0, [r0, #0x194]
    cmp r0, #0x0
    beq .L_16c
    bl func_0204987c
    ldr r0, [r0, #0x194]
    bl func_02065714
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x194]
.L_16c:
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x0
    beq .L_198
    bl func_0204987c
    mov r1, #0x1
    strb r1, [r0, #0x1a1]
    bl func_0204987c
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_020624bc
.L_198:
    bl func_0204c0ac
    add sp, sp, #0x4
    ldmfd sp!, {pc}
