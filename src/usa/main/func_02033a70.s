; func_02033a70 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0204969c
        .extern func_02049734
        .global func_02033a70
        .arm
func_02033a70:
    stmdb sp!, {r4, r5, lr}
    sub sp, sp, #0xc
    mov r5, r1
    mov r1, #0x0
    str r1, [sp, #0x8]
    movs r4, r2
    movne lr, r4
    ldrb r0, [r0]
    moveq lr, #0x0
    add r1, sp, #0x5
    cmp r0, #0x1
    add r2, sp, #0x4
    bne .L_44
    mov r0, r3
    mov r3, lr
    bl func_02049734
    b .L_58
.L_44:
    add ip, sp, #0x8
    mov r0, r3
    mov r3, lr
    str ip, [sp]
    bl func_0204969c
.L_58:
    ldr r1, [sp, #0x18]
    mov r2, #0x1
    tst r1, r2, lsl r0
    beq .L_94
    strb r0, [r5, #0x1]
    ldrb r0, [sp, #0x5]
    cmp r4, #0x0
    strb r0, [r5, #0x2]
    ldrb r0, [sp, #0x4]
    strb r0, [r5, #0x3]
    ldrne r0, [sp, #0x8]
    add sp, sp, #0xc
    strne r0, [r4, #0x100]
    mov r0, #0x1
    ldmia sp!, {r4, r5, pc}
.L_94:
    mov r0, #0x0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, pc}
