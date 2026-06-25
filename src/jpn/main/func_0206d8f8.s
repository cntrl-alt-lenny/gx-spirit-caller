; func_0206d8f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206d7e0
        .extern func_0206e430
        .extern func_020925a4
        .extern func_02092660
        .extern func_020926d0
        .global func_0206d8f8
        .arm
func_0206d8f8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r8, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl func_0206e430
    cmp r0, #0x0
    addne sp, sp, #0x8
    mvnne r0, #0x1b
    ldmneia sp!, {r4, r5, r6, r7, r8, lr}
    bxne lr
    cmp r8, #0x0
    mov r1, #0x0
    beq .L_48
    ldrsh r0, [r8, #0x70]
    ands r0, r0, #0x1
    movne r1, #0x1
.L_48:
    cmp r1, #0x0
    addeq sp, sp, #0x8
    mvneq r0, #0x26
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    ldrsb r0, [r8, #0x73]
    mov r1, #0x1
    cmp r0, #0x0
    beq .L_74
    cmp r0, #0x4
    movne r1, #0x0
.L_74:
    cmp r1, #0x0
    beq .L_a4
    ldrsh r0, [r8, #0x70]
    ands r0, r0, #0x4
    beq .L_94
    ldrsh r0, [r8, #0x70]
    ands r0, r0, #0x8
    beq .L_a4
.L_94:
    add sp, sp, #0x8
    mvn r0, #0x37
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_a4:
    ldr r0, [sp, #0x24]
    ldr r4, [r8, #0x68]
    ands r0, r0, #0x4
    bne .L_c0
    ldrsb r0, [r8, #0x72]
    cmp r0, #0x0
    bne .L_e4
.L_c0:
    add r0, r4, #0xe0
    bl func_020925a4
    cmp r0, #0x0
    addeq sp, sp, #0x8
    mvneq r0, #0x5
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    mov ip, #0x0
    b .L_f0
.L_e4:
    add r0, r4, #0xe0
    bl func_020926d0
    mov ip, #0x1
.L_f0:
    ldr r1, [sp, #0x20]
    mov r0, r8
    str r1, [sp]
    mov r1, r7
    mov r2, r6
    mov r3, r5
    str ip, [sp, #0x4]
    bl func_0206d7e0
    mov r5, r0
    add r0, r4, #0xe0
    bl func_02092660
    mov r0, r5
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
