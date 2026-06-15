; func_0206d96c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206d854
        .extern func_0206e4a4
        .extern func_0209268c
        .extern func_02092748
        .extern func_020927b8
        .global func_0206d96c
        .arm
func_0206d96c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r8, r0
    mov r7, r1
    mov r6, r2
    mov r5, r3
    bl func_0206e4a4
    cmp r0, #0x0
    addne sp, sp, #0x8
    mvnne r0, #0x1b
    ldmneia sp!, {r4, r5, r6, r7, r8, lr}
    bxne lr
    cmp r8, #0x0
    mov r1, #0x0
    beq .L_1f4
    ldrsh r0, [r8, #0x70]
    ands r0, r0, #0x1
    movne r1, #0x1
.L_1f4:
    cmp r1, #0x0
    addeq sp, sp, #0x8
    mvneq r0, #0x26
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    ldrsb r0, [r8, #0x73]
    mov r1, #0x1
    cmp r0, #0x0
    beq .L_220
    cmp r0, #0x4
    movne r1, #0x0
.L_220:
    cmp r1, #0x0
    beq .L_250
    ldrsh r0, [r8, #0x70]
    ands r0, r0, #0x4
    beq .L_240
    ldrsh r0, [r8, #0x70]
    ands r0, r0, #0x8
    beq .L_250
.L_240:
    add sp, sp, #0x8
    mvn r0, #0x37
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_250:
    ldr r0, [sp, #0x24]
    ldr r4, [r8, #0x68]
    ands r0, r0, #0x4
    bne .L_26c
    ldrsb r0, [r8, #0x72]
    cmp r0, #0x0
    bne .L_290
.L_26c:
    add r0, r4, #0xe0
    bl func_0209268c
    cmp r0, #0x0
    addeq sp, sp, #0x8
    mvneq r0, #0x5
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    mov ip, #0x0
    b .L_29c
.L_290:
    add r0, r4, #0xe0
    bl func_020927b8
    mov ip, #0x1
.L_29c:
    ldr r1, [sp, #0x20]
    mov r0, r8
    str r1, [sp]
    mov r1, r7
    mov r2, r6
    mov r3, r5
    str ip, [sp, #0x4]
    bl func_0206d854
    mov r5, r0
    add r0, r4, #0xe0
    bl func_02092748
    mov r0, r5
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
