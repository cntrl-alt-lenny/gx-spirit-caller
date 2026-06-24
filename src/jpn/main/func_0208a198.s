; func_0208a198 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020877dc
        .extern func_020878bc
        .extern func_02087914
        .extern func_02087920
        .extern func_02087c00
        .extern func_02087d44
        .extern func_02087da8
        .extern func_02089fb4
        .global func_0208a198
        .arm
func_0208a198:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r7, r2
    mov r2, r3
    ldr r6, [sp, #0x20]
    mov r4, r0
    mov r8, r1
    bl func_02087920
    movs r5, r0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r8
    mov r1, r5
    bl func_020877dc
    add ip, sp, #0x4
    mov r2, r0
    mov r0, r7
    mov r1, #0x6
    mov r3, #0x0
    str ip, [sp]
    bl func_02089fb4
    cmp r0, #0x0
    beq .L_74
    mov r0, r5
    bl func_02087914
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_74:
    ldr ip, [sp, #0x24]
    ldr r2, [r6]
    ldr r1, [ip, #0x18]
    ldr r3, [sp, #0x4]
    mov r0, r5
    add r1, ip, r1
    bl func_020878bc
    ldrb r1, [r6, #0x6]
    mov r0, r4
    bl func_02087da8
    ldrb r1, [r6, #0x7]
    mov r0, r4
    bl func_02087d44
    ldr r1, [sp, #0x28]
    ldr r2, [sp, #0x2c]
    mov r0, r4
    bl func_02087c00
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
