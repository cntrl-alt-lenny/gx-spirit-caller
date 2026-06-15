; func_0207d520 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207d994
        .extern func_0207d9c4
        .extern func_0207d9f4
        .global func_0207d520
        .arm
func_0207d520:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r5, r1
    ldr r2, [r5]
    ldr r1, [r5, #0x4]
    mov r6, r0
    str r2, [sp]
    str r1, [sp, #0x4]
    ldr r1, [r6]
    mov r4, #0x0
    cmp r1, #0x0
    beq .L_b8
    ldr r0, [r5]
.L_78:
    cmp r1, r0
    movcc r4, r1
    bcc .L_ac
    ldr r0, [r5, #0x4]
    cmp r1, r0
    bne .L_b8
    ldr r2, [r1, #0x4]
    add r0, r1, #0x10
    add r2, r2, r0
    mov r0, r6
    str r2, [sp, #0x4]
    bl func_0207d9f4
    b .L_b8
.L_ac:
    ldr r1, [r1, #0xc]
    cmp r1, #0x0
    bne .L_78
.L_b8:
    cmp r4, #0x0
    beq .L_ec
    ldr r2, [r4, #0x4]
    add r1, r4, #0x10
    ldr r0, [r5]
    add r1, r2, r1
    cmp r1, r0
    bne .L_ec
    mov r0, r6
    mov r1, r4
    str r4, [sp]
    bl func_0207d9f4
    mov r4, r0
.L_ec:
    ldr r1, [sp, #0x4]
    ldr r0, [sp]
    sub r0, r1, r0
    cmp r0, #0x10
    addcc sp, sp, #0x8
    movcc r0, #0x0
    ldmccia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT0
    add r0, sp, #0x0
    bl func_0207d994
    mov r1, r0
    mov r0, r6
    mov r2, r4
    bl func_0207d9c4
    mov r0, #0x1
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x00004652
