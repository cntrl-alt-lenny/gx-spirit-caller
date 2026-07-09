; func_ov002_02212020 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021c194c
        .extern func_ov002_021c1d64
        .extern func_ov002_021d58dc
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .extern func_ov002_0226b02c
        .global func_ov002_02212020
        .arm
func_ov002_02212020:
    stmdb sp!, {r4, r5, r6, lr}
    sub sp, sp, #0x8
    mov r6, r0
    ldrh r1, [r6, #0x2]
    ldrh r3, [r6, #0x4]
    ldr r5, _LIT0
    mov r2, r1, lsl #0x1f
    mov r4, r2, lsr #0x1f
    mov r2, r1, lsl #0x1a
    ldr r1, _LIT1
    and r4, r4, #0x1
    mla r5, r4, r1, r5
    mov r2, r2, lsr #0x1b
    mov r1, #0x14
    mul r1, r2, r1
    add r2, r5, #0x30
    ldr r2, [r2, r1]
    mov r3, r3, lsl #0x11
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    mov r3, r3, lsr #0x17
    add r1, r1, r2, lsr #0x1f
    cmp r3, r1
    addne sp, sp, #0x8
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    add r2, sp, #0x4
    mov r1, #0x0
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_1cc
    ldr r2, [sp, #0x4]
    mov r0, r6
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r4, r2, #0xff
    and r5, r1, #0xff
    mov r1, r4
    mov r2, r5
    bl func_ov002_02257564
    cmp r0, #0x0
    beq .L_1cc
    ldrh r3, [r6]
    ldr r2, _LIT2
    mov r0, #0x6
    cmp r3, r2
    bgt .L_f0
    bge .L_11c
    ldr r1, _LIT3
    cmp r3, r1
    bgt .L_e0
    beq .L_11c
    b .L_120
.L_e0:
    ldr r1, _LIT4
    cmp r3, r1
    beq .L_11c
    b .L_120
.L_f0:
    add r1, r2, #0x4c
    cmp r3, r1
    bgt .L_110
    bge .L_11c
    add r1, r2, #0x10
    cmp r3, r1
    beq .L_11c
    b .L_120
.L_110:
    ldr r1, _LIT5
    cmp r3, r1
    bne .L_120
.L_11c:
    mov r0, #0x7
.L_120:
    mov r1, #0x0
    str r1, [sp]
    ldrh r1, [r6, #0x2]
    and r0, r0, #0xf
    orr r3, r0, #0x10
    mov r2, r1, lsl #0x1f
    mov r1, r1, lsl #0x1a
    mov r2, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    and r0, r1, #0xff
    and r2, r2, #0xff
    orr r0, r2, r0, lsl #0x8
    mov r2, r0, lsl #0x10
    mov r0, r4
    mov r1, r5
    mov r2, r2, lsr #0x10
    bl func_ov002_021d58dc
    ldrh r1, [r6]
    ldr r0, _LIT5
    cmp r1, r0
    bne .L_1c0
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    cmp r4, r0, lsr #0x1f
    beq .L_1c0
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_021c1d64
    cmp r0, #0x0
    bne .L_1c0
    ldrh r2, [r6]
    mov r0, r4
    mov r1, r5
    bl func_ov002_021c194c
    cmp r0, #0x0
    beq .L_1c0
    mov r0, r4
    mov r1, r5
    bl func_ov002_0226b02c
.L_1c0:
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_1cc:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cf08c
_LIT1: .word 0x00000868
_LIT2: .word 0x000017ff
_LIT3: .word 0x00001243
_LIT4: .word 0x000016a2
_LIT5: .word 0x00001a9c
