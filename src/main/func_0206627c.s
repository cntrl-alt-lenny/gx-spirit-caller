; func_0206627c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021015e0
        .extern func_02054ca8
        .extern func_020665e0
        .extern func_02066650
        .extern func_0206677c
        .extern func_020669c4
        .extern func_02066d44
        .extern func_02066e00
        .extern func_02066ea0
        .extern func_020a7368
        .global func_0206627c
        .arm
func_0206627c:
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
    bne .L_338
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
.L_338:
    cmp r0, #0x5c
    bne .L_378
    add r1, sp, #0xc
    mov r0, r8
    bl func_0206677c
    str r6, [sp]
    mov r0, #0x8
    str r0, [sp, #0x4]
    ldr r0, [r8]
    ldr r2, [sp, #0x80c]
    add r1, sp, #0xc
    mov r3, #0x0
    bl func_02054ca8
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_378:
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
    bl func_02066ea0
    cmp r9, #0x8
    addls pc, pc, r9, lsl #0x2
    b .L_5f8
    b .L_410
    b .L_428
    b .L_464
    b .L_5f8
    b .L_49c
    b .L_5f8
    b .L_524
    b .L_5f8
    b .L_5f8
.L_410:
    add r1, sp, #0xc
    mov r0, r8
    mov r2, r4
    mov r3, r7
    bl func_020669c4
    b .L_604
.L_428:
    cmp r7, #0xd
    blt .L_44c
    ldr r0, [r8, #0xa8]
    cmp r0, #0x0
    beq .L_44c
    add r1, r4, r7
    mov r0, r8
    sub r1, r1, #0xd
    bl func_02066d44
.L_44c:
    add r1, sp, #0xc
    mov r0, r8
    mov r2, r4
    mov r3, r7
    bl func_02066e00
    b .L_604
.L_464:
    ldr r0, [sp, #0x80c]
    cmp r7, #0x20
    movgt r7, #0x20
    add r3, sp, #0xc
    mov r5, #0x5
    mov r1, r4
    mov r2, r7
    add r0, r3, r0
    strb r5, [sp, #0xc]
    bl func_020a7368
    ldr r0, [sp, #0x80c]
    add r0, r0, r7
    str r0, [sp, #0x80c]
    b .L_604
.L_49c:
    ldr r1, [r8, #0xb8]
    mvn r0, #0x0
    cmp r1, r0
    ldreq ip, _LIT0
    addeq sp, sp, ip
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    mov r0, #0x0
    str r0, [sp, #0x8]
.L_4bc:
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
    blt .L_4bc
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
.L_524:
    mov r0, #0x0
    str r0, [sp, #0x8]
.L_52c:
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
    blt .L_52c
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
    bl func_020665e0
    cmp r0, #0x0
    bne .L_604
    mov r0, r8
    add r1, r4, #0x4
    sub r2, r7, #0x4
    bl func_02066650
    b .L_604
.L_5f8:
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_604:
    str r6, [sp]
    mov r0, #0x8
    str r0, [sp, #0x4]
    ldr r0, [r8]
    ldr r2, [sp, #0x80c]
    add r1, sp, #0xc
    mov r3, #0x0
    bl func_02054ca8
    ldr ip, _LIT0
    add sp, sp, ip
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000814
_LIT1: .word data_021015e0
