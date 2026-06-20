; func_ov002_022935a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b8f0
        .extern func_0202b920
        .extern func_0202de9c
        .extern func_ov002_021afb74
        .extern func_ov002_022806a4
        .extern func_ov002_02280a1c
        .global func_ov002_022935a0
        .arm
func_ov002_022935a0:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r5, r0
    ldrh r0, [r5, #0x2]
    mov r4, #0x0
    ldrh r1, [r5]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, r4
    rsb r0, r0, #0x1
    bl func_ov002_022806a4
    cmp r0, #0x0
    blt .L_200
    bl func_ov002_021afb74
    ldr r0, [r0]
    mov r0, r0, lsl #0x13
    mov r6, r0, lsr #0x13
    mov r0, r6
    bl func_0202b8f0
    mov r4, r0
    mov r0, r6
    bl func_0202b920
    cmp r4, r0
    mov r0, r6
    ble .L_1f8
    bl func_0202b8f0
    mov r4, r0
    b .L_200
.L_1f8:
    bl func_0202b920
    mov r4, r0
.L_200:
    ldrh r0, [r5, #0x2]
    ldrh r1, [r5]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022806a4
    cmp r0, #0x0
    blt .L_2b8
    bl func_ov002_021afb74
    ldrh r2, [r5, #0x2]
    ldr r3, [r0]
    add r1, sp, #0x4
    mov r0, r2, lsl #0x1f
    mov r5, r3, lsl #0x13
    mov r0, r0, lsr #0x1f
    add r2, sp, #0x0
    rsb r0, r0, #0x1
    mov r3, #0x0
    mov r5, r5, lsr #0x13
    bl func_ov002_02280a1c
    ldr r0, [sp]
    ldr r2, [sp, #0x4]
    cmp r2, r0
    movgt r1, r2
    movle r1, r0
    cmp r4, r1
    bgt .L_278
    cmp r2, r0
    movle r2, r0
    mov r4, r2
.L_278:
    mov r0, r5
    bl func_0202b8f0
    ldr r1, _LIT0
    cmp r0, r1
    ble .L_29c
    mov r0, r5
    bl func_0202b920
    cmp r0, r4
    bge .L_2ac
.L_29c:
    mov r0, r5
    bl func_0202de9c
    cmp r0, #0x1
    bne .L_2b8
.L_2ac:
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_2b8:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word 0x000006a4
