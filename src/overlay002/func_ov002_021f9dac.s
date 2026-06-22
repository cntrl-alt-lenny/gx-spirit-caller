; func_ov002_021f9dac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern func_ov002_021ae6d0
        .extern func_ov002_021b9e00
        .extern func_ov002_021d91e0
        .extern func_ov002_022577dc
        .global func_ov002_021f9dac
        .arm
func_ov002_021f9dac:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r6, r0
    ldr r0, [r1, #0x5b4]
    cmp r0, #0x0
    beq .L_458
    cmp r0, #0x1
    beq .L_4f0
    b .L_524
.L_458:
    ldrh r0, [r6, #0x2]
    mov r2, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b9e00
    mov r5, r0
    cmp r5, #0x1
    mov r4, #0x1
    ble .L_4a0
.L_480:
    mov r0, r6
    strh r4, [r6, #0xc]
    bl func_ov002_022577dc
    cmp r0, #0x0
    bne .L_4a0
    add r4, r4, #0x1
    cmp r4, r5
    blt .L_480
.L_4a0:
    ldrh r1, [r6, #0x2]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    ldreq r0, _LIT2
    streq r5, [r0, #0xd44]
    beq .L_4d8
    ldr r0, _LIT3
    mov r2, r4
    mov r3, r5
    add r1, r0, #0x1
    bl func_ov002_021ae6d0
.L_4d8:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, pc}
.L_4f0:
    ldr r0, _LIT2
    ldr r1, [r0, #0xd44]
    strh r1, [r6, #0xc]
    ldrh r1, [r6, #0x2]
    ldr r2, [r0, #0xd44]
    mov r0, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    rsb r2, r2, #0x0
    bl func_ov002_021d91e0
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_524:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cd744
_LIT2: .word data_ov002_022d016c
_LIT3: .word 0x0000013d
