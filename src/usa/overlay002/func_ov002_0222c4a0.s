; func_ov002_0222c4a0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0202df24
        .extern func_ov002_021b9dec
        .extern func_ov002_021c1d64
        .extern func_ov002_021d58dc
        .extern func_ov002_021e267c
        .extern func_ov002_0220e66c
        .global func_ov002_0222c4a0
        .arm
func_ov002_0222c4a0:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r8, r0
    ldrh r0, [r8, #0x4]
    mov r7, r1
    mov r0, r0, lsl #0x1d
    movs r0, r0, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x23
    beq .L_d0
    mov r6, #0x0
    ldr r5, _LIT0
    mov r4, r6
    mov r9, #0x1
.L_44:
    ldrh r0, [r8, #0x2]
    mov r1, r6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b9dec
    mov r1, r5
    bl func_0202df24
    cmp r0, #0x0
    beq .L_a8
    ldrh r1, [r8, #0x2]
    mov r0, r8
    mov r2, r6
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_021c1d64
    cmp r0, #0x0
    beq .L_a8
    str r4, [sp]
    ldrh r0, [r8, #0x2]
    ldrh r2, [r8]
    mov r1, r6
    mov r0, r0, lsl #0x1f
    mov r3, r9
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d58dc
.L_a8:
    add r6, r6, #0x1
    cmp r6, #0x4
    ble .L_44
    ldrh r0, [r8, #0x2]
    ldrh r1, [r8]
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021e267c
.L_d0:
    mov r0, r8
    mov r1, r7
    bl func_ov002_0220e66c
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000fa7
