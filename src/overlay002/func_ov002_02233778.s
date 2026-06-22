; func_ov002_02233778 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_ov002_021ae664
        .extern func_ov002_021b00d0
        .extern func_ov002_021c8470
        .extern func_ov002_021c84a8
        .extern func_ov002_021d6808
        .extern func_ov002_021df818
        .extern func_ov002_0220b258
        .extern func_ov002_0226b22c
        .global func_ov002_02233778
        .arm
func_ov002_02233778:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2, #0x5a8]
    cmp r2, #0x7e
    beq .L_244
    cmp r2, #0x7f
    beq .L_218
    cmp r2, #0x80
    bne .L_2bc
    bl func_ov002_0220b258
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT1
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x1
    bne .L_208
    mov r0, #0x2
    bl func_ov002_021b00d0
    ldr r1, _LIT2
    str r0, [r1, #0xd44]
    b .L_210
.L_208:
    mov r0, #0x38
    bl func_ov002_021ae664
.L_210:
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_218:
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT2
    mov r2, #0x1
    mov r4, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    ldr r3, [r0, #0xd44]
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_0226b22c
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_244:
    ldr r1, _LIT3
    ldrh r1, [r1, #0xb2]
    cmp r1, #0x0
    beq .L_270
    mov r3, #0x0
    ldr r2, _LIT4
    str r3, [sp]
    ldr r1, [r2, #0x4]
    ldr r2, [r2, #0x20]
    bl func_ov002_021d6808
    b .L_2b4
.L_270:
    ldr r1, _LIT4
    ldr r0, [r1]
    ldr r1, [r1, #0x1c]
    bl func_ov002_021c8470
    ldr r1, _LIT4
    mov r5, r0
    ldr r0, [r1, #0x4]
    ldr r1, [r1, #0x20]
    bl func_ov002_021c84a8
    sub r2, r5, r0
    ldrh r1, [r4, #0x2]
    cmp r2, #0x0
    movle r2, #0x0
    mov r1, r1, lsl #0x1f
    mov r0, r4
    mov r1, r1, lsr #0x1f
    bl func_ov002_021df818
.L_2b4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_2bc:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022cd744
_LIT2: .word data_ov002_022d016c
_LIT3: .word data_ov002_022d0e6c
_LIT4: .word data_ov002_022cd3f4
