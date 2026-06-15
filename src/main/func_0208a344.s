; func_0208a344 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020878c4
        .extern func_020879a4
        .extern func_020879fc
        .extern func_02087a08
        .extern func_02087d10
        .extern func_02087e2c
        .extern func_02087e90
        .extern func_0208a09c
        .extern func_0208a1e4
        .global func_0208a344
        .arm
func_0208a344:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r8, r2
    mov r2, r3
    ldr r5, [sp, #0x28]
    mov r6, r0
    mov r7, r1
    bl func_02087a08
    movs r4, r0
    addeq sp, sp, #0x10
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r7
    mov r1, r4
    bl func_020878c4
    mov r7, r0
    add ip, sp, #0x8
    mov r0, r8
    mov r2, r7
    mov r1, #0x6
    mov r3, #0x0
    str ip, [sp]
    bl func_0208a09c
    cmp r0, #0x0
    beq .L_748
    mov r0, r4
    bl func_020879fc
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_748:
    ldr r0, [sp, #0x2c]
    add ip, sp, #0x4
    mov r2, r7
    mov r1, #0x1
    mov r3, #0x0
    str ip, [sp]
    bl func_0208a1e4
    cmp r0, #0x0
    beq .L_780
    mov r0, r4
    bl func_020879fc
    add sp, sp, #0x10
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_780:
    ldr r2, [sp, #0x4]
    ldr r3, [sp, #0x8]
    ldr r1, [r2, #0x18]
    mov r0, r4
    add r1, r2, r1
    mov r2, #0x0
    bl func_020879a4
    ldrb r1, [r5, #0x6]
    mov r0, r6
    bl func_02087e90
    ldrb r1, [r5, #0x7]
    mov r0, r6
    bl func_02087e2c
    ldr r1, [sp, #0x2c]
    mov r0, r6
    bl func_02087d10
    mov r0, #0x1
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
