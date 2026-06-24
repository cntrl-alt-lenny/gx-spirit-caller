; func_02063a6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02053ed4
        .extern func_0205405c
        .extern func_020540cc
        .extern func_02061364
        .extern func_020614bc
        .extern func_020628b8
        .extern func_02063c1c
        .extern func_0206440c
        .global func_02063a6c
        .arm
func_02063a6c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x10
    mov r9, r0
    ldr r0, [r9, #0x5c]
    mov r8, r1
    mov r7, r2
    mov r6, r3
    ldr r5, [sp, #0x34]
    bl func_020540cc
    mov r4, r0
    cmp r4, #0x0
    mov sl, #0x0
    ble .L_78
.L_34:
    ldr r0, [r9, #0x5c]
    mov r1, sl
    bl func_0205405c
    ldrh r0, [r0, #0xc]
    cmp r0, r7
    moveq r0, #0x0
    streq r0, [r5]
    addeq sp, sp, #0x10
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r1, r7
    bl func_0206440c
    cmp r0, #0x0
    bgt .L_78
    add sl, sl, #0x1
    cmp sl, r4
    blt .L_34
.L_78:
    add r0, r9, #0x44
    bl func_020614bc
    ldr r2, [sp, #0x30]
    cmp r0, r2
    movlt r0, #0x1
    addlt sp, sp, #0x10
    strlt r0, [r5]
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, [r9, #0x4c]
    add r1, sp, #0x0
    str r2, [sp, #0x4]
    str r8, [sp, #0x8]
    strh r7, [sp, #0xc]
    str r0, [sp]
    ldr r0, [r9, #0x5c]
    ldr r2, _LIT0
    bl func_02053ed4
    ldr r0, [r9, #0x5c]
    bl func_020540cc
    add r1, r4, #0x1
    cmp r1, r0
    movne r0, #0x1
    addne sp, sp, #0x10
    strne r0, [r5]
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r2, [sp, #0x30]
    mov r1, r6
    add r0, r9, #0x44
    bl func_02061364
    cmp r4, #0x0
    bne .L_120
    sub r0, r7, #0x1
    mov r2, r0, lsl #0x10
    ldrh r1, [r9, #0x66]
    mov r0, r9
    mov r2, r2, lsr #0x10
    bl func_020628b8
    cmp r0, #0x0
    bne .L_198
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_120:
    ldr r0, [r9, #0x5c]
    mov r1, r4
    bl func_0205405c
    ldrh r0, [r0, #0xc]
    cmp r0, r7
    bne .L_198
    ldr r0, [r9, #0x5c]
    sub r1, r4, #0x1
    bl func_0205405c
    mov r4, r0
    ldrh r1, [r4, #0xc]
    mov r0, r7
    bl func_0206440c
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    cmp r0, #0x1
    bls .L_198
    ldrh r1, [r4, #0xc]
    sub r0, r7, #0x1
    mov r2, r0, lsl #0x10
    add r0, r1, #0x1
    mov r1, r0, lsl #0x10
    mov r0, r9
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    bl func_020628b8
    cmp r0, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_198:
    mov r0, #0x0
    str r0, [r5]
    mov r0, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word func_02063c1c
