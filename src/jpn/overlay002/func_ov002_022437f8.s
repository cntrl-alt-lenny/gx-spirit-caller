; func_ov002_022437f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern func_ov002_021ae3a4
        .extern func_ov002_021ff410
        .extern func_ov002_0223f938
        .global func_ov002_022437f8
        .arm
func_ov002_022437f8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    mov r5, r1
    bl func_ov002_021ff410
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0xc]
    cmp r0, #0x0
    bne .L_1e4
    ldr r1, _LIT0
    ldr r0, [r1, #0x5b8]
    cmp r0, #0x0
    beq .L_170
    cmp r0, #0x1
    beq .L_1bc
    b .L_1e4
.L_170:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_19c
    ldr r0, _LIT2
    mov r1, #0x1
    str r1, [r0, #0xd44]
    b .L_1a4
.L_19c:
    mov r0, #0x2f
    bl func_ov002_021ae3a4
.L_1a4:
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, r4, r5, pc}
.L_1bc:
    ldr r0, _LIT2
    ldr r0, [r0, #0xd44]
    cmp r0, #0x0
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, #0x0
    str r0, [r1, #0x5b8]
    mov r1, #0x1
    strh r1, [r4, #0xc]
    ldmia sp!, {r3, r4, r5, pc}
.L_1e4:
    mov r0, r4
    mov r1, r5
    bl func_ov002_0223f938
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd664
_LIT2: .word data_ov002_022d008c
