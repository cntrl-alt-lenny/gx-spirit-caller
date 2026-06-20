; func_ov002_02270de8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd300
        .extern data_ov002_022cf1a4
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bc288
        .extern func_ov002_021bc618
        .extern func_ov002_021bc8c8
        .global func_ov002_02270de8
        .arm
func_ov002_02270de8:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    add r4, r1, r2
    mov r5, r0
    cmp r4, #0x4
    movgt r0, #0x0
    ldmgtia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, _LIT0
    mov r1, r5
    ldr r0, [r0]
    mov r2, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    mov r0, r5
    mov r1, r4
    bl func_ov002_021b9ecc
    ldr r2, _LIT0
    ldrb r1, [r2, #0x8]
    add r1, r1, #0x19
    add r1, r1, #0x1100
    cmp r1, r0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r0, [r2]
    mov r0, r0, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    mov r0, r0, lsr #0x1f
    beq .L_a4
    ldr r1, _LIT1
    mov r2, #0x14
    ldr r3, _LIT2
    and r6, r5, #0x1
    mul r2, r4, r2
    mla r1, r6, r1, r3
    ldrh r1, [r2, r1]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
.L_a4:
    bl func_ov002_021bc618
    cmp r0, #0x0
    bne .L_1d0
    ldr r0, _LIT0
    ldr r0, [r0]
    mov r0, r0, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    bne .L_dc
    mov r0, r5
    mov r1, r4
    bl func_ov002_021bc288
    cmp r0, #0x0
    movne r0, #0x800
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_dc:
    ldr r4, _LIT0
    mov r5, #0x0
    ldrb r0, [r4, #0x8]
    cmp r0, #0x0
    ble .L_134
.L_f0:
    add r0, r4, r5, lsl #0x1
    ldrh r2, [r0, #0x10]
    ldr r1, [r4]
    and r0, r2, #0xff
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    bne .L_124
    mov r1, r2, asr #0x8
    and r1, r1, #0xff
    bl func_ov002_021bc288
    cmp r0, #0x0
    movne r0, #0x800
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_124:
    ldrb r0, [r4, #0x8]
    add r5, r5, #0x1
    cmp r5, r0
    blt .L_f0
.L_134:
    add r7, r0, #0x1
    cmp r7, #0x3
    bge .L_1c8
    ldr r8, _LIT0
    mov r5, #0x0
.L_148:
    add r0, r7, #0x19
    mov r6, r5
    add r4, r0, #0x1100
.L_154:
    ldr r0, [r8]
    mov r1, r6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021b9ecc
    cmp r4, r0
    bne .L_1b0
    ldr r0, [r8]
    mov r2, r6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r1, r0
    bl func_ov002_021bc8c8
    cmp r0, #0x0
    beq .L_1b0
    ldr r0, [r8]
    mov r1, r6
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc288
    cmp r0, #0x0
    movne r0, #0x800
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_1b0:
    add r6, r6, #0x1
    cmp r6, #0x4
    ble .L_154
    add r7, r7, #0x1
    cmp r7, #0x3
    blt .L_148
.L_1c8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1d0:
    mov r0, #0x800
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022cd300
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a4
