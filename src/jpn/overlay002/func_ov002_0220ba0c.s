; func_ov002_0220ba0c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf09c
        .extern data_ov002_022cf1a8
        .extern func_ov002_021b3dec
        .extern func_ov002_021ff2cc
        .global func_ov002_0220ba0c
        .arm
func_ov002_0220ba0c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r3, [r5, #0x2]
    mov r4, r1
    mov r0, r3, lsl #0x12
    movs r0, r0, lsr #0x1e
    bne .L_64
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, _LIT0
    and r2, r0, #0x1
    mul r3, r2, r1
    ldr r1, _LIT1
    ldr r1, [r1, r3]
    mov r1, r1, lsr #0x11
    tst r1, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    ldr r2, _LIT2
    mov r1, #0xb
    bl func_ov002_021b3dec
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_64:
    ldrh r2, [r5]
    mov r0, r3, lsl #0x1f
    mov r1, r3, lsl #0x1a
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b3dec
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r2, [r5, #0x2]
    ldr r0, _LIT0
    ldr r1, _LIT3
    mov r2, r2, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and r2, r2, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021ff2cc
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a8
_LIT2: .word 0x000012f3
_LIT3: .word data_ov002_022cf09c
