; func_02059ec4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021006a0
        .extern func_02045398
        .extern func_02056034
        .extern func_020584b4
        .extern func_0205a078
        .extern func_0205b734
        .extern func_0205bce4
        .extern func_0205bdec
        .extern func_0205d648
        .extern func_0205ff4c
        .global func_02059ec4
        .arm
func_02059ec4:
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
    beq .L_130
    cmp r4, #0x0
    beq .L_130
    add r2, sp, #0xc
    mov r0, r8
    mov r1, r7
    bl func_0205d648
    cmp r0, #0x0
    beq .L_130
    ldr r0, [sp, #0xc]
    ldr r0, [r0, #0xc]
    cmp r0, #0x0
    beq .L_130
    mov r0, #0x204
    bl func_02045398
    movs r4, r0
    bne .L_98
    ldr r1, _LIT0
    mov r0, r8
    bl func_0205ff4c
    add sp, sp, #0x20
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_98:
    ldr r0, [sp, #0xc]
    mov r1, r4
    ldr r0, [r0, #0xc]
    bl func_0205b734
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
    bl func_0205bdec
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
    bl func_020584b4
    cmp r0, #0x0
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, [sp, #0x10]
    mov r0, r8
    bl func_0205bce4
    b .L_184
.L_130:
    str r6, [sp]
    ldr r4, [sp, #0x3c]
    str r5, [sp, #0x4]
    add r3, sp, #0x10
    mov r0, r8
    mov r1, #0x2
    mov r2, #0x0
    str r4, [sp, #0x8]
    bl func_0205bdec
    cmp r0, #0x0
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r1, [sp, #0x10]
    mov r0, r8
    ldr r5, [r1, #0x18]
    mov r1, r7
    mov r2, r5
    bl func_0205a078
    cmp r0, #0x0
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_184:
    cmp r6, #0x0
    beq .L_1a4
    mov r0, r8
    mov r1, r5
    bl func_02056034
    cmp r0, #0x0
    addne sp, sp, #0x20
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_1a4:
    mov r0, #0x0
    add sp, sp, #0x20
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_021006a0
