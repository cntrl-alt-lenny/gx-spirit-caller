; func_ov002_021ecbd0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b34f4
        .extern func_ov002_021c1e44
        .extern func_ov002_021c1ef0
        .global func_ov002_021ecbd0
        .arm
func_ov002_021ecbd0:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r7, r1
    ldr r5, _LIT0
    ldr r3, _LIT1
    and r4, r7, #0x1
    mla r5, r4, r3, r5
    mov r8, r0
    ldrh r4, [r8, #0x2]
    mov r6, r2
    mov r3, #0x14
    mov ip, r4, lsl #0x1f
    cmp r7, ip, lsr #0x1f
    mul r4, r6, r3
    add r5, r5, #0x30
    ldr r3, [r5, r4]
    movne r0, #0x0
    mov r3, r3, lsl #0x13
    mov r3, r3, lsr #0x13
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r6, #0x5
    movge r0, #0x0
    ldmgeia sp!, {r4, r5, r6, r7, r8, pc}
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r8
    mov r1, r7
    mov r2, r6
    bl func_ov002_021c1e44
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r1, [r8]
    ldr r0, _LIT2
    cmp r1, r0
    beq .L_760
    ldr r0, _LIT3
    cmp r1, r0
    beq .L_784
    b .L_7b0
.L_760:
    ldrh r1, [r8, #0x2]
    ldr r0, [r5, r4]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x12
    cmp r1, r0, lsr #0x1f
    beq .L_7b0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_784:
    ldrh r2, [r8, #0x2]
    mov r0, r7
    mov r1, r6
    mov r3, r2, lsl #0x1a
    mov r4, r2, lsl #0x1f
    mov r2, r4, lsr #0x1f
    mov r3, r3, lsr #0x1b
    bl func_ov002_021b34f4
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_7b0:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word 0x00001420
_LIT3: .word 0x00001957
