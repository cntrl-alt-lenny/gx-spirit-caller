; func_020690fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054140
        .extern func_02067b54
        .extern func_0206803c
        .extern func_02068114
        .extern func_0206aa68
        .global func_020690fc
        .arm
func_020690fc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r2
    mov r4, r3
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b .L_324
    b .L_1bc
    b .L_244
    b .L_280
    b .L_2b4
    b .L_324
    b .L_2fc
    b .L_318
.L_1bc:
    ldr r3, [r4, #0x634]
    ldr ip, [r4, #0x630]
    mov r0, r4
    mov r1, #0x0
    blx ip
    ldrb r1, [r5, #0x14]
    ands r0, r1, #0x3
    beq .L_1e4
    ands r0, r1, #0x40
    bne .L_324
.L_1e4:
    ands r0, r1, #0x2c
    bne .L_324
    ldr r0, [r4, #0x624]
    cmp r0, #0x0
    bne .L_324
    ldrb r0, [r5, #0x15]
    ands r0, r0, #0x1
    beq .L_22c
    ldr r0, [r4, #0x4c]
    cmp r0, #0x0
    beq .L_21c
    ldr r0, [r4, #0x40]
    cmp r0, #0x0
    bne .L_224
.L_21c:
    mov r3, #0x1
    b .L_230
.L_224:
    mov r3, #0x0
    b .L_230
.L_22c:
    mov r3, #0x2
.L_230:
    mov r0, r4
    mov r1, r5
    mov r2, #0x0
    bl func_0206803c
    b .L_324
.L_244:
    ldrb r0, [r5, #0x14]
    ands r0, r0, #0x43
    bne .L_268
    ldr r3, [r4, #0x634]
    ldr ip, [r4, #0x630]
    mov r0, r4
    mov r1, #0x2
    blx ip
    b .L_324
.L_268:
    ldr r3, [r4, #0x634]
    ldr ip, [r4, #0x630]
    mov r0, r4
    mov r1, #0x1
    blx ip
    b .L_324
.L_280:
    ldrb r0, [r5, #0x14]
    ands r0, r0, #0x2c
    beq .L_298
    mov r0, r4
    mov r1, r5
    bl func_02067b54
.L_298:
    ldr r3, [r4, #0x634]
    ldr ip, [r4, #0x630]
    mov r0, r4
    mov r2, r5
    mov r1, #0x3
    blx ip
    b .L_324
.L_2b4:
    ldr r1, [r4, #0x620]
    cmp r1, #0x0
    beq .L_2c4
    bl func_0206aa68
.L_2c4:
    ldr r0, [r6, #0x4]
    bl func_02054140
    cmp r0, #0x0
    beq .L_2e0
    ldr r0, [r4, #0x10]
    cmp r0, #0x0
    bne .L_324
.L_2e0:
    ldr r3, [r4, #0x634]
    ldr ip, [r4, #0x630]
    mov r0, r4
    mov r1, #0x4
    mov r2, #0x0
    blx ip
    b .L_324
.L_2fc:
    ldr r3, [r4, #0x634]
    ldr ip, [r4, #0x630]
    mov r0, r4
    mov r1, #0x5
    mov r2, #0x0
    blx ip
    b .L_324
.L_318:
    ldr r1, [r4, #0x4ec]
    mov r0, r4
    bl func_02068114
.L_324:
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
