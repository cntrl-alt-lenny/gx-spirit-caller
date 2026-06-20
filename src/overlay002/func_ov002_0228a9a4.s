; func_ov002_0228a9a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern func_ov002_021b59b0
        .extern func_ov002_0223de94
        .extern func_ov002_0225764c
        .extern func_ov002_02257ab8
        .global func_ov002_0228a9a4
        .arm
func_ov002_0228a9a4:
    stmdb sp!, {r3, r4, r5, lr}
    movs r4, r1
    mov r5, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r4, #0x2]
    ldrh r0, [r5, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    mov r0, r4
    bl func_ov002_021b59b0
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_180
    b .L_180
    b .L_64
    b .L_64
    b .L_180
    b .L_138
    b .L_180
    b .L_138
.L_64:
    ldrh r0, [r4, #0x6]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x1
    bne .L_130
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223de94
    and r3, r0, #0xff
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x8
    ldr r0, _LIT0
    ldr r2, _LIT1
    and r3, r3, #0x1
    mla r2, r3, r0, r2
    and r1, r1, #0xff
    mov r0, #0x14
    mla r0, r1, r0, r2
    ldr r0, [r0, #0x30]
    ldr r1, _LIT2
    mov r0, r0, lsl #0x13
    cmp r1, r0, lsr #0x13
    mov r2, r0, lsr #0x13
    bcc .L_108
    cmp r2, r1
    bcs .L_128
    sub r0, r1, #0x358
    cmp r2, r0
    bhi .L_e4
    beq .L_128
    b .L_130
.L_e4:
    ldr r1, _LIT3
    cmp r2, r1
    bhi .L_130
    sub r0, r1, #0x1
    cmp r2, r0
    bcc .L_130
    cmpne r2, r1
    beq .L_128
    b .L_130
.L_108:
    add r0, r1, #0xa9
    cmp r2, r0
    bhi .L_11c
    beq .L_128
    b .L_130
.L_11c:
    add r0, r1, #0x1bc
    cmp r2, r0
    bne .L_130
.L_128:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_130:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
.L_138:
    ldrh r1, [r5, #0x2]
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    bl func_ov002_02257ab8
    ldrh r1, [r5, #0x2]
    mov r5, r0
    mov r0, r4
    mov r2, r1, lsl #0x1a
    mov r3, r1, lsl #0x1f
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_0225764c
    sub r0, r5, r0
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
.L_180:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word 0x00001435
_LIT3: .word 0x000012ff
