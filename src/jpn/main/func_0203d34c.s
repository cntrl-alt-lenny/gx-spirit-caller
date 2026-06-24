; func_0203d34c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203c838
        .extern func_0203c8b0
        .extern func_0203cea8
        .extern func_0203d090
        .extern func_0203d170
        .extern func_0203d208
        .extern func_0203eac4
        .global func_0203d34c
        .arm
func_0203d34c:
    stmdb sp!, {r4, r5, r6, r7, lr}
    sub sp, sp, #0x4
    mov r7, r0
    mov r0, #0x10
    mvn r6, #0x0
    bl func_0203c8b0
    mov r4, r0
    mov r0, #0x1
    bl func_0203c8b0
    mov r1, #0x1
    strb r1, [r0, #0xb]
    bl func_0203c838
    cmp r0, #0x3
    beq .L_50
    cmp r0, #0x4
    beq .L_c0
    cmp r0, #0x5
    beq .L_10c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
.L_50:
    ldrh r1, [r7, #0xa]
    ldrb r5, [r4, #0xd11]
    cmp r1, #0x0
    beq .L_6c
    ldrb r0, [r7, #0xc]
    cmp r0, #0x0
    bne .L_78
.L_6c:
    ldrh r0, [r7, #0x36]
    bl func_0203eac4
    b .L_154
.L_78:
    cmp r1, #0x1
    beq .L_88
    cmp r0, #0x20
    bne .L_a8
.L_88:
    ldrh r0, [r7, #0x36]
    bl func_0203eac4
    ldrb r1, [r4, #0xd10]
    mov r0, r7
    add r2, r4, #0x300
    bl func_0203d208
    mov r6, r0
    b .L_154
.L_a8:
    ldrb r1, [r4, #0xd10]
    mov r0, r7
    add r2, r4, #0x300
    bl func_0203d208
    mov r6, r0
    b .L_154
.L_c0:
    ldrb r2, [r4, #0xd0f]
    mov r1, #0xc0
    mov r0, r7
    mla r1, r2, r1, r4
    add r1, r1, #0x400
    ldrh r2, [r1, #0xa6]
    mov r1, r4
    sub r2, r2, #0x1
    and r5, r2, #0xff
    bl func_0203d170
    movs r6, r0
    bmi .L_154
    ldr r0, _LIT0
    ldrb r1, [r4, #0xd0f]
    add r2, r4, r0
    ldrb r0, [r2, r1, lsl #0x2]
    orr r0, r0, #0x80
    strb r0, [r2, r1, lsl #0x2]
    b .L_154
.L_10c:
    ldrb r1, [r4, #0xd0f]
    add r2, r4, #0x300
    mov r0, #0x24
    mla r2, r1, r0, r2
    mov r0, r7
    mov r1, #0x1
    ldrb r5, [r4, #0xd11]
    bl func_0203d208
    movs r6, r0
    bmi .L_154
    ldrb r1, [r4, #0xd0f]
    mov r0, #0x24
    add r3, r4, #0x300
    mul r2, r1, r0
    ldrb r0, [r3, r2]
    bic r0, r0, #0xf
    orr r0, r0, #0x1
    strb r0, [r3, r2]
.L_154:
    cmp r6, #0x0
    addlt sp, sp, #0x4
    ldmltia sp!, {r4, r5, r6, r7, pc}
    mov r0, r6
    mov r1, r7
    mov r2, r5
    mov r3, r4
    bl func_0203d090
    mov r1, r4
    bl func_0203cea8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, pc}
_LIT0: .word 0x00000447
