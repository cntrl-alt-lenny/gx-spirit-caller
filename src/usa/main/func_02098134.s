; func_02098134 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a822c
        .extern func_020976cc
        .extern func_02097754
        .global func_02098134
        .arm
func_02098134:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r7, r1
    ldrb r1, [r7]
    mov r8, r0
    mov r6, r2
    mov r5, r3
    cmp r1, #0x2f
    beq .L_2c
    cmp r1, #0x5c
    bne .L_50
.L_2c:
    ldr r0, _LIT0
    mov r1, #0x0
    ldr r0, [r0]
    strh r1, [sp, #0x4]
    str r0, [sp]
    str r1, [sp, #0x8]
    strh r1, [sp, #0x6]
    add r7, r7, #0x1
    b .L_10c
.L_50:
    ldr r0, _LIT0
    add r3, sp, #0x0
    ldmia r0, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    mov r4, #0x0
.L_64:
    ldrb r0, [r7, r4]
    cmp r0, #0x0
    beq .L_10c
    cmp r0, #0x2f
    beq .L_10c
    cmp r0, #0x5c
    beq .L_10c
    cmp r0, #0x3a
    bne .L_100
    mov r0, r7
    mov r1, r4
    bl func_020976cc
    cmp r0, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    ldr r1, [r0, #0x1c]
    ands r1, r1, #0x2
    movne r1, #0x1
    moveq r1, #0x0
    cmp r1, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    mov r1, #0x0
    str r0, [sp]
    str r1, [sp, #0x8]
    strh r1, [sp, #0x6]
    strh r1, [sp, #0x4]
    add r0, r4, #0x1
    ldrb r0, [r7, r0]!
    cmp r0, #0x2f
    beq .L_f8
    cmp r0, #0x5c
    bne .L_10c
.L_f8:
    add r7, r7, #0x1
    b .L_10c
.L_100:
    add r4, r4, #0x1
    cmp r4, #0x3
    ble .L_64
.L_10c:
    ldr r1, [sp]
    add r0, sp, #0x0
    str r1, [r8, #0x8]
    str r7, [r8, #0x3c]
    add r3, r8, #0x30
    ldmia r0, {r0, r1, r2}
    stmia r3, {r0, r1, r2}
    cmp r5, #0x0
    movne r0, #0x1
    strne r0, [r8, #0x40]
    strne r5, [r8, #0x44]
    moveq r0, #0x0
    streq r0, [r8, #0x40]
    mov r0, r8
    mov r1, #0x4
    streq r6, [r8, #0x44]
    bl func_02097754
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
_LIT0: .word data_021a822c
