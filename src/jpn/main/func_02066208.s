; func_02066208 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101500
        .extern func_02054c34
        .extern func_0206656c
        .extern func_020665dc
        .extern func_02066708
        .extern func_02066950
        .extern func_02066cd0
        .extern func_02066d8c
        .extern func_02066e2c
        .extern func_020a7274
        .global func_02066208
        .arm
func_02066208:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    ldr ip, _LIT0
    sub sp, sp, ip
    movs r8, r0
    mov r0, #0x0
    str r0, [sp, #0x80c]
    ldreq r0, _LIT1
    mov r7, r2
    ldreq r8, [r0]
    ldrsb r0, [r1]
    mov r6, r3
    cmp r0, #0x3b
    bne .L_64
    ldr r3, [r8, #0xd4]
    cmp r3, #0x0
    ldreq ip, _LIT0
    addeq sp, sp, ip
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    mov r0, r1
    mov r1, r7
    mov r2, r6
    blx r3
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_64:
    cmp r0, #0x5c
    bne .L_a4
    add r1, sp, #0xc
    mov r0, r8
    bl func_02066708
    str r6, [sp]
    mov r0, #0x8
    str r0, [sp, #0x4]
    ldr r0, [r8]
    ldr r2, [sp, #0x80c]
    add r1, sp, #0xc
    mov r3, #0x0
    bl func_02054c34
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_a4:
    cmp r7, #0x7
    ldrlt ip, _LIT0
    addlt sp, sp, ip
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, pc}
    and r0, r0, #0xff
    cmp r0, #0xfe
    ldrne ip, _LIT0
    addne sp, sp, ip
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldrb r0, [r1, #0x1]
    cmp r0, #0xfd
    ldrne ip, _LIT0
    addne sp, sp, ip
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    ldr r0, [r8, #0xb8]
    add r5, r1, #0x3
    cmp r0, #0x0
    movgt r0, #0x0
    strgt r0, [r8, #0xb8]
    ldrsb r9, [r1, #0x2]
    add r4, r1, #0x7
    add r0, sp, #0xc
    mov r1, r9
    mov r2, r5
    sub r7, r7, #0x7
    bl func_02066e2c
    cmp r9, #0x8
    addls pc, pc, r9, lsl #0x2
    b .L_324
    b .L_13c
    b .L_154
    b .L_190
    b .L_324
    b .L_1c8
    b .L_324
    b .L_250
    b .L_324
    b .L_324
.L_13c:
    add r1, sp, #0xc
    mov r0, r8
    mov r2, r4
    mov r3, r7
    bl func_02066950
    b .L_330
.L_154:
    cmp r7, #0xd
    blt .L_178
    ldr r0, [r8, #0xa8]
    cmp r0, #0x0
    beq .L_178
    add r1, r4, r7
    mov r0, r8
    sub r1, r1, #0xd
    bl func_02066cd0
.L_178:
    add r1, sp, #0xc
    mov r0, r8
    mov r2, r4
    mov r3, r7
    bl func_02066d8c
    b .L_330
.L_190:
    ldr r0, [sp, #0x80c]
    cmp r7, #0x20
    movgt r7, #0x20
    add r3, sp, #0xc
    mov r5, #0x5
    mov r1, r4
    mov r2, r7
    add r0, r3, r0
    strb r5, [sp, #0xc]
    bl func_020a7274
    ldr r0, [sp, #0x80c]
    add r0, r0, r7
    str r0, [sp, #0x80c]
    b .L_330
.L_1c8:
    ldr r1, [r8, #0xb8]
    mvn r0, #0x0
    cmp r1, r0
    ldreq ip, _LIT0
    addeq sp, sp, ip
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    mov r0, #0x0
    str r0, [sp, #0x8]
.L_1e8:
    ldr r2, [sp, #0x8]
    add r0, r8, r2
    ldrsb r1, [r5, r2]
    ldrsb r0, [r0, #0x84]
    cmp r1, r0
    ldrne ip, _LIT0
    addne sp, sp, ip
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    add r0, r2, #0x1
    str r0, [sp, #0x8]
    cmp r0, #0x4
    blt .L_1e8
    cmp r7, #0x2
    ldrlt ip, _LIT0
    addlt sp, sp, ip
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, pc}
    mvn r0, #0x0
    str r0, [r8, #0xb8]
    ldrsb r0, [r4]
    ldr r2, [r8, #0x10c]
    ldr r3, [r8, #0x9c]
    add r1, r4, #0x1
    blx r3
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_250:
    mov r0, #0x0
    str r0, [sp, #0x8]
.L_258:
    ldr r2, [sp, #0x8]
    add r0, r8, r2
    ldrsb r1, [r5, r2]
    ldrsb r0, [r0, #0x84]
    cmp r1, r0
    ldrne ip, _LIT0
    addne sp, sp, ip
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, pc}
    add r0, r2, #0x1
    str r0, [sp, #0x8]
    cmp r0, #0x4
    blt .L_258
    cmp r7, #0x4
    ldrlt ip, _LIT0
    addlt sp, sp, ip
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, pc}
    mov r0, #0x7
    strb r0, [sp, #0xc]
    ldrb r1, [r4]
    ldrb r0, [r4, #0x1]
    ldr r2, [sp, #0x80c]
    add r5, sp, #0xc
    strb r1, [r5, r2]
    add r5, r5, r2
    strb r0, [r5, #0x1]
    ldrb r2, [r4, #0x2]
    ldrb r1, [r4, #0x3]
    add r3, sp, #0x8
    mov r0, r8
    strb r2, [r5, #0x2]
    strb r1, [r5, #0x3]
    ldr r1, [sp, #0x80c]
    add r1, r1, #0x4
    str r1, [sp, #0x80c]
    ldrb r2, [r4]
    ldrb r1, [r4, #0x1]
    strb r2, [r3]
    strb r1, [r3, #0x1]
    ldrb r2, [r4, #0x2]
    ldrb r1, [r4, #0x3]
    strb r2, [r3, #0x2]
    strb r1, [r3, #0x3]
    ldr r1, [sp, #0x8]
    bl func_0206656c
    cmp r0, #0x0
    bne .L_330
    mov r0, r8
    add r1, r4, #0x4
    sub r2, r7, #0x4
    bl func_020665dc
    b .L_330
.L_324:
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_330:
    str r6, [sp]
    mov r0, #0x8
    str r0, [sp, #0x4]
    ldr r0, [r8]
    ldr r2, [sp, #0x80c]
    add r1, sp, #0xc
    mov r3, #0x0
    bl func_02054c34
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000814
_LIT1: .word data_02101500
