; func_ov006_021c16bc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202160c
        .extern func_0202165c
        .extern func_0202de48
        .extern func_ov006_021c184c
        .global func_ov006_021c16bc
        .arm
func_ov006_021c16bc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    ldr r0, [r6]
    mov r1, #0x3
    mov r2, #0x0
    bl func_0202160c
    mov r4, r0
    ldr r1, [r6, #0xc]
    mov r0, r6
    bl func_ov006_021c184c
    movs r5, r0
    beq .L_10c
    ldr r0, [r6, #0x14]
    cmp r0, #0xf
    blt .L_10c
    ldrsh r2, [r5, #0x2]
    mov r0, r4
    mov r1, #0xf
    bl func_0202165c
    ldrsh r2, [r5, #0x4]
    mov r0, r4
    mov r1, #0x10
    bl func_0202165c
    ldrb r2, [r5, #0x17]
    mov r0, r4
    mov r1, #0xe
    bl func_0202165c
    ldrsh r2, [r5, #0x12]
    mov r0, r4
    mov r1, #0xa
    bl func_0202165c
    ldr r0, [r6, #0x18]
    mov r1, #0x3
    cmp r0, #0x0
    ldrnesh r2, [r5, #0xc]
    mov r0, r4
    ldreqsh r2, [r5, #0x6]
    bl func_0202165c
    ldr r0, [r6, #0x18]
    mov r1, #0x4
    cmp r0, #0x0
    ldrnesh r2, [r5, #0xe]
    mov r0, r4
    ldreqsh r2, [r5, #0x8]
    bl func_0202165c
    ldr r0, [r6, #0x18]
    mov r1, #0x5
    cmp r0, #0x0
    ldrnesh r2, [r5, #0x10]
    mov r0, r4
    ldreqsh r2, [r5, #0xa]
    bl func_0202165c
    ldrsh r1, [r5]
    ldr r0, [r6, #0x10]
    mov r2, #0x41
    cmp r1, r0
    ldr r0, [r6, #0x1c]
    orrne r2, r2, #0x200
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6, #0x1c]
    ldr r0, [r6, #0x18]
    orrne r2, r2, #0x400
    cmp r0, #0x0
    orrne r2, r2, #0x4
    str r1, [r6, #0x10]
    b .L_118
.L_10c:
    mov r2, #0x0
    sub r0, r2, #0x1
    str r0, [r6, #0x10]
.L_118:
    mov r0, r4
    mov r1, #0x0
    bl func_0202165c
    ldr r0, [r6]
    mov r1, #0x3
    mov r2, #0x1
    bl func_0202160c
    mov r4, r0
    cmp r5, #0x0
    mov r5, #0x0
    bne .L_16c
    ldr r0, [r6, #0x14]
    cmp r0, #0xf
    blt .L_16c
    ldr r0, [r6, #0xc]
    cmp r0, #0x0
    beq .L_16c
    bl func_0202de48
    sub r0, r0, #0x7
    cmp r0, #0x1
    orrls r5, r5, #0x1
.L_16c:
    mov r0, r4
    mov r2, r5
    mov r1, #0x0
    bl func_0202165c
    ldr r1, [r6, #0x14]
    mov r0, #0x1
    add r1, r1, #0x1
    str r1, [r6, #0x14]
    ldmia sp!, {r4, r5, r6, pc}
