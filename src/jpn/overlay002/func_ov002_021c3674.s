; func_ov002_021c3674 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern func_0202de48
        .extern func_0202e2a4
        .extern func_ov002_021b90e4
        .extern func_ov002_021ba108
        .global func_ov002_021c3674
        .arm
func_ov002_021c3674:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r2, _LIT0
    and r0, r0, #0x1
    mul r5, r0, r2
    mov r6, r1
    ldr r1, _LIT1
    ldr r0, [r6]
    add r2, r1, r5
    ldr r4, _LIT2
    mov r0, r0, lsl #0x13
    ldr r1, [r4, r5]
    add r2, r2, #0x120
    add r7, r2, r1, lsl #0x2
    movs r0, r0, lsr #0x13
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    bl func_0202e2a4
    cmp r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202de48
    cmp r0, #0x3
    bne .L_3e8
    ldr r0, [r6]
    mov r1, r6
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ba108
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_3e8:
    mov r0, r7
    mov r1, r6
    bl func_ov002_021b90e4
    ldr r0, [r4, r5]
    add r0, r0, #0x1
    str r0, [r4, r5]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
_LIT2: .word data_ov002_022cf098
