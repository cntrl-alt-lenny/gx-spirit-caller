; func_0208a25c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020877dc
        .extern func_020878bc
        .extern func_02087914
        .extern func_02087920
        .extern func_02087c28
        .extern func_02087d44
        .extern func_02087da8
        .extern func_02089fb4
        .extern func_0208a0fc
        .global func_0208a25c
        .arm
func_0208a25c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r8, r2
    mov r2, r3
    ldr r5, [sp, #0x28]
    mov r6, r0
    mov r7, r1
    bl func_02087920
    movs r4, r0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r7
    mov r1, r4
    bl func_020877dc
    mov r7, r0
    add ip, sp, #0x8
    mov r0, r8
    mov r2, r7
    mov r1, #0x6
    mov r3, #0x0
    str ip, [sp]
    bl func_02089fb4
    cmp r0, #0x0
    beq .L_78
    mov r0, r4
    bl func_02087914
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_78:
    ldr r0, [sp, #0x2c]
    add ip, sp, #0x4
    mov r2, r7
    mov r1, #0x1
    mov r3, #0x0
    str ip, [sp]
    bl func_0208a0fc
    cmp r0, #0x0
    beq .L_b0
    mov r0, r4
    bl func_02087914
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_b0:
    ldr r2, [sp, #0x4]
    ldr r3, [sp, #0x8]
    ldr r1, [r2, #0x18]
    mov r0, r4
    add r1, r2, r1
    mov r2, #0x0
    bl func_020878bc
    ldrb r1, [r5, #0x6]
    mov r0, r6
    bl func_02087da8
    ldrb r1, [r5, #0x7]
    mov r0, r6
    bl func_02087d44
    ldr r1, [sp, #0x2c]
    mov r0, r6
    bl func_02087c28
    mov r0, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
