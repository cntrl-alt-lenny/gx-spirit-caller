; func_ov002_0221b8e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021b99b4
        .extern func_ov002_021c33e4
        .extern func_ov002_021e276c
        .extern func_ov002_021ff3bc
        .extern func_ov002_0227ac64
        .global func_ov002_0221b8e0
        .arm
func_ov002_0221b8e0:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r2, [r5, #0x2]
    mov r3, r2, lsl #0x14
    mov r3, r3, lsr #0x1a
    cmp r3, #0x2
    beq .L_6c
    ldr r0, _LIT0
    mov r2, r2, lsl #0x1f
    ldr r1, [r0, #0xcec]
    mov r0, r2, lsr #0x1f
    cmp r1, r2, lsr #0x1f
    moveq r1, #0x1
    movne r1, #0x0
    add r1, r1, #0x1
    and r2, r1, #0xff
    ldrh r1, [r5, #0x4]
    mov r2, r2, lsl #0x4
    orr r2, r2, #0x1
    mov r3, r1, lsl #0x11
    mov r2, r2, lsl #0x10
    ldrh r1, [r5]
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x17
    bl func_ov002_021e276c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_6c:
    bl func_ov002_021ff3bc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r5, #0x2]
    ldrh r0, [r5, #0x4]
    mov r2, r1, lsl #0x1f
    mov r1, r0, lsl #0x11
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x17
    bl func_ov002_021b99b4
    movs r4, r0
    bmi .L_100
    ldrh r0, [r5, #0x2]
    mov r2, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r0
    bl func_ov002_021c33e4
    cmp r0, #0x0
    beq .L_100
    ldrh r0, [r5, #0x2]
    ldrh ip, [r5]
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r5, _LIT1
    ldr r1, _LIT2
    and r3, r0, #0x1
    mla r1, r3, r1, r5
    add r1, r1, #0x18
    add r1, r1, #0x400
    mov r5, ip, lsl #0x10
    mov r3, r2
    add r1, r1, r4, lsl #0x2
    str r5, [sp]
    bl func_ov002_0227ac64
.L_100:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00000868
