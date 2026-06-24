; func_02077de4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02077ef0
        .extern func_02094688
        .global func_02077de4
        .arm
func_02077de4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r8, r0
    ldr r3, [r8, #0x10]
    mov r6, r2
    add r0, r3, r6, lsl #0x3
    str r0, [r8, #0x10]
    ldr r0, [r8, #0x10]
    mov r2, r3, lsr #0x3
    cmp r0, r6, lsl #0x3
    ldrcc r0, [r8, #0x14]
    and r4, r2, #0x3f
    addcc r0, r0, #0x1
    strcc r0, [r8, #0x14]
    ldr r0, [r8, #0x14]
    rsb r5, r4, #0x40
    add r0, r0, r6, lsr #0x1d
    mov r7, r1
    str r0, [r8, #0x14]
    cmp r6, r5
    bcc .L_a0
    add r1, r8, #0x18
    mov r0, r7
    mov r2, r5
    add r1, r1, r4
    bl func_02094688
    mov r0, r8
    add r1, r8, #0x18
    mov r4, #0x0
    bl func_02077ef0
    add r0, r5, #0x3f
    cmp r0, r6
    bcs .L_a4
.L_80:
    mov r0, r8
    add r1, r7, r5
    bl func_02077ef0
    add r5, r5, #0x40
    add r0, r5, #0x3f
    cmp r0, r6
    bcc .L_80
    b .L_a4
.L_a0:
    mov r5, #0x0
.L_a4:
    add r1, r8, #0x18
    add r0, r7, r5
    add r1, r1, r4
    sub r2, r6, r5
    bl func_02094688
    ldmia sp!, {r4, r5, r6, r7, r8, lr}
    bx lr
