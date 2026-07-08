; func_ov002_02223f54 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern func_ov002_021b939c
        .extern func_ov002_021c3304
        .extern func_ov002_021ca5b8
        .extern func_ov002_021d8038
        .extern func_ov002_021ff2cc
        .extern func_ov002_0223de04
        .extern func_ov002_0227acc8
        .global func_ov002_02223f54
        .arm
func_ov002_02223f54:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r2, _LIT0
    mov r6, r0
    ldr r2, [r2, #0x5a8]
    cmp r2, #0x7f
    beq .L_c0
    cmp r2, #0x80
    bne .L_160
    bl func_ov002_021ff2cc
    cmp r0, #0x0
    beq .L_b8
    mov r0, r6
    mov r1, #0x0
    bl func_ov002_0223de04
    bl func_ov002_021b939c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r0, lsr #0x10
    mov r2, r1, asr #0x8
    mov r1, r3, lsl #0x10
    and r2, r2, #0xff
    cmp r2, #0xe
    and r4, r0, #0xff
    mov r5, r1, lsr #0x10
    bne .L_b8
    ldrh r0, [r6, #0x2]
    mov r1, r4
    mov r2, r5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c3304
    cmp r0, #0x0
    beq .L_b8
    ldr r2, _LIT1
    ldr r0, _LIT2
    and r1, r4, #0x1
    mla r0, r1, r0, r2
    ldrh r2, [r6, #0x2]
    add r0, r0, #0x18
    add r1, r0, #0x400
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    add r1, r1, r5, lsl #0x2
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_0227acc8
.L_b8:
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, pc}
.L_c0:
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r1, r0, #0x1
    bl func_ov002_021ca5b8
    cmp r0, #0x0
    beq .L_158
    mov r0, r6
    mov r1, #0x1
    bl func_ov002_0223de04
    bl func_ov002_021b939c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    cmp r1, #0xe
    bne .L_158
    and r2, r0, #0xff
    ldr r3, _LIT1
    ldr r1, _LIT2
    and r2, r2, #0x1
    mla r3, r2, r1, r3
    mov r1, r0, lsr #0x10
    add r0, r3, #0x18
    mov r1, r1, lsl #0x10
    ldrh r2, [r6, #0x2]
    add r4, r0, #0x400
    mov r3, r1, lsr #0x10
    mov r0, r2, lsl #0x1f
    ldr r1, [r4, r3, lsl #0x2]
    mov r0, r0, lsr #0x1f
    mov r2, r1, lsl #0x12
    cmp r0, r2, lsr #0x1f
    mov r0, r2, lsr #0x1f
    movne r2, #0x1
    add r1, r4, r3, lsl #0x2
    moveq r2, #0x0
    bl func_ov002_021d8038
.L_158:
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_160:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
