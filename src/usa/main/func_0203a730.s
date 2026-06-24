; func_0203a730 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203a644
        .extern func_0203a698
        .extern func_0203a6f4
        .extern func_0208904c
        .global func_0203a730
        .arm
func_0203a730:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    mov r0, r1
    mov r7, r2
    bl func_0208904c
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r4]
    mov r5, #0x0
    cmp r0, #0x0
    bls .L_c4
    add r6, r4, #0x4
.L_34:
    ldrb r0, [r6]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_b0
    b .L_54
    b .L_94
    b .L_b0
    b .L_74
.L_54:
    ldr r1, [r6, #0x4]
    mov r0, r8
    mov r2, r7
    bl func_0203a698
    cmp r0, #0x0
    bne .L_b0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_74:
    ldr r1, [r6, #0x4]
    mov r0, r8
    mov r2, r7
    bl func_0203a6f4
    cmp r0, #0x0
    bne .L_b0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_94:
    ldr r1, [r6, #0x4]
    mov r0, r8
    mov r2, r7
    bl func_0203a644
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_b0:
    ldr r0, [r4]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x8
    bcc .L_34
.L_c4:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
