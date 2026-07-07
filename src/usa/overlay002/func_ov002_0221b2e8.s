; func_ov002_0221b2e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021ae584
        .extern func_ov002_021afff0
        .extern func_ov002_0220e65c
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .extern func_ov002_0226b13c
        .global func_ov002_0221b2e8
        .arm
func_ov002_0221b2e8:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x5a8]
    cmp r2, #0x7e
    beq .L_244
    cmp r2, #0x7f
    beq .L_218
    cmp r2, #0x80
    bne .L_260
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_210
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r0, asr #0x8
    mov r0, r4
    and r1, r1, #0xff
    and r2, r2, #0xff
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_210
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_200
    mov r0, #0x2
    bl func_ov002_021afff0
    ldr r1, _LIT2
    str r0, [r1, #0xd44]
    b .L_208
.L_200:
    mov r0, #0x38
    bl func_ov002_021ae584
.L_208:
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_210:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_218:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT2
    mov r2, #0x1
    mov ip, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    ldr r3, [r0, #0xd44]
    mov r0, ip, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_0226b13c
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_244:
    ldr r2, _LIT3
    ldrh r2, [r2, #0xb2]
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_ov002_0220e65c
    ldmia sp!, {r4, pc}
.L_260:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd664
_LIT2: .word data_ov002_022d008c
_LIT3: .word data_ov002_022d0d8c
