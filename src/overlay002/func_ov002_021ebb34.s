; func_ov002_021ebb34 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern func_ov002_021b8fcc
        .extern func_ov002_021c1ef0
        .extern func_ov002_021c2084
        .global func_ov002_021ebb34
        .arm
func_ov002_021ebb34:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    mov r6, r2
    mov r8, r0
    mov r7, r1
    cmp r6, #0x5
    bge .L_30
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b8fcc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_30:
    ldr r1, _LIT0
    and r2, r7, #0x1
    mov r0, #0x14
    mul r5, r2, r1
    ldr r1, _LIT1
    mul r4, r6, r0
    add r1, r1, r5
    add r0, r1, r4
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    add r0, r1, #0x30
    ldr r1, [r0, r4]
    ldrh r2, [r8, #0x4]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    mov r2, r2, lsl #0x11
    add r0, r0, r1, lsr #0x1f
    cmp r0, r2, lsr #0x17
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r8
    mov r1, r7
    mov r2, r6
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r8
    mov r1, r7
    mov r2, r6
    mov r3, #0x1
    bl func_ov002_021c2084
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT2
    add r0, r0, r5
    ldrh r0, [r4, r0]
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
