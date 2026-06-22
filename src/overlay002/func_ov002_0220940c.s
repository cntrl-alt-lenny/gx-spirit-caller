; func_ov002_0220940c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b4098
        .extern func_ov002_021b9e00
        .extern func_ov002_02208bfc
        .global func_ov002_0220940c
        .arm
func_ov002_0220940c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldrh r2, [r5, #0x2]
    ldr lr, _LIT0
    ldr r3, _LIT1
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r4, r0, #0x1
    mla r6, r4, r3, lr
    ldrh ip, [r5, #0x4]
    mov r3, r2, lsl #0x1a
    mov r4, r1
    mov r1, r3, lsr #0x1b
    mov r3, #0x14
    mov lr, ip, lsl #0x11
    mul r3, r1, r3
    add r6, r6, #0x30
    ldr ip, [r6, r3]
    mov lr, lr, lsr #0x17
    mov r3, ip, lsl #0x2
    mov r3, r3, lsr #0x18
    mov ip, ip, lsl #0x12
    mov r3, r3, lsl #0x1
    add r3, r3, ip, lsr #0x1f
    cmp lr, r3
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    mov r2, r2, lsl #0x14
    mov r2, r2, lsr #0x1a
    cmp r2, #0x19
    bne .L_90
    bl func_ov002_021b9e00
    cmp r0, #0x5
    movlt r0, #0x1
    movge r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_90:
    ldr r2, _LIT2
    bl func_ov002_021b4098
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r5, #0x2]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021b9e00
    cmp r0, #0x5
    movlt r0, #0x0
    ldmltia sp!, {r4, r5, r6, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_02208bfc
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word 0x0000181a
