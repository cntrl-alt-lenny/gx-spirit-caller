; func_0204fcc0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020469b4
        .extern func_020498dc
        .extern func_020498f0
        .extern func_0204be40
        .extern func_0204bf44
        .extern func_02050054
        .extern func_02062530
        .extern func_02065788
        .extern func_020930b0
        .global func_0204fcc0
        .arm
func_0204fcc0:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    mov r4, r1
    bl func_020469b4
    cmp r0, #0x5
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r4, r5, pc}
    bl func_020498f0
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
    bl func_02050054
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, pc}
.L_60:
    bl func_020498f0
    mov r1, #0x0
    strb r1, [r0, #0x2d0]
    bl func_020498f0
    ldrb r0, [r0, #0x1a9]
    cmp r0, #0x1
    beq .L_9c
    bl func_020498f0
    ldrb r0, [r0, #0x1a8]
    cmp r0, #0x1
    beq .L_9c
    bl func_020498f0
    ldrb r0, [r0, #0x1a8]
    cmp r0, #0x2
    bne .L_a8
.L_9c:
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r4, r5, pc}
.L_a8:
    bl func_020498f0
    ldr r0, [r0, #0x19c]
    cmp r0, #0x0
    beq .L_d0
    bl func_020498f0
    ldr r0, [r0, #0x19c]
    bl func_02065788
    bl func_020498f0
    mov r1, #0x0
    str r1, [r0, #0x19c]
.L_d0:
    bl func_020498f0
    ldrb r0, [r0, #0xd]
    cmp r0, #0x0
    beq .L_110
    bl func_020498f0
    ldrb r0, [r0, #0x1a8]
    cmp r0, #0x0
    bne .L_180
    bl func_020498f0
    mov r1, #0x3
    strb r1, [r0, #0x1a8]
    bl func_020498f0
    ldr r0, [r0, #0x4]
    ldr r0, [r0]
    bl func_02062530
    b .L_180
.L_110:
    bl func_020498f0
    ldrb r0, [r0, #0x15]
    cmp r0, #0x3
    bne .L_130
    ldr r1, _LIT1
    mov r0, #0x6
    bl func_02050054
    b .L_180
.L_130:
    bl func_020498f0
    ldr r0, [r0, #0x208]
    cmp r0, #0x0
    beq .L_148
    bl func_0204be40
    b .L_180
.L_148:
    bl func_020498f0
    ldr r0, [r0, #0x1a0]
    cmp r0, #0x1
    bne .L_178
    mov r0, #0x12
    bl func_020498dc
    bl func_020498f0
    mov r4, r0
    bl func_020930b0
    str r0, [r4, #0x1f0]
    str r1, [r4, #0x1f4]
    b .L_180
.L_178:
    mov r0, #0x1
    bl func_0204bf44
.L_180:
    mov r0, #0x1
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
_LIT0: .word 0xfffec780
_LIT1: .word 0xfffec5d2
