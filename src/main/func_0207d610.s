; func_0207d610 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207d78c
        .global func_0207d610
        .arm
func_0207d610:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    add r0, r0, #0x24
    ldrh r4, [r0, #0x12]
    mov r3, r1
    mvn lr, #0x0
    and r1, r4, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    moveq r5, #0x1
    mov r1, #0x0
    ldr r4, [r0, #0x4]
    movne r5, #0x0
    mov ip, r1
    cmp r4, #0x0
    beq .L_1c8
    sub r2, r2, #0x1
    mvn r2, r2
.L_17c:
    ldr r8, [r4, #0x4]
    add r9, r4, #0x10
    add r6, r8, r9
    sub r6, r6, r3
    and r7, r2, r6
    subs r6, r7, r9
    bmi .L_1bc
    cmp lr, r8
    bls .L_1bc
    mov r1, r4
    mov lr, r8
    mov ip, r7
    cmp r5, #0x0
    bne .L_1c8
    cmp r8, r3
    beq .L_1c8
.L_1bc:
    ldr r4, [r4, #0x8]
    cmp r4, #0x0
    bne .L_17c
.L_1c8:
    cmp r1, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    mov r4, #0x1
    mov r2, ip
    str r4, [sp]
    bl func_0207d78c
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
