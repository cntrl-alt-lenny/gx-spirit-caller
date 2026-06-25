; func_0209d194 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_020919a4
        .extern func_020927e4
        .extern func_0209281c
        .extern func_02092928
        .extern func_02093720
        .extern func_02096264
        .extern func_02096318
        .extern func_0209d194
        .global func_0209d194
        .arm
func_0209d194:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0x4
    mov r6, r0
    ldr r0, [r6, #0x114]
    mov r5, r1
    mov r4, r2
    ands r0, r0, #0x2
    bne .L_78
    ldr r1, [r6, #0x114]
    mov r0, #0xb
    orr r2, r1, #0x2
    mov r1, #0x1
    str r2, [r6, #0x114]
    bl func_02096318
    cmp r0, #0x0
    bne .L_68
    mov r9, #0x64
    mov r8, #0xb
    mov r7, #0x1
.L_4c:
    mov r0, r9
    bl func_02093720
    mov r0, r8
    mov r1, r7
    bl func_02096318
    cmp r0, #0x0
    beq .L_4c
.L_68:
    mov r0, r6
    mov r1, #0x0
    mov r2, #0x1
    bl func_0209d194
.L_78:
    ldr r0, [r6]
    mov r1, #0x60
    bl func_0209281c
    bl func_02092928
    mov r9, #0xb
    mov r8, #0x1
    mov r7, #0x0
    mov fp, #0x60
.L_98:
    str r5, [r6, #0x4]
    ldr r0, [r6, #0x114]
    orr r0, r0, #0x20
    str r0, [r6, #0x114]
.L_a8:
    mov r0, r9
    mov r1, r5
    mov r2, r8
    bl func_02096264
    cmp r0, #0x0
    blt .L_a8
    cmp r5, #0x0
    bne .L_e4
    ldr sl, [r6]
.L_cc:
    mov r0, r9
    mov r1, sl
    mov r2, r8
    bl func_02096264
    cmp r0, #0x0
    blt .L_cc
.L_e4:
    bl OS_DisableIrq
    ldr r1, [r6, #0x114]
    mov sl, r0
    ands r0, r1, #0x20
    beq .L_10c
.L_f8:
    mov r0, r7
    bl func_020919a4
    ldr r0, [r6, #0x114]
    ands r0, r0, #0x20
    bne .L_f8
.L_10c:
    mov r0, sl
    bl OS_RestoreIrq
    ldr r0, [r6]
    mov r1, fp
    bl func_020927e4
    ldr r0, [r6]
    ldr r0, [r0]
    cmp r0, #0x4
    bne .L_13c
    sub r4, r4, #0x1
    cmp r4, #0x0
    bgt .L_98
.L_13c:
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    bx lr
