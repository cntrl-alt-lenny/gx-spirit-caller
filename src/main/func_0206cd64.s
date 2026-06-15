; func_0206cd64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206ccbc
        .extern func_0206cfa0
        .extern func_0207092c
        .extern func_02070a38
        .extern func_02091768
        .extern func_02094688
        .global func_0206cd64
        .arm
func_0206cd64:
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
.L_98:
    mov r0, fp
    bl func_02070a38
    cmp r0, #0x0
    beq .L_f4
    ldr r1, [sp, #0x10]
    sub r1, r1, r7
    cmp r1, #0x0
    bgt .L_f4
    ldrsb r0, [r9, #0x73]
    mov r1, r6
    cmp r0, #0x0
    beq .L_d0
    cmp r0, #0x4
    movne r1, r5
.L_d0:
    cmp r1, #0x0
    beq .L_e8
    ldrb r0, [r9, #0x8]
    cmp r0, #0x4
    movne r0, #0x0
    bne .L_f4
.L_e8:
    mov r0, r4
    bl func_02091768
    b .L_98
.L_f4:
    ldrsb r1, [r9, #0x73]
    cmp r1, #0x4
    bne .L_144
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
    bl func_0207092c
    add sp, sp, #0x14
    mov r0, sl
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
.L_144:
    cmp r0, #0x0
    moveq r4, #0x0
    beq .L_170
    ldr r4, [sp, #0xc]
    ldr r1, [sp, #0x4]
    ldr r3, [sp, #0x8]
    mov r0, r9
    mov r2, sl
    str r4, [sp]
    bl func_0206cfa0
    mov r4, r0
.L_170:
    cmp r4, #0x0
    addle sp, sp, #0x14
    movle r0, r4
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bxle lr
    ldrh r0, [r8, #0xfc]
    ldr r1, [r8, #0xf8]
    cmp r1, r0
    blt .L_19c
    mov r0, r9
    bl func_0206ccbc
.L_19c:
    mov r0, r4
    add sp, sp, #0x14
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
