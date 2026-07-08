; func_ov002_0221d198 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021afa94
        .extern func_ov002_021bc538
        .extern func_ov002_021ca1d8
        .extern func_ov002_021e277c
        .extern func_ov002_0223f5dc
        .extern func_ov002_022535a4
        .extern func_ov002_0226af64
        .extern func_ov002_0227acc8
        .global func_ov002_0221d198
        .arm
func_ov002_0221d198:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x6e
    bgt .L_28
    bge .L_160
    cmp r1, #0x64
    beq .L_17c
    b .L_194
.L_28:
    cmp r1, #0x80
    bgt .L_194
    cmp r1, #0x7e
    blt .L_194
    beq .L_134
    cmp r1, #0x7f
    beq .L_10c
    cmp r1, #0x80
    bne .L_194
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldrh r1, [r4]
    ldr r0, _LIT1
    cmp r1, r0
    ldrne r0, _LIT2
    cmpne r1, r0
    bne .L_b0
    mov r0, r4
    bl func_ov002_0223f5dc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
.L_b0:
    mov r0, r4
    bl func_ov002_0223f5dc
    ldrh r3, [r4, #0x2]
    mov r2, r0
    ldrh r1, [r4]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_022535a4
    cmp r0, #0x0
    ldrh r0, [r4, #0x2]
    bne .L_f4
    mov r0, r0, lsl #0x1f
    mov r1, #0xd
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    mov r0, #0x6e
    ldmia sp!, {r4, pc}
.L_f4:
    mov r0, r0, lsl #0x1f
    mov r1, #0x30
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae320
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_10c:
    bl func_ov002_0223f5dc
    ldrh r1, [r4, #0x2]
    mov r3, r0
    ldrh r2, [r4]
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, #0x6
    bl func_ov002_021af8f0
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_134:
    bl func_ov002_021afa94
    ldrh r3, [r4, #0x2]
    mov r1, r0
    ldrh r2, [r4]
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227acc8
    mov r0, #0x64
    ldmia sp!, {r4, pc}
.L_160:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226af64
    mov r0, #0x64
    ldmia sp!, {r4, pc}
.L_17c:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e277c
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_194:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x0000140b
_LIT2: .word 0x00001a98
