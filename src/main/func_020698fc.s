; func_020698fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02068480
        .extern func_020684c8
        .extern func_0206a44c
        .extern func_0206a724
        .extern func_0206b644
        .extern func_0206b6fc
        .extern func_0206b7d8
        .global func_020698fc
        .arm
func_020698fc:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov r6, r2
    cmp r6, #0x5
    mov r8, r0
    mov r7, r1
    addlt sp, sp, #0x10
    movlt r0, #0x4
    ldmltia sp!, {r4, r5, r6, r7, r8, pc}
    add r4, sp, #0x4
    add r3, sp, #0x8
    str r4, [sp]
    bl func_0206a724
    ldrh r2, [sp, #0x4]
    ldr r1, [sp, #0x8]
    mov r0, r8
    bl func_0206b6fc
    mov r4, r0
    mvn r0, #0x0
    cmp r4, r0
    bne .L_a04
    ldrh r2, [sp, #0x4]
    ldr r1, [sp, #0x8]
    mov r0, r8
    bl func_020684c8
    mov r5, r0
    bl func_02068480
    cmp r0, #0x0
    beq .L_a14
    add sp, sp, #0x10
    mov r0, #0x5
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_a04:
    mov r0, r8
    mov r1, r4
    bl func_0206b644
    mov r5, r0
.L_a14:
    mov ip, #0x0
    mov r0, r8
    mov r1, r5
    mov r2, r7
    mov r3, r6
    str ip, [sp]
    bl func_0206a44c
    cmp r0, #0x0
    addlt sp, sp, #0x10
    movlt r0, #0x4
    ldmltia sp!, {r4, r5, r6, r7, r8, pc}
    mvn r0, #0x0
    cmp r4, r0
    bne .L_a58
    mov r0, r8
    mov r1, r5
    bl func_0206b7d8
.L_a58:
    ldr r3, [r8, #0x494]
    ldr r4, [r8, #0x488]
    mov r0, r8
    mov r2, r5
    mov r1, #0x1
    blx r4
    mov r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
