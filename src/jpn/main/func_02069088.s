; func_02069088 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020540cc
        .extern func_02067ae0
        .extern func_02067fc8
        .extern func_020680a0
        .extern func_0206a9f4
        .global func_02069088
        .arm
func_02069088:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r2
    mov r4, r3
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b .L_1a0
    b .L_38
    b .L_c0
    b .L_fc
    b .L_130
    b .L_1a0
    b .L_178
    b .L_194
.L_38:
    ldr r3, [r4, #0x634]
    ldr ip, [r4, #0x630]
    mov r0, r4
    mov r1, #0x0
    blx ip
    ldrb r1, [r5, #0x14]
    ands r0, r1, #0x3
    beq .L_60
    ands r0, r1, #0x40
    bne .L_1a0
.L_60:
    ands r0, r1, #0x2c
    bne .L_1a0
    ldr r0, [r4, #0x624]
    cmp r0, #0x0
    bne .L_1a0
    ldrb r0, [r5, #0x15]
    ands r0, r0, #0x1
    beq .L_a8
    ldr r0, [r4, #0x4c]
    cmp r0, #0x0
    beq .L_98
    ldr r0, [r4, #0x40]
    cmp r0, #0x0
    bne .L_a0
.L_98:
    mov r3, #0x1
    b .L_ac
.L_a0:
    mov r3, #0x0
    b .L_ac
.L_a8:
    mov r3, #0x2
.L_ac:
    mov r0, r4
    mov r1, r5
    mov r2, #0x0
    bl func_02067fc8
    b .L_1a0
.L_c0:
    ldrb r0, [r5, #0x14]
    ands r0, r0, #0x43
    bne .L_e4
    ldr r3, [r4, #0x634]
    ldr ip, [r4, #0x630]
    mov r0, r4
    mov r1, #0x2
    blx ip
    b .L_1a0
.L_e4:
    ldr r3, [r4, #0x634]
    ldr ip, [r4, #0x630]
    mov r0, r4
    mov r1, #0x1
    blx ip
    b .L_1a0
.L_fc:
    ldrb r0, [r5, #0x14]
    ands r0, r0, #0x2c
    beq .L_114
    mov r0, r4
    mov r1, r5
    bl func_02067ae0
.L_114:
    ldr r3, [r4, #0x634]
    ldr ip, [r4, #0x630]
    mov r0, r4
    mov r2, r5
    mov r1, #0x3
    blx ip
    b .L_1a0
.L_130:
    ldr r1, [r4, #0x620]
    cmp r1, #0x0
    beq .L_140
    bl func_0206a9f4
.L_140:
    ldr r0, [r6, #0x4]
    bl func_020540cc
    cmp r0, #0x0
    beq .L_15c
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    bne .L_1a0
.L_15c:
    ldr r3, [r4, #0x634]
    ldr ip, [r4, #0x630]
    mov r0, r4
    mov r1, #0x4
    mov r2, #0x0
    blx ip
    b .L_1a0
.L_178:
    ldr r3, [r4, #0x634]
    ldr ip, [r4, #0x630]
    mov r0, r4
    mov r1, #0x5
    mov r2, #0x0
    blx ip
    b .L_1a0
.L_194:
    ldr r1, [r4, #0x4ec]
    mov r0, r4
    bl func_020680a0
.L_1a0:
    cmp r5, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, [r5]
    ldr r0, [r4, #0x628]
    cmp r1, r0
    ldmneia sp!, {r4, r5, r6, pc}
    add r0, r4, #0x600
    ldrh r1, [r5, #0x4]
    ldrh r0, [r0, #0x2c]
    cmp r1, r0
    moveq r0, #0x0
    streq r0, [r4, #0x628]
    ldmia sp!, {r4, r5, r6, pc}
