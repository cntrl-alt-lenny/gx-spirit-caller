; func_0206d17c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206d0d4
        .extern func_0206e430
        .extern func_020925a4
        .extern func_02092660
        .extern func_020926d0
        .extern func_02093714
        .global func_0206d17c
        .arm
func_0206d17c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    mov r9, r0
    mov r8, r1
    mov r7, r2
    mov r6, r3
    bl func_0206e430
    cmp r0, #0x0
    addne sp, sp, #0xc
    mvnne r0, #0x1b
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxne lr
    ldr r0, [sp, #0x2c]
    ands r0, r0, #0x4
    bne .L_48
    ldrsb r0, [r9, #0x72]
    cmp r0, #0x0
    bne .L_68
.L_48:
    ldrsb r0, [r9, #0x73]
    cmp r0, #0x4
    addeq sp, sp, #0xc
    mvneq r0, #0x1b
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    mov r4, #0x0
    b .L_84
.L_68:
    bl func_02093714
    cmp r0, #0x12
    addeq sp, sp, #0xc
    mvneq r0, #0x1b
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    mov r4, #0x1
.L_84:
    cmp r9, #0x0
    mov r1, #0x0
    beq .L_9c
    ldrsh r0, [r9, #0x70]
    ands r0, r0, #0x1
    movne r1, #0x1
.L_9c:
    cmp r1, #0x0
    addeq sp, sp, #0xc
    mvneq r0, #0x26
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bxeq lr
    ldrsb r0, [r9, #0x73]
    mov r1, #0x1
    cmp r0, #0x0
    beq .L_c8
    cmp r0, #0x4
    movne r1, #0x0
.L_c8:
    cmp r1, #0x0
    beq .L_f8
    ldrsh r0, [r9, #0x70]
    ands r0, r0, #0x4
    beq .L_e8
    ldrsh r0, [r9, #0x70]
    ands r0, r0, #0x8
    beq .L_f8
.L_e8:
    add sp, sp, #0xc
    mvn r0, #0x37
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
.L_f8:
    ands r0, r4, #0x1
    ldr r5, [r9, #0x64]
    bne .L_124
    add r0, r5, #0xe0
    bl func_020925a4
    cmp r0, #0x0
    bne .L_12c
    add sp, sp, #0xc
    mvn r0, #0x5
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
.L_124:
    add r0, r5, #0xe0
    bl func_020926d0
.L_12c:
    ldr r0, [sp, #0x28]
    ldr ip, [sp, #0x2c]
    str r0, [sp]
    str r4, [sp, #0x4]
    mov r0, r9
    mov r1, r8
    mov r2, r7
    mov r3, r6
    str ip, [sp, #0x8]
    bl func_0206d0d4
    mov r4, r0
    add r0, r5, #0xe0
    bl func_02092660
    mov r0, r4
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
