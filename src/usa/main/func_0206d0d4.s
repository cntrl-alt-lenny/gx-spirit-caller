; func_0206d0d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206caf8
        .extern func_0206cc98
        .extern func_0206d03c
        .global func_0206d0d4
        .arm
func_0206d0d4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    ldr r5, [sp, #0x28]
    mov r7, r0
    ands r0, r5, #0x2
    ldr r5, [r7, #0x64]
    beq .L_28
    cmp r5, #0x0
    movne r6, #0x1
    bne .L_2c
.L_28:
    mov r6, #0x0
.L_2c:
    cmp r6, #0x0
    ldrnesb r4, [r5, #0xfe]
    movne r0, #0x1
    strneb r0, [r5, #0xfe]
    ldrsb r0, [r7, #0x73]
    cmp r0, #0x1
    bne .L_68
    ldr r0, [sp, #0x20]
    ldr ip, [sp, #0x24]
    str r0, [sp]
    mov r0, r7
    str ip, [sp, #0x4]
    bl func_0206caf8
    mov r8, r0
    b .L_90
.L_68:
    ldr r0, [sp, #0x20]
    ldr ip, [sp, #0x24]
    str r0, [sp]
    mov r0, r7
    str ip, [sp, #0x4]
    bl func_0206d03c
    movs r8, r0
    bmi .L_90
    mov r0, r7
    bl func_0206cc98
.L_90:
    cmp r6, #0x0
    strneb r4, [r5, #0xfe]
    mov r0, r8
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
