; func_0206ccf0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206cc48
        .extern func_0206cf2c
        .extern func_02070844
        .extern func_02070950
        .extern func_02091680
        .extern func_02094688
        .global func_0206ccf0
        .arm
func_0206ccf0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x14
    ldr r9, [r0, #0x4]
    ldr r1, [r0, #0x10]
    ldr r8, [r9, #0x64]
    str r1, [sp, #0x4]
    ldr r1, [r0, #0x18]
    ldr sl, [r0, #0x14]
    ldr r0, [r0, #0x1c]
    ldr r7, [r8, #0xf8]
    str r1, [sp, #0x8]
    str r0, [sp, #0xc]
    add fp, sp, #0x10
    mov r5, #0x0
    mov r6, #0x1
    mov r4, #0xa
.L_40:
    mov r0, fp
    bl func_02070950
    cmp r0, #0x0
    beq .L_9c
    ldr r1, [sp, #0x10]
    sub r1, r1, r7
    cmp r1, #0x0
    bgt .L_9c
    ldrsb r0, [r9, #0x73]
    mov r1, r6
    cmp r0, #0x0
    beq .L_78
    cmp r0, #0x4
    movne r1, r5
.L_78:
    cmp r1, #0x0
    beq .L_90
    ldrb r0, [r9, #0x8]
    cmp r0, #0x4
    movne r0, #0x0
    bne .L_9c
.L_90:
    mov r0, r4
    bl func_02091680
    b .L_40
.L_9c:
    ldrsb r1, [r9, #0x73]
    cmp r1, #0x4
    bne .L_ec
    cmp r0, #0x0
    addeq sp, sp, #0x14
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxeq lr
    ldr r1, [sp, #0x10]
    cmp sl, r1
    movhi sl, r1
    ldr r1, [sp, #0x4]
    mov r2, sl
    bl func_02094688
    mov r0, sl
    bl func_02070844
    add sp, sp, #0x14
    mov r0, sl
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
.L_ec:
    cmp r0, #0x0
    moveq r4, #0x0
    beq .L_118
    ldr r4, [sp, #0xc]
    ldr r1, [sp, #0x4]
    ldr r3, [sp, #0x8]
    mov r0, r9
    mov r2, sl
    str r4, [sp]
    bl func_0206cf2c
    mov r4, r0
.L_118:
    cmp r4, #0x0
    addle sp, sp, #0x14
    movle r0, r4
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxle lr
    ldrh r0, [r8, #0xfc]
    ldr r1, [r8, #0xf8]
    cmp r1, r0
    blt .L_144
    mov r0, r9
    bl func_0206cc48
.L_144:
    mov r0, r4
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
