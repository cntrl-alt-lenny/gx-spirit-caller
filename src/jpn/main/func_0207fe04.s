; func_0207fe04 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207ff10
        .global func_0207fe04
        .arm
func_0207fe04:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    add r5, sp, #0x0
    mov r4, #0x0
    str r4, [r5]
    str r4, [r5, #0x4]
    mov r8, r2
    ldr r2, [sp, #0x28]
    mov r5, r0
    mov r9, r1
    mov r4, r3
    cmp r2, #0x0
    mov r7, #0x1
    beq .L_68
    add r6, sp, #0x28
.L_3c:
    mov r0, r9
    mov r1, r8
    mov r3, r6
    bl func_0207ff10
    ldr r1, [sp]
    ldr r2, [sp, #0x28]
    cmp r0, r1
    strgt r0, [sp]
    add r7, r7, #0x1
    cmp r2, #0x0
    bne .L_3c
.L_68:
    ldr r0, [r9]
    sub r2, r7, #0x1
    ldrsb r1, [r0, #0x1]
    ldr r0, [sp]
    add r1, r4, r1
    mul r1, r2, r1
    sub r1, r1, r4
    str r1, [sp, #0x4]
    str r0, [r5]
    str r1, [r5, #0x4]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
