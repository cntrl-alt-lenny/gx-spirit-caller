; func_02067ce8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054d14
        .extern func_02055000
        .extern func_02067e8c
        .extern func_02067e94
        .extern func_02067f3c
        .global func_02067ce8
        .arm
func_02067ce8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    ldr ip, _LIT0
    sub sp, sp, ip
    movs r9, r1
    mov r1, #0x8
    mov sl, r0
    str r1, [sp, #0x10]
    ldrne r8, [sl, #0x24]
    ldreq r8, [sl, #0x20]
    mov r0, r8
    bl func_02055000
    cmp r0, #0x0
    ldreq ip, _LIT0
    addeq sp, sp, ip
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    add r5, sp, #0x14
    add fp, sp, #0x8
    mov r4, #0x0
.L_188:
    ldr r2, _LIT1
    str fp, [sp]
    add r6, sp, #0x10
    mov r0, r8
    mov r1, r5
    mov r3, r4
    str r6, [sp, #0x4]
    bl func_02054d14
    mov r7, r0
    mvn r0, #0x0
    cmp r7, r0
    ldreq ip, _LIT0
    addeq sp, sp, ip
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    strb r4, [r5, r7]
    ldr r6, [sl, #0x8]
    cmp r6, #0x0
    beq .L_2c0
.L_1d0:
    cmp r9, #0x0
    beq .L_1f4
    ldrb r0, [r6, #0x15]
    ands r0, r0, #0x8
    beq .L_1f4
    ldr r1, [r6, #0x10]
    ldr r0, [sp, #0xc]
    cmp r1, r0
    beq .L_250
.L_1f4:
    ldr r0, [sp, #0xc]
    ldr r3, [r6]
    cmp r3, r0
    bne .L_21c
    ldrh r2, [r6, #0x4]
    ldrh r1, [sp, #0xa]
    cmp r2, r1
    beq .L_250
    cmp r9, #0x0
    bne .L_250
.L_21c:
    ldr r1, [sl, #0x28]
    cmp r3, r1
    bne .L_2b4
    ldrb r1, [r6, #0x15]
    ands r1, r1, #0x2
    beq .L_2b4
    ldr r1, [r6, #0x8]
    cmp r1, r0
    bne .L_2b4
    ldrh r1, [r6, #0xc]
    ldrh r0, [sp, #0xa]
    cmp r1, r0
    bne .L_2b4
.L_250:
    cmp r9, #0x0
    beq .L_278
    mov r0, sl
    mov r1, r6
    mov r2, r5
    mov r3, r7
    bl func_02067e8c
    cmp r0, #0x0
    beq .L_2b4
    b .L_2c0
.L_278:
    ldr r0, [sl]
    cmp r0, #0x1
    bne .L_29c
    mov r0, sl
    mov r1, r6
    mov r2, r5
    mov r3, r7
    bl func_02067f3c
    b .L_2c0
.L_29c:
    mov r0, sl
    mov r1, r6
    mov r2, r5
    mov r3, r7
    bl func_02067e94
    b .L_2c0
.L_2b4:
    ldr r6, [r6, #0x20]
    cmp r6, #0x0
    bne .L_1d0
.L_2c0:
    mov r0, r8
    bl func_02055000
    cmp r0, #0x0
    bne .L_188
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000814
_LIT1: .word 0x000007ff
