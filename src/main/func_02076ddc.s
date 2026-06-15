; func_02076ddc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02077018
        .extern func_020770bc
        .extern func_020771bc
        .extern func_02077398
        .extern func_0209bc20
        .global func_02076ddc
        .arm
func_02076ddc:
    stmdb sp!, {r0, r1, r2, r3}
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x24
    ldr r1, [sp, #0x4c]
    mov sl, r0
    ldrb r4, [r1, #0x2]
    ldrb r3, [r1]
    ldrb r2, [r1, #0x1]
    add r0, r1, #0x3
    mvn r1, #0x0
    str r0, [sp, #0x4c]
    add r2, r2, r3, lsl #0x8
    add r0, sp, #0x14
    str r1, [sl, #0x45c]
    add r7, r4, r2, lsl #0x8
    bl func_0209bc20
    mov r8, #0x0
    ldr r0, [sp, #0x14]
    ldr r2, [sp, #0x1c]
    add r1, r0, #0x7d0
    ldr r0, [sp, #0x18]
    mov r1, r1, lsl #0x10
    add r0, r1, r0, lsl #0x8
    add r0, r2, r0
    str r0, [sl, #0x80c]
    strb r8, [sl, #0x6b0]
    str r8, [sl, #0x5a0]
    ldr r0, [sl, #0x5a0]
    mov r6, r8
    str r0, [sl, #0x594]
    add r0, sl, #0x7b0
    str r0, [sp, #0x4]
    mov r0, #0x1
    str r8, [sp, #0x8]
    mov r4, r8
    mov fp, #0x2
    str r0, [sp, #0xc]
    mvn r5, #0x0
.L_218:
    ldr r1, [sp, #0x4c]
    mov r0, sl
    ldrb r2, [r1, #0x2]
    ldrb ip, [r1]
    ldrb r3, [r1, #0x1]
    add r9, r1, #0x3
    add r1, sp, #0x4c
    str r9, [sp, #0x4c]
    str r5, [sl, #0x458]
    strb r4, [sl, #0x5ad]
    strb r4, [sl, #0x5ac]
    strb r4, [sl, #0x5af]
    strb r4, [sl, #0x6b0]
    strb r4, [sl, #0x5b0]
    strb r4, [sl, #0x7b0]
    add r3, r3, ip, lsl #0x8
    ldr r9, [sp, #0x4c]
    add r3, r2, r3, lsl #0x8
    add r2, r3, #0x3
    str r9, [sl, #0x804]
    str r3, [sl, #0x808]
    sub r7, r7, r2
    mov r2, r4
    mov r3, r4
    str r8, [sp]
    bl func_02077398
    cmp r0, #0x0
    bne .L_2a0
    ldr r0, [sl, #0x594]
    cmp r0, #0x33
    bcc .L_2a0
    ldr r0, [sl, #0x5a0]
    cmp r0, #0x0
    bne .L_2b8
.L_2a0:
    mov r0, #0x9
    add sp, sp, #0x24
    strb r0, [sl, #0x455]
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
.L_2b8:
    mov r0, sl
    bl func_020770bc
    mov r8, r0
    cmp r6, #0x0
    bne .L_2e8
    ldr r0, [sl, #0x800]
    cmp r0, #0x0
    beq .L_2e8
    ldr r1, [sp, #0x4]
    bl func_02077018
    cmp r0, #0x0
    orrne r8, r8, #0x4000
.L_2e8:
    and r9, r8, #0xff
    cmp r9, #0x1
    bne .L_358
    cmp r7, #0x0
    beq .L_358
    ldr r1, [sp, #0x4c]
    ldr r2, [sp, #0x8]
    add r1, r1, #0x3
    str r1, [sp, #0x10]
    ldr r1, [sp, #0x8]
    mov r0, sl
    strb r1, [sl, #0x5ad]
    add r1, sp, #0x10
    mov r3, r2
    str fp, [sp]
    bl func_02077398
    cmp r0, #0x0
    movne r0, #0x9
    addne sp, sp, #0x24
    strneb r0, [sl, #0x455]
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    addne sp, sp, #0x10
    bxne lr
    mov r0, sl
    add r1, sl, #0x480
    bl func_020771bc
    bic r1, r8, #0xff
    orr r8, r1, r0
.L_358:
    ldr r3, [sl, #0x810]
    cmp r3, #0x0
    beq .L_378
    mov r0, r8
    mov r1, sl
    mov r2, r6
    blx r3
    mov r8, r0
.L_378:
    cmp r9, #0x0
    add r6, r6, #0x1
    beq .L_398
    cmp r8, #0x0
    bne .L_398
    cmp r7, #0x0
    ldrne r8, [sp, #0xc]
    bne .L_218
.L_398:
    cmp r8, #0x0
    moveq r0, #0x3
    streqb r0, [sl, #0x455]
    movne r0, #0x9
    strneb r0, [sl, #0x455]
    add sp, sp, #0x24
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    add sp, sp, #0x10
    bx lr
