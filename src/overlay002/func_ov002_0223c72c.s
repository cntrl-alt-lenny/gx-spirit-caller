; func_ov002_0223c72c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern func_ov002_021b9ecc
        .extern func_ov002_021bc288
        .extern func_ov002_021bc6c4
        .extern func_ov002_021bd710
        .extern func_ov002_021bd85c
        .extern func_ov002_021c1d28
        .extern func_ov002_021c2330
        .extern func_ov002_0223b5cc
        .extern func_ov002_0223b6ec
        .global func_ov002_0223c72c
        .arm
func_ov002_0223c72c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    add r5, r1, r2
    mov r7, r0
    cmp r5, #0x4
    bgt .L_d4
    mov r1, r5
    bl func_ov002_021b9ecc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r2, _LIT0
    ldr r0, _LIT1
    and r1, r7, #0x1
    mla r2, r1, r0, r2
    mov r0, #0x14
    mul r0, r5, r0
    add r1, r2, #0x30
    ldr r3, [r1, r0]
    mov r0, r7
    mov r1, r3, lsl #0x2
    mov r2, r1, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    mov r1, r5
    add r4, r2, r3, lsr #0x1f
    bl func_ov002_021bd710
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r7
    mov r1, r5
    mov r2, #0x0
    bl func_ov002_0223b6ec
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r7
    mov r1, r5
    mov r2, #0x0
    bl func_ov002_021c1d28
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r1, _LIT2
    mov r0, r7
    ldr r2, [r1, #0x48c]
    mov r1, r5
    ldrh r2, [r2]
    bl func_ov002_021c2330
    cmp r0, #0x0
    bne .L_150
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_d4:
    cmp r1, #0xe
    bne .L_148
    ldr r3, _LIT0
    ldr r0, _LIT1
    and r1, r7, #0x1
    mla r0, r1, r0, r3
    add r0, r0, #0x18
    add r0, r0, #0x400
    ldr r1, [r0, r2, lsl #0x2]
    mov r0, r1, lsl #0x2
    mov r2, r1, lsl #0x13
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r4, r0, r1, lsr #0x1f
    mov r6, r2, lsr #0x13
    mov r0, r6
    mov r1, r4
    bl func_ov002_021bd85c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r6
    mov r1, #0x0
    bl func_ov002_0223b5cc
    cmp r0, #0x0
    bne .L_150
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_148:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_150:
    ldr r1, _LIT2
    mov r2, #0x0
    ldr r6, [r1, #0x6ac]
    cmp r6, #0x0
    bls .L_194
    ldr r3, [r1, #0x494]
.L_168:
    add r0, r3, r2
    mov r0, r0, lsl #0x19
    add r0, r1, r0, lsr #0x18
    add r0, r0, #0x400
    ldrh r0, [r0, #0x98]
    cmp r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    add r2, r2, #0x1
    cmp r2, r6
    bcc .L_168
.L_194:
    mov r0, r7
    bl func_ov002_021bc6c4
    cmp r0, #0x0
    bge .L_1d8
    ldr r0, _LIT2
    ldr r0, [r0, #0x6ac]
    cmp r0, #0x0
    bne .L_1d8
    cmp r5, #0x4
    movgt r0, #0x0
    ldmgtia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r7
    mov r1, r5
    bl func_ov002_021bc288
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_1d8:
    mov r0, #0x800
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022ce288
