; func_02053c9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02053ac4
        .extern func_02053b30
        .extern func_0205405c
        .extern func_020b377c
        .global func_02053c9c
        .arm
func_02053c9c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    mov ip, #0x1
    movs r7, r0
    mov r6, r1
    mov r5, r2
    mov r4, r3
    str ip, [sp, #0x8]
    beq .L_30
    ldr r8, [r7]
    cmp r8, #0x0
    bne .L_3c
.L_30:
    add sp, sp, #0x10
    mvn r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_3c:
    ldr r1, [sp, #0x28]
    cmp r1, #0x0
    beq .L_74
    mov r1, r4
    bl func_0205405c
    add r1, sp, #0x8
    str r5, [sp]
    str r1, [sp, #0x4]
    mov r1, r0
    ldr r3, [r7, #0x8]
    mov r0, r6
    sub r2, r8, r4
    bl func_02053ac4
    b .L_94
.L_74:
    mov r1, r4
    bl func_0205405c
    str r5, [sp]
    mov r1, r0
    ldr r3, [r7, #0x8]
    mov r0, r6
    sub r2, r8, r4
    bl func_02053b30
.L_94:
    cmp r0, #0x0
    beq .L_c0
    ldr r1, [sp, #0x8]
    cmp r1, #0x0
    beq .L_c0
    ldr r2, [r7, #0x14]
    ldr r1, [r7, #0x8]
    sub r0, r0, r2
    bl func_020b377c
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_c0:
    mvn r0, #0x0
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
