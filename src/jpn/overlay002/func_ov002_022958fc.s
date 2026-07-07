; func_ov002_022958fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021be2a4
        .extern func_ov002_021c4bbc
        .extern func_ov002_02259e8c
        .global func_ov002_022958fc
        .arm
func_ov002_022958fc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0x2c
    mov r8, r0
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02259e8c
    cmp r0, #0x0
    beq .L_e8
    ldrh r0, [r8, #0x2]
    mov r2, #0x1
    mov r3, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r3, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021be2a4
    cmp r0, #0x0
    beq .L_e8
    mov r6, #0x0
    ldr r5, _LIT0
    ldr r9, _LIT1
    mov r7, r6
    add r4, sp, #0x0
.L_5c:
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r2, r0, #0x1
    mla r1, r2, r9, r5
    add r1, r1, r7
    ldr r1, [r1, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    beq .L_d8
    mov r1, r6
    mov r2, r4
    bl func_ov002_021c4bbc
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r1, r0, #0x1
    mla r0, r1, r9, r5
    add r0, r7, r0
    ldrh r0, [r0, #0x36]
    cmp r0, #0x0
    ldrne r0, [sp, #0x18]
    ldreq r0, [sp, #0x14]
    cmp r0, #0x3e8
    blt .L_d8
    cmp r0, #0x7d0
    addlt sp, sp, #0x2c
    movlt r0, #0x1
    ldmltia sp!, {r4, r5, r6, r7, r8, r9, pc}
.L_d8:
    add r6, r6, #0x1
    cmp r6, #0x4
    add r7, r7, #0x14
    ble .L_5c
.L_e8:
    mov r0, #0x0
    add sp, sp, #0x2c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
