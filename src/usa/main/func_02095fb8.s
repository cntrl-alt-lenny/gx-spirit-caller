; func_02095fb8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02092800
        .extern func_020951dc
        .extern func_020951f0
        .global func_02095fb8
        .arm
func_02095fb8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r0
    bl func_020951f0
    add r5, r7, #0x18
    mov r6, #0x0
    mov r8, #0x8
    mov r4, #0x3c
.L_1c:
    add r1, r7, r6, lsl #0x3
    ldr r0, [r1, #0x18]
    cmp r0, #0x0
    beq .L_84
    ldr r3, [r0, #0x18]
    cmp r5, r3
    bne .L_4c
    ldr r2, [r1, #0x1c]
    mov r1, r4
    str r2, [r0, #0x18]
    bl func_02092800
    b .L_84
.L_4c:
    cmp r3, #0x0
    beq .L_6c
.L_54:
    ldr r0, [r3, #0x4]
    cmp r5, r0
    beq .L_6c
    mov r3, r0
    cmp r0, #0x0
    bne .L_54
.L_6c:
    add r0, r7, r6, lsl #0x3
    ldr r2, [r0, #0x1c]
    mov r0, r3
    mov r1, r8
    str r2, [r3, #0x4]
    bl func_02092800
.L_84:
    add r6, r6, #0x1
    cmp r6, #0x4
    add r5, r5, #0x8
    blt .L_1c
    bl func_020951dc
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
