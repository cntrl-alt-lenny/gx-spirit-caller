; func_ov002_022340d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021b939c
        .extern func_ov002_021c194c
        .extern func_ov002_021c1d64
        .extern func_ov002_021d5918
        .extern func_ov002_0226b02c
        .global func_ov002_022340d8
        .arm
func_ov002_022340d8:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldr r0, [r6, #0x14]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x17
    bl func_ov002_021b939c
    ldrh r2, [r6, #0x2]
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r1, asr #0x8
    mov r1, r2, lsl #0x1f
    and r4, r0, #0xff
    cmp r4, r1, lsr #0x1f
    and r5, r3, #0xff
    mov r0, r1, lsr #0x1f
    beq .L_22c
    ldr r3, _LIT0
    ldr r1, _LIT1
    and r2, r4, #0x1
    mla r3, r2, r1, r3
    mov r1, #0x14
    mul r1, r5, r1
    add r2, r3, #0x30
    ldr r2, [r2, r1]
    ldr r3, [r6, #0x14]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    mov r3, r3, lsl #0x17
    add r1, r1, r2, lsr #0x1f
    cmp r1, r3, lsr #0x17
    bne .L_22c
    mov r1, #0x5
    str r1, [sp]
    str r0, [sp, #0x4]
    ldrh r3, [r6]
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_021d5918
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r4, r0, lsr #0x1f
    beq .L_22c
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_021c1d64
    cmp r0, #0x0
    bne .L_22c
    ldrh r2, [r6]
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c194c
    cmp r0, #0x0
    beq .L_22c
    mov r0, r4
    mov r1, r5
    bl func_ov002_0226b02c
.L_22c:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
