; func_02059f38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02100780
        .extern func_020453e8
        .extern func_020560a8
        .extern func_02058528
        .extern func_0205a0ec
        .extern func_0205b7a8
        .extern func_0205bd58
        .extern func_0205be60
        .extern func_0205d6bc
        .extern func_0205ffc0
        .global func_02059f38
        .arm
func_02059f38:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x20
    mov r8, r0
    ldr r0, [r8]
    mov r4, #0x0
    str r4, [sp, #0x10]
    ldr r5, [sp, #0x38]
    cmp r2, #0x1
    ldr r0, [r0, #0x100]
    moveq r4, #0x1
    cmp r0, #0x0
    moveq r4, #0x0
    mov r7, r1
    mov r6, r3
    cmp r5, #0x0
    beq .L_1fc8
    cmp r4, #0x0
    beq .L_1fc8
    add r2, sp, #0xc
    mov r0, r8
    mov r1, r7
    bl func_0205d6bc
    cmp r0, #0x0
    beq .L_1fc8
    ldr r0, [sp, #0xc]
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    beq .L_1fc8
    mov r0, #0x204
    bl func_020453e8
    movs r4, r0
    bne .L_1f30
    ldr r1, _LIT0
    mov r0, r8
    bl func_0205ffc0
    add sp, sp, #0x20
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1f30:
    ldr r0, [sp, #0xc]
    mov r1, r4
    ldr r0, [r0, #0xc]
    bl func_0205b7a8
    mov r2, #0x0
    str r2, [r4]
    str r7, [r4, #0x4]
    ldr r7, [sp, #0x3c]
    str r5, [sp, #0x14]
    str r7, [sp, #0x18]
    mov r0, #0x1
    str r0, [sp]
    str r5, [sp, #0x4]
    add r3, sp, #0x10
    mov r0, r8
    mov r1, #0x2
    str r7, [sp, #0x8]
    bl func_0205be60
    cmp r0, #0x0
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r2, [sp, #0x10]
    mov r0, #0x0
    ldr r5, [r2, #0x18]
    add r1, sp, #0x14
    str r2, [sp]
    str r0, [sp, #0x4]
    mov r0, r8
    mov r3, r4
    ldmia r1, {r1, r2}
    bl func_02058528
    cmp r0, #0x0
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, [sp, #0x10]
    mov r0, r8
    bl func_0205bd58
    b .L_201c
.L_1fc8:
    str r6, [sp]
    ldr r4, [sp, #0x3c]
    str r5, [sp, #0x4]
    add r3, sp, #0x10
    mov r0, r8
    mov r1, #0x2
    mov r2, #0x0
    str r4, [sp, #0x8]
    bl func_0205be60
    cmp r0, #0x0
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, [sp, #0x10]
    mov r0, r8
    ldr r5, [r1, #0x18]
    mov r1, r7
    mov r2, r5
    bl func_0205a0ec
    cmp r0, #0x0
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_201c:
    cmp r6, #0x0
    beq .L_203c
    mov r0, r8
    mov r1, r5
    bl func_020560a8
    cmp r0, #0x0
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_203c:
    mov r0, #0x0
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_02100780
