; func_0206a2a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02101cec
        .extern func_0206840c
        .extern func_02068454
        .extern func_0206a3d8
        .extern func_0206a6b0
        .extern func_0206a73c
        .extern func_0206a84c
        .extern func_0206a8e4
        .extern func_0206b764
        .extern func_020a734c
        .global func_0206a2a8
        .arm
func_0206a2a8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r4, r2
    cmp r4, #0x1
    mov r6, r0
    mov r5, r1
    addlt sp, sp, #0x10
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, r7, r8, pc}
    ldrb r7, [r5]
    mov r0, r7
    bl func_0206a8e4
    mov r8, r0
    cmp r4, r8
    addlt sp, sp, #0x10
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, r7, r8, pc}
    ands r0, r7, #0x40
    beq .L_6c
    mov r0, r6
    add r1, r5, r8
    sub r2, r4, r8
    bl func_0206a73c
    cmp r0, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_6c:
    ands r0, r7, #0x80
    beq .L_90
    add r0, r5, r8
    sub r1, r4, r8
    bl func_0206a84c
    cmp r0, #0x0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_90:
    ldr r1, _LIT0
    add r0, r5, #0x1
    mov r2, #0x4
    bl func_020a734c
    cmp r0, #0x0
    addeq sp, sp, #0x10
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    add r7, sp, #0x4
    add r3, sp, #0x8
    mov r0, r6
    mov r1, r5
    mov r2, r4
    str r7, [sp]
    bl func_0206a6b0
    ldrh r2, [sp, #0x4]
    ldr r1, [sp, #0x8]
    mov r0, r6
    bl func_02068454
    mov r7, r0
    bl func_0206840c
    cmp r0, #0x0
    addne sp, sp, #0x10
    mvnne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    mov ip, #0x1
    mov r0, r6
    mov r1, r7
    mov r2, r5
    mov r3, r4
    str ip, [sp]
    bl func_0206a3d8
    mov r4, r0
    mov r0, r6
    mov r1, r7
    bl func_0206b764
    mov r0, r4
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_02101cec
