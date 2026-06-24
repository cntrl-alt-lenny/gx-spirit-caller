; func_0204cbac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02049868
        .extern func_0204987c
        .extern func_0204b7dc
        .extern func_0204bd50
        .extern func_0204be8c
        .extern func_0204bed0
        .extern func_0204cf08
        .extern func_02065714
        .extern func_02067368
        .extern func_02092fc8
        .global func_0204cbac
        .arm
func_0204cbac:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    bl func_0204987c
    ldrb r0, [r0, #0x17]
    cmp r0, #0x0
    beq .L_38
    bl func_0204987c
    mov r4, r0
    bl func_0204987c
    ldr r1, [r4, #0x20]
    ldr r0, [r0, #0x1f8]
    cmp r1, r0
    moveq r4, #0x0
    beq .L_3c
.L_38:
    mov r4, #0x1
.L_3c:
    cmp r4, #0x0
    beq .L_68
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x17]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x20]
    bl func_0204987c
    ldr r0, [r0, #0x10]
    bl func_02067368
.L_68:
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1f
    bcs .L_98
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    mov r1, #0x0
    add r0, r0, #0x1
    add r0, r6, r0, lsl #0x2
    str r1, [r0, #0xf4]
.L_98:
    bl func_0204987c
    mov r1, #0xff
    strb r1, [r0, #0x3c4]
    bl func_0204987c
    ldr r0, [r0, #0x194]
    cmp r0, #0x0
    beq .L_cc
    bl func_0204987c
    ldr r0, [r0, #0x194]
    bl func_02065714
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x194]
.L_cc:
    bl func_0204987c
    mov r6, r0
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    strb r0, [r6, #0x14]
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1fc]
    cmp r4, #0x0
    bne .L_10c
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    beq .L_214
    bl func_0204be8c
    b .L_214
.L_10c:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x0
    bne .L_148
    mov r0, #0x3
    bl func_02049868
    bl func_0204987c
    mov r1, #0x2
    str r1, [r0, #0xe8]
    bl func_0204987c
    mov r4, r0
    bl func_02092fc8
    str r0, [r4, #0xec]
    str r1, [r4, #0xf0]
    b .L_214
.L_148:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x1
    bne .L_174
    mov r0, #0x4
    bl func_02049868
    mov r1, #0x0
    mov r2, r1
    mov r0, #0x1
    bl func_0204cf08
    b .L_214
.L_174:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    bne .L_214
    mov r0, #0xe
    bl func_02049868
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x1d0]
    bl func_0204987c
    add r1, r0, #0x100
    mov r2, #0x0
    mov r0, r5
    strh r2, [r1, #0xaa]
    bl func_0204bd50
    mov r5, #0x1
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x1
    blt .L_1fc
    mov r4, #0xd
.L_1c8:
    bl func_0204987c
    add r0, r0, r5, lsl #0x2
    ldr r0, [r0, #0xf4]
    mov r1, r4
    bl func_0204b7dc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    add r5, r5, #0x1
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r5, r0
    ble .L_1c8
.L_1fc:
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x0
    bne .L_214
    mov r0, #0x2
    bl func_0204bed0
.L_214:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
