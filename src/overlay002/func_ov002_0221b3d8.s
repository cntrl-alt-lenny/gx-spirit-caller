; func_ov002_0221b3d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021ae664
        .extern func_ov002_021b00d0
        .extern func_ov002_0220e74c
        .extern func_ov002_0223de94
        .extern func_ov002_0223df38
        .extern func_ov002_0225764c
        .extern func_ov002_0226b22c
        .global func_ov002_0221b3d8
        .arm
func_ov002_0221b3d8:
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
    bl func_ov002_0223df38
    cmp r0, #0x0
    beq .L_210
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223de94
    mov r1, r0
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r0, asr #0x8
    mov r0, r4
    and r1, r1, #0xff
    and r2, r2, #0xff
    bl func_ov002_0225764c
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
    bl func_ov002_021b00d0
    ldr r1, _LIT2
    str r0, [r1, #0xd44]
    b .L_208
.L_200:
    mov r0, #0x38
    bl func_ov002_021ae664
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
    bl func_ov002_0226b22c
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_244:
    ldr r2, _LIT3
    ldrh r2, [r2, #0xb2]
    cmp r2, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_ov002_0220e74c
    ldmia sp!, {r4, pc}
.L_260:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cd744
_LIT2: .word data_ov002_022d016c
_LIT3: .word data_ov002_022d0e6c
