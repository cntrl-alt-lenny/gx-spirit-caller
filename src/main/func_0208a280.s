; func_0208a280 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020878c4
        .extern func_020879a4
        .extern func_020879fc
        .extern func_02087a08
        .extern func_02087ce8
        .extern func_02087e2c
        .extern func_02087e90
        .extern func_0208a09c
        .global func_0208a280
        .arm
func_0208a280:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    mov r7, r2
    mov r2, r3
    ldr r6, [sp, #0x20]
    mov r4, r0
    mov r8, r1
    bl func_02087a08
    movs r5, r0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r8
    mov r1, r5
    bl func_020878c4
    add ip, sp, #0x4
    mov r2, r0
    mov r0, r7
    mov r1, #0x6
    mov r3, #0x0
    str ip, [sp]
    bl func_0208a09c
    cmp r0, #0x0
    beq .L_680
    mov r0, r5
    bl func_020879fc
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_680:
    ldr ip, [sp, #0x24]
    ldr r2, [r6]
    ldr r1, [ip, #0x18]
    ldr r3, [sp, #0x4]
    mov r0, r5
    add r1, ip, r1
    bl func_020879a4
    ldrb r1, [r6, #0x6]
    mov r0, r4
    bl func_02087e90
    ldrb r1, [r6, #0x7]
    mov r0, r4
    bl func_02087e2c
    ldr r1, [sp, #0x28]
    ldr r2, [sp, #0x2c]
    mov r0, r4
    bl func_02087ce8
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
