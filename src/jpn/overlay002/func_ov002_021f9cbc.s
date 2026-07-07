; func_ov002_021f9cbc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae5f0
        .extern func_ov002_021b9d20
        .extern func_ov002_021d90f0
        .extern func_ov002_022576f4
        .global func_ov002_021f9cbc
        .arm
func_ov002_021f9cbc:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r1, _LIT0
    mov r6, r0
    ldr r0, [r1, #0x5b4]
    cmp r0, #0x0
    beq .L_13c
    cmp r0, #0x1
    beq .L_1d4
    b .L_208
.L_13c:
    ldrh r0, [r6, #0x2]
    mov r2, r0, lsl #0x1f
    mov r1, r0, lsl #0x1a
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b9d20
    mov r5, r0
    cmp r5, #0x1
    mov r4, #0x1
    ble .L_184
.L_164:
    mov r0, r6
    strh r4, [r6, #0xc]
    bl func_ov002_022576f4
    cmp r0, #0x0
    bne .L_184
    add r4, r4, #0x1
    cmp r4, r5
    blt .L_164
.L_184:
    ldrh r1, [r6, #0x2]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    ldreq r0, _LIT2
    streq r5, [r0, #0xd44]
    beq .L_1bc
    ldr r0, _LIT3
    mov r2, r4
    mov r3, r5
    add r1, r0, #0x1
    bl func_ov002_021ae5f0
.L_1bc:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, r5, r6, pc}
.L_1d4:
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
    bl func_ov002_021d90f0
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
.L_208:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd664
_LIT2: .word data_ov002_022d008c
_LIT3: .word 0x0000013d
