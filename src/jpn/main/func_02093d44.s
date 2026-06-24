; func_02093d44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_01ff8770
        .extern func_020905f4
        .extern func_02093b2c
        .extern func_02093cd4
        .global func_02093d44
        .arm
func_02093d44:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r5, r3
    mov r6, r2
    mov r2, r5
    mov r3, #0x0
    mov r8, r0
    mov r7, r1
    ldr r4, [sp, #0x18]
    bl func_02093b2c
    cmp r5, #0x0
    bne .L_48
    cmp r4, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, lr}
    bxeq lr
    ldr r0, [sp, #0x1c]
    blx r4
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_48:
    mov r0, r8
    bl func_02093cd4
    cmp r4, #0x0
    beq .L_88
    ldr r2, [sp, #0x1c]
    mov r0, r8
    mov r1, r4
    bl func_020905f4
    mov r3, r5, lsr #0x2
    mov r0, r8
    mov r1, r7
    mov r2, r6
    orr r3, r3, #-1006632960
    bl func_01ff8770
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
.L_88:
    mov r3, r5, lsr #0x2
    mov r0, r8
    mov r1, r7
    mov r2, r6
    orr r3, r3, #-2080374784
    bl func_01ff8770
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
