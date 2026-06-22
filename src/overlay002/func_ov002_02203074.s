; func_ov002_02203074 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202e234
        .extern func_0202e310
        .extern func_0203058c
        .extern func_ov002_021b4120
        .extern func_ov002_021b947c
        .extern func_ov002_021bbe8c
        .extern func_ov002_021c33e4
        .extern func_ov002_021c93f0
        .extern func_ov002_021ff3bc
        .global func_ov002_02203074
        .arm
func_ov002_02203074:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r0
    ldrh r0, [r7, #0x2]
    mov r5, r1
    ldr r2, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, #0xb
    bl func_ov002_021b4120
    mov r4, r0
    mov r0, r7
    mov r1, r5
    bl func_ov002_021ff3bc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r4, #0x0
    blt .L_118
    mov r0, r4
    bl func_ov002_021b947c
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
    bl func_ov002_021c93f0
    mov r4, r0
    cmp r8, #0xe
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r4]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e234
    cmp r0, #0x0
    beq .L_118
    ldrh r0, [r7, #0x2]
    mov r1, r6
    mov r2, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c33e4
    cmp r0, #0x0
    beq .L_118
    ldr r0, [r4]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e310
    cmp r0, #0x0
    beq .L_110
    ldr r0, [r4]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0203058c
    cmp r0, #0x0
    beq .L_110
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbe8c
    cmp r0, #0x0
    beq .L_118
.L_110:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_118:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00001415
