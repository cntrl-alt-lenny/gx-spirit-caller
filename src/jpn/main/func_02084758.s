; func_02084758 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02084d24
        .global func_02084758
        .arm
func_02084758:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0x4
    mov r5, r0
    ldr r1, [r5, #0x8]
    ands r0, r1, #0x200
    bne .L_674
    ands r0, r1, #0x1
    beq .L_674
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    ldrneb r4, [r5, #0x8f]
    moveq r4, #0x0
    cmp r4, #0x1
    bne .L_620
    ldr r1, [r5, #0x8]
    mov r0, r5
    bic r1, r1, #0x40
    str r1, [r5, #0x8]
    ldr r1, [r5, #0x18]
    blx r1
    ldr r0, [r5, #0x18]
    cmp r0, #0x0
    ldrneb r4, [r5, #0x8f]
    ldr r0, [r5, #0x8]
    moveq r4, #0x0
    and r0, r0, #0x40
    b .L_624
.L_620:
    mov r0, #0x0
.L_624:
    cmp r0, #0x0
    bne .L_654
    ldr r0, [r5]
    ldrb r0, [r0, #0x1]
    str r0, [sp]
    ldr r0, [r5, #0x8]
    ands r0, r0, #0x100
    bne .L_654
    add r1, sp, #0x0
    mov r0, #0x14
    mov r2, #0x1
    bl func_02084d24
.L_654:
    cmp r4, #0x3
    bne .L_674
    ldr r1, [r5, #0x8]
    mov r0, r5
    bic r1, r1, #0x40
    str r1, [r5, #0x8]
    ldr r1, [r5, #0x18]
    blx r1
.L_674:
    ldr r0, [r5]
    add r0, r0, #0x2
    str r0, [r5]
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, pc}
