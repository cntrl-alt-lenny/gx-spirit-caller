; func_ov002_022931b0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202b89c
        .extern func_0202de48
        .extern func_0202f994
        .extern func_ov002_021afa94
        .extern func_ov002_0227d18c
        .extern func_ov002_02280594
        .extern func_ov002_0228090c
        .global func_ov002_022931b0
        .arm
func_ov002_022931b0:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldrh r0, [r6, #0x2]
    ldrh r1, [r6]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02280594
    cmp r0, #0x0
    blt .L_f4
    bl func_ov002_021afa94
    mov r4, r0
    ldrh r1, [r6, #0x2]
    ldr r2, [r4]
    mov r0, r1, lsl #0x1f
    mov r3, r2, lsl #0x13
    mov r0, r0, lsr #0x1f
    mov r5, r3, lsr #0x13
    add r1, sp, #0x4
    add r2, sp, #0x0
    rsb r0, r0, #0x1
    mov r3, #0x0
    bl func_ov002_0228090c
    mov r0, r5
    bl func_0202b89c
    ldr r1, _LIT0
    cmp r0, r1
    ble .L_94
    ldr r0, [sp]
    ldr r7, [sp, #0x4]
    cmp r7, r0
    movle r7, r0
    mov r0, r5
    bl func_0202b89c
    cmp r0, r7
    bgt .L_b4
.L_94:
    mov r0, r5
    bl func_0202de48
    cmp r0, #0x0
    beq .L_f4
    mov r0, r5
    bl func_0202f994
    cmp r0, #0x0
    bne .L_f4
.L_b4:
    ldr r1, [r4]
    ldrh r0, [r6, #0x2]
    mov r1, r1, lsl #0x12
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    beq .L_e8
    mov r0, r5
    bl func_ov002_0227d18c
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
.L_e8:
    add sp, sp, #0x8
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_f4:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x000006a4
