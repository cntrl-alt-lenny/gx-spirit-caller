; func_0207fe9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0207fe9c
        .arm
func_0207fe9c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x10
    str r2, [sp]
    add r3, sp, #0x4
    mov r2, #0x0
    str r2, [r3]
    mov r8, r0
    str r2, [r3, #0x4]
    ldr r7, [r8, #0x4]
    add r0, sp, #0x0
    mov r5, r1
    mov r4, #0x1
    blx r7
    cmp r0, #0x0
    beq .L_f0
    add r6, sp, #0x0
.L_d8:
    cmp r0, #0xa
    mov r0, r6
    addeq r4, r4, #0x1
    blx r7
    cmp r0, #0x0
    bne .L_d8
.L_f0:
    ldr r0, [r8]
    ldrsb r0, [r0, #0x1]
    add r0, r5, r0
    mul r0, r4, r0
    sub r0, r0, r5
    add sp, sp, #0x10
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
