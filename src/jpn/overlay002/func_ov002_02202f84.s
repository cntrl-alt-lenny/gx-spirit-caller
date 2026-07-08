; func_ov002_02202f84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202e1e0
        .extern func_0202e2bc
        .extern func_02030538
        .extern func_ov002_021b4040
        .extern func_ov002_021b939c
        .extern func_ov002_021bbdac
        .extern func_ov002_021c3304
        .extern func_ov002_021c9310
        .extern func_ov002_021ff2cc
        .global func_ov002_02202f84
        .arm
func_ov002_02202f84:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r0
    ldrh r0, [r7, #0x2]
    mov r5, r1
    ldr r2, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, #0xb
    bl func_ov002_021b4040
    mov r4, r0
    mov r0, r7
    mov r1, r5
    bl func_ov002_021ff2cc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r4, #0x0
    blt .L_118
    mov r0, r4
    bl func_ov002_021b939c
    mov r1, r0, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r3, r0, lsr #0x10
    mov r1, r3, lsl #0x10
    mov r2, r2, asr #0x8
    and r6, r0, #0xff
    mov r5, r1, lsr #0x10
    and r8, r2, #0xff
    mov r0, r6
    mov r1, r8
    mov r2, r5
    bl func_ov002_021c9310
    mov r4, r0
    cmp r8, #0xe
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r4]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_118
    ldrh r0, [r7, #0x2]
    mov r1, r6
    mov r2, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3304
    cmp r0, #0x0
    beq .L_118
    ldr r0, [r4]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e2bc
    cmp r0, #0x0
    beq .L_110
    ldr r0, [r4]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_02030538
    cmp r0, #0x0
    beq .L_110
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbdac
    cmp r0, #0x0
    beq .L_118
.L_110:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_118:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00001415
