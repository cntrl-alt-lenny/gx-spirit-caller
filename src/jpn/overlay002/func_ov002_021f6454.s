; func_ov002_021f6454 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae3a4
        .extern func_ov002_022031a0
        .extern func_ov002_0226ad40
        .global func_ov002_021f6454
        .arm
func_ov002_021f6454:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x5b4]
    cmp r2, #0x0
    beq .L_24
    cmp r2, #0x1
    beq .L_b0
    b .L_f0
.L_24:
    ldrh r2, [r4, #0x2]
    mov r2, r2, lsl #0x12
    mov r2, r2, lsr #0x1e
    cmp r2, #0x3
    bne .L_48
    ldr r0, _LIT1
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_98
.L_48:
    bl func_ov002_022031a0
    cmp r0, #0x2
    bne .L_8c
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT2
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_80
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0, #0xd44]
    b .L_98
.L_80:
    ldr r0, _LIT3
    bl func_ov002_021ae3a4
    b .L_98
.L_8c:
    ldr r0, _LIT1
    mov r1, #0x0
    str r1, [r0, #0xd44]
.L_98:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b4]
    add r2, r2, #0x1
    str r2, [r1, #0x5b4]
    ldmia sp!, {r4, pc}
.L_b0:
    ldr r0, _LIT1
    ldr r1, [r0, #0xd44]
    strh r1, [r4, #0x8]
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0x1
    mov r3, r1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r2, #0x0
    bl func_ov002_0226ad40
    mov r0, #0x1
    ldmia sp!, {r4, pc}
.L_f0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d008c
_LIT2: .word data_ov002_022cd664
_LIT3: .word 0x0000010e
