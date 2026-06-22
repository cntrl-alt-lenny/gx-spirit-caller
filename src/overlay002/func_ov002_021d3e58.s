; func_ov002_021d3e58 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a6
        .extern func_ov002_021b1f20
        .extern func_ov002_021b212c
        .extern func_ov002_021b9dd4
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021d3e58
        .arm
func_ov002_021d3e58:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r0, _LIT0
    ldr r1, _LIT0
    ldrh r0, [r0]
    ldrh r4, [r1, #0x2]
    tst r0, #0x8000
    movne r5, #0x1
    moveq r5, #0x0
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b9dd4
    movs r6, r0
    beq .L_a18
    ldr r0, _LIT0
    ldrh r0, [r0, #0x4]
    cmp r6, r0
    ble .L_a20
.L_a18:
    ldr r0, _LIT0
    ldrh r6, [r0, #0x4]
.L_a20:
    ldr r0, _LIT1
    and r2, r5, #0x1
    mov r1, #0x14
    mul r0, r2, r0
    ldr r3, _LIT2
    mul r2, r4, r1
    add r1, r3, r0
    add r1, r1, r2
    ldr r1, [r1, #0x30]
    mov r1, r1, lsl #0x13
    movs r1, r1, lsr #0x13
    bne .L_a64
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_a64:
    ldr r1, _LIT0
    ldr r1, [r1, #0x810]
    cmp r1, #0x0
    beq .L_a84
    cmp r1, #0x1
    beq .L_ae0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_a84:
    ldr r3, _LIT3
    ldr r1, _LIT4
    add r0, r3, r0
    ldrh r0, [r2, r0]
    mov r2, #0x1
    bl func_ov002_021b212c
    ldr r3, _LIT4
    mov r0, r5
    mov r1, r4
    mov r2, #0x3
    str r6, [sp]
    bl func_ov002_021b1f20
    mov r1, r5
    mov r2, r4
    mov r3, r6
    mov r0, #0x26
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    add sp, sp, #0x4
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_ae0:
    mov r0, #0x26
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cf1a6
_LIT4: .word 0x00001130
