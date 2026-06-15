; func_02053d10 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02053b38
        .extern func_02053ba4
        .extern func_020540d0
        .extern func_020b3870
        .global func_02053d10
        .arm
func_02053d10:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov ip, #0x1
    movs r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    str ip, [sp, #0x8]
    beq .L_5cc
    ldr r8, [r7]
    cmp r8, #0x0
    bne .L_5d8
.L_5cc:
    add sp, sp, #0x10
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_5d8:
    ldr r1, [sp, #0x28]
    cmp r1, #0x0
    beq .L_610
    mov r1, r4
    bl func_020540d0
    add r1, sp, #0x8
    str r5, [sp]
    str r1, [sp, #0x4]
    mov r1, r0
    ldr r3, [r7, #0x8]
    mov r0, r6
    sub r2, r8, r4
    bl func_02053b38
    b .L_630
.L_610:
    mov r1, r4
    bl func_020540d0
    str r5, [sp]
    mov r1, r0
    ldr r3, [r7, #0x8]
    mov r0, r6
    sub r2, r8, r4
    bl func_02053ba4
.L_630:
    cmp r0, #0x0
    beq .L_65c
    ldr r1, [sp, #0x8]
    cmp r1, #0x0
    beq .L_65c
    ldr r2, [r7, #0x14]
    ldr r1, [r7, #0x8]
    sub r0, r0, r2
    bl func_020b3870
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_65c:
    mvn r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
