; func_0204fc4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02046948
        .extern func_02049868
        .extern func_0204987c
        .extern func_0204bdcc
        .extern func_0204bed0
        .extern func_0204ffe0
        .extern func_020624bc
        .extern func_02065714
        .extern func_02092fc8
        .global func_0204fc4c
        .arm
func_0204fc4c:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    bl func_02046948
    cmp r0, #0x5
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r4, r5, pc}
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x2
    addeq sp, sp, #0x4
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, pc}
    cmp r5, #0x0
    beq .L_60
    ldr r1, _LIT0
    mov r0, r5
    add r1, r4, r1
    bl func_0204ffe0
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, pc}
.L_60:
    bl func_0204987c
    mov r1, #0x0
    strb r1, [r0, #0x2c8]
    bl func_0204987c
    ldrb r0, [r0, #0x1a1]
    cmp r0, #0x1
    beq .L_9c
    bl func_0204987c
    ldrb r0, [r0, #0x1a0]
    cmp r0, #0x1
    beq .L_9c
    bl func_0204987c
    ldrb r0, [r0, #0x1a0]
    cmp r0, #0x2
    bne .L_a8
.L_9c:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, pc}
.L_a8:
    bl func_0204987c
    ldr r0, [r0, #0x194]
    cmp r0, #0x0
    beq .L_d0
    bl func_0204987c
    ldr r0, [r0, #0x194]
    bl func_02065714
    bl func_0204987c
    mov r1, #0x0
    str r1, [r0, #0x194]
.L_d0:
    bl func_0204987c
    ldrb r0, [r0, #0xd]
    cmp r0, #0x0
    beq .L_110
    bl func_0204987c
    ldrb r0, [r0, #0x1a0]
    cmp r0, #0x0
    bne .L_180
    bl func_0204987c
    mov r1, #0x3
    strb r1, [r0, #0x1a0]
    bl func_0204987c
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_020624bc
    b .L_180
.L_110:
    bl func_0204987c
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    bne .L_130
    ldr r1, _LIT1
    mov r0, #0x6
    bl func_0204ffe0
    b .L_180
.L_130:
    bl func_0204987c
    ldr r0, [r0, #0x200]
    cmp r0, #0x0
    beq .L_148
    bl func_0204bdcc
    b .L_180
.L_148:
    bl func_0204987c
    ldr r0, [r0, #0x198]
    cmp r0, #0x1
    bne .L_178
    mov r0, #0x12
    bl func_02049868
    bl func_0204987c
    mov r4, r0
    bl func_02092fc8
    str r0, [r4, #0x1e8]
    str r1, [r4, #0x1ec]
    b .L_180
.L_178:
    mov r0, #0x1
    bl func_0204bed0
.L_180:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word 0xfffec780
_LIT1: .word 0xfffec5d2
