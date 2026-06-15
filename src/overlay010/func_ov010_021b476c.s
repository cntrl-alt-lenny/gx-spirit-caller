; func_ov010_021b476c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021067d4
        .extern data_ov010_021b91b4
        .extern data_ov010_021b91c0
        .extern data_ov010_021b9260
        .extern func_ov005_021ab260
        .extern func_ov005_021ab384
        .extern func_ov005_021ab3a0
        .extern func_ov005_021ab3b4
        .global func_ov010_021b476c
        .arm
func_ov010_021b476c:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    ldr r3, _LIT0
    mov r8, r0
    ldr r0, [r3, #0x128]
    mov r7, r1
    mov r1, r8
    mov r6, r2
    ldr r5, _LIT1
    bl func_ov005_021ab3a0
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x128]
    mov r1, r8
    bl func_ov005_021ab3b4
    mov r0, r0, asr #0x10
    mov r0, r0, lsl #0x10
    cmp r4, #0x0
    mov r2, r0, lsr #0x10
    beq .L_68
    ldr r0, _LIT2
    ldr r1, _LIT3
    add r0, r4, r0
    ldr r2, [r5, #0x164]
    ldr r0, [r1, r0, lsl #0x2]
    add r4, r2, r0
    b .L_78
.L_68:
    ldr r0, [r5, #0x168]
    ldr r1, [r5, #0x16c]
    ldr r0, [r0, r2, lsl #0x2]
    add r4, r1, r0
.L_78:
    cmp r7, #0x0
    beq .L_b0
    ldr r0, _LIT4
    mov r1, r8, asr #0x5
    ldr r0, [r0, r1, lsl #0x2]
    and r1, r8, #0x1f
    mov r2, #0x1
    tst r0, r2, lsl r1
    moveq r2, #0x0
    cmp r2, #0x0
    moveq r0, #0x2
    streq r0, [r7]
    ldrne r0, _LIT5
    strne r0, [r7]
.L_b0:
    cmp r6, #0x0
    beq .L_f8
    ldr r0, [r5, #0x7c]
    mov r1, r8
    bl func_ov005_021ab260
    cmp r0, #0x0
    ldreq r0, _LIT5
    streq r0, [r6]
    beq .L_f8
    ldr r0, [r5, #0x7c]
    mov r1, r8
    mov r2, #0x2
    bl func_ov005_021ab384
    cmp r0, #0x0
    movne r0, #0x0
    strne r0, [r6]
    moveq r0, #0x1
    streq r0, [r6]
.L_f8:
    mov r0, r4
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov010_021b91b4
_LIT1: .word data_ov010_021b9260
_LIT2: .word 0xfffffd76
_LIT3: .word data_ov010_021b91c0
_LIT4: .word data_021067d4
_LIT5: .word 0x00003fff
