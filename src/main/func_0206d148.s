; func_0206d148 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0206cb6c
        .extern func_0206cd0c
        .extern func_0206d0b0
        .global func_0206d148
        .arm
func_0206d148:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x8
    ldr r5, [sp, #0x28]
    mov r7, r0
    ands r0, r5, #0x2
    ldr r5, [r7, #0x64]
    beq .L_464
    cmp r5, #0x0
    movne r6, #0x1
    bne .L_468
.L_464:
    mov r6, #0x0
.L_468:
    cmp r6, #0x0
    ldrnesb r4, [r5, #0xfe]
    movne r0, #0x1
    strneb r0, [r5, #0xfe]
    ldrsb r0, [r7, #0x73]
    cmp r0, #0x1
    bne .L_4a4
    ldr r0, [sp, #0x20]
    ldr ip, [sp, #0x24]
    str r0, [sp]
    mov r0, r7
    str ip, [sp, #0x4]
    bl func_0206cb6c
    mov r8, r0
    b .L_4cc
.L_4a4:
    ldr r0, [sp, #0x20]
    ldr ip, [sp, #0x24]
    str r0, [sp]
    mov r0, r7
    str ip, [sp, #0x4]
    bl func_0206d0b0
    movs r8, r0
    bmi .L_4cc
    mov r0, r7
    bl func_0206cd0c
.L_4cc:
    cmp r6, #0x0
    strneb r4, [r5, #0xfe]
    mov r0, r8
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
