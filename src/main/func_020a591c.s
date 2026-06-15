; func_020a591c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern OS_DisableIrq
        .extern OS_RestoreIrq
        .extern func_02091814
        .extern func_0209181c
        .extern func_02091a8c
        .extern func_02091cf8
        .global func_020a591c
        .arm
func_020a591c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    mov r8, r0
    add r9, r8, #0xc4
    mov r4, #0x0
.L_9c:
    bl OS_DisableIrq
    ldr r1, [r8, #0xc0]
    mov r5, r0
    cmp r1, #0x0
    bne .L_d0
.L_b0:
    mov r0, r8
    mov r1, r4
    bl func_0209181c
    mov r0, r4
    bl func_02091a8c
    ldr r0, [r8, #0xc0]
    cmp r0, #0x0
    beq .L_b0
.L_d0:
    ldr r7, [r8, #0xc0]
    ldr r1, [r8, #0xc0]
    mov r0, r8
    ldr r1, [r1]
    str r1, [r8, #0xc0]
    ldr r1, [r7, #0x4]
    mov r1, r1, lsr #0x1
    bl func_0209181c
    mov r0, r5
    bl OS_RestoreIrq
    ldr r1, [r7, #0x8]
    cmp r1, #0x0
    beq .L_10c
    mov r0, r7
    blx r1
.L_10c:
    bl OS_DisableIrq
    mov r6, r0
    mov r0, r8
    ldr r5, [r7, #0xc]
    bl func_02091814
    ldr r1, [r8, #0xc0]
    cmp r1, #0x0
    moveq r1, r4
    beq .L_14c
    ldr r1, [r8, #0xc0]
    ldr r1, [r1, #0x4]
    cmp r0, r1, lsr #0x1
    ldrcc r1, [r8, #0xc0]
    ldrcc r1, [r1, #0x4]
    movcc r1, r1, lsr #0x1
    movcs r1, r0
.L_14c:
    cmp r1, r0
    beq .L_15c
    mov r0, r8
    bl func_0209181c
.L_15c:
    str r4, [r7]
    ldr r0, [r7, #0x4]
    cmp r5, #0x0
    bic r0, r0, #0x1
    str r0, [r7, #0x4]
    beq .L_17c
    mov r0, r7
    blx r5
.L_17c:
    cmp r7, r9
    beq .L_190
    mov r0, r6
    bl OS_RestoreIrq
    b .L_9c
.L_190:
    bl func_02091cf8
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, lr}
    bx lr
