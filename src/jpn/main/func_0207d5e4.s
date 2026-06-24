; func_0207d5e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0207d6a4
        .global func_0207d5e4
        .arm
func_0207d5e4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x4
    add r0, r0, #0x24
    ldrh r4, [r0, #0x12]
    mov r3, r1
    ldr r5, [r0]
    and r1, r4, #0x1
    mov r1, r1, lsl #0x10
    movs r1, r1, lsr #0x10
    moveq r6, #0x1
    mov r1, #0x0
    movne r6, #0x0
    mov lr, r1
    cmp r5, #0x0
    mvn r4, #0x0
    beq .L_244
    sub ip, r2, #0x1
    mvn r2, ip
.L_1f4:
    add r8, r5, #0x10
    add r7, ip, r8
    and r9, r2, r7
    sub r7, r9, r8
    ldr r8, [r5, #0x4]
    add r7, r3, r7
    cmp r8, r7
    bcc .L_238
    cmp r4, r8
    bls .L_238
    mov r1, r5
    mov r4, r8
    mov lr, r9
    cmp r6, #0x0
    bne .L_244
    cmp r8, r3
    beq .L_244
.L_238:
    ldr r5, [r5, #0xc]
    cmp r5, #0x0
    bne .L_1f4
.L_244:
    cmp r1, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, pc}
    mov r4, #0x0
    mov r2, lr
    str r4, [sp]
    bl func_0207d6a4
    add sp, sp, #0x4
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
