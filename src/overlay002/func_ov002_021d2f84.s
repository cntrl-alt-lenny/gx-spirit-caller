; func_ov002_021d2f84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd73c
        .extern data_ov002_022ce950
        .extern func_ov002_021afb90
        .extern func_ov002_021b0c04
        .extern func_ov002_021b1fe8
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021d2f84
        .arm
func_ov002_021d2f84:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r4, #0x1
    ldr r1, [r0, #0x810]
    moveq r4, #0x0
    ldrh r2, [r0, #0x2]
    cmp r1, #0x0
    ldrh r6, [r0, #0x4]
    ldrh r7, [r0, #0x6]
    beq .L_23c
    cmp r1, #0x1
    beq .L_260
    b .L_2f8
.L_23c:
    mov r1, r4
    mov r0, #0x41
    mov r3, #0x0
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_260:
    mov r0, #0x41
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r1, r4
    mov r2, r6
    mov r3, r7
    mov r0, #0x35
    bl func_ov002_0229ade0
    cmp r7, #0x0
    mov r8, #0x0
    ble .L_2e4
    ldr r4, _LIT1
    mov r5, #0x3
.L_298:
    mov r0, r8
    bl func_ov002_021afb90
    mov r9, r0
    mov r0, r8
    bl func_ov002_021afb90
    ldr r1, [r9]
    mov r2, r1, lsl #0x12
    ldr r1, [r0]
    mov r0, r6
    mov r1, r1, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r1, r1, lsl #0x1
    add r3, r1, r2, lsr #0x1f
    mov r1, r5
    mov r2, r4
    bl func_ov002_021b1fe8
    add r8, r8, #0x1
    cmp r8, r7
    blt .L_298
.L_2e4:
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2f8:
    mov r0, #0x35
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT2
    ldr r0, [r0, #0x4]
    cmp r4, r0
    bne .L_324
    mov r0, #0x23
    mov r1, #0x1
    bl func_ov002_021b0c04
.L_324:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word 0x000012e5
_LIT2: .word data_ov002_022cd73c
