; func_ov002_02226178 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022d0170
        .extern func_ov002_021b0b24
        .extern func_ov002_021bc5e4
        .extern func_ov002_021bcf50
        .extern func_ov002_021ca1d8
        .extern func_ov002_021d58dc
        .extern func_ov002_021d5c68
        .extern func_ov002_021de390
        .extern func_ov002_021dec64
        .extern func_ov002_021e788c
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_0227ab74
        .global func_ov002_02226178
        .arm
func_ov002_02226178:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r6, r0
    ldr r2, [r1, #0x5a8]
    cmp r2, #0x7f
    beq .L_230
    cmp r2, #0x80
    bne .L_2e8
    ldrh r2, [r6, #0x2]
    ldrh r5, [r6, #0x4]
    ldr r4, _LIT1
    mov r1, r2, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov ip, r2, lsl #0x1a
    ldr r2, _LIT2
    and r3, r1, #0x1
    mla r4, r3, r2, r4
    mov r2, ip, lsr #0x1b
    mov r3, #0x14
    mul r3, r2, r3
    add r4, r4, #0x30
    ldr r4, [r4, r3]
    mov r5, r5, lsl #0x11
    mov r3, r4, lsl #0x2
    mov r3, r3, lsr #0x18
    mov r4, r4, lsl #0x12
    mov r3, r3, lsl #0x1
    mov r5, r5, lsr #0x17
    add r3, r3, r4, lsr #0x1f
    cmp r5, r3
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, pc}
    cmp r2, #0x4
    bhi .L_17c
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_224
    mov r0, r6
    mov r1, #0x0
    bl func_ov002_0223dda4
    ldrh r2, [r6, #0x2]
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r3, r1, asr #0x8
    mov r1, r2, lsl #0x1f
    and r4, r0, #0xff
    mov r0, r1, lsr #0x1f
    and r5, r3, #0xff
    bl func_ov002_021bcf50
    ldr r2, _LIT0
    mov r1, r4
    str r0, [r2, #0x5ac]
    mov r0, r6
    mov r2, r5
    bl func_ov002_021e788c
    cmp r0, #0x1
    bne .L_224
    ldr r0, _LIT0
    ldr r2, [r0, #0x5ac]
    cmp r2, #0x0
    blt .L_224
    ldrh r1, [r6, #0x2]
    mov r0, r6
    str r2, [sp]
    ldrh r2, [r6, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r2, r2, lsl #0x1a
    mov r3, r1
    mov r2, r2, lsr #0x1b
    bl func_ov002_021dec64
    ldrh r1, [r6, #0x2]
    ldr r0, _LIT0
    and r2, r4, #0xff
    mov r1, r1, lsl #0x1f
    ldr r3, [r0, #0x5ac]
    mov r0, r1, lsr #0x1f
    and r1, r5, #0xff
    orr r1, r2, r1, lsl #0x8
    mov r2, r1, lsl #0x10
    and r1, r3, #0xff
    and r4, r0, #0xff
    orr r1, r4, r1, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, #0xb
    bl func_ov002_021d5c68
    add sp, sp, #0x4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_17c:
    mov r0, r1
    bl func_ov002_021bc5e4
    ldr r1, _LIT0
    str r0, [r1, #0x5ac]
    ldrh r0, [r6, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    beq .L_224
    ldr r0, _LIT0
    ldr r0, [r0, #0x5ac]
    cmp r0, #0x0
    ldrh r0, [r6, #0x2]
    blt .L_1fc
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r4, _LIT1
    mov r3, #0x0
    ldr r1, _LIT2
    and r2, r0, #0x1
    mla r1, r2, r1, r4
    str r3, [sp]
    ldrh r2, [r6, #0x2]
    add r4, r1, #0x30
    mov r1, #0x14
    mov r2, r2, lsl #0x1a
    mov r2, r2, lsr #0x1b
    mla r1, r2, r1, r4
    mov r2, #0x1
    bl func_ov002_0227ab74
    b .L_218
.L_1fc:
    mov r2, #0x0
    mov r1, r0, lsl #0x1a
    mov r4, r0, lsl #0x1f
    mov r3, r2
    mov r0, r4, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_021de390
.L_218:
    add sp, sp, #0x4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_224:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_230:
    mov r0, #0x0
    str r0, [sp]
    ldrh r0, [r6, #0x2]
    ldr r1, [r1, #0x5ac]
    ldr r2, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x2
    bl func_ov002_021d58dc
    ldrh r1, [r6, #0x4]
    ldr r0, _LIT4
    ldrh r2, [r6]
    mov r1, r1, lsl #0x11
    mov r1, r1, lsr #0x17
    mov r1, r1, lsl #0x2
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    cmp r2, r0, lsr #0x13
    beq .L_29c
    ldrh r1, [r6, #0x2]
    ldr r0, _LIT0
    mov r2, #0x0
    mov r4, r1, lsl #0x1f
    ldr r1, [r0, #0x5ac]
    mov r3, r2
    mov r0, r4, lsr #0x1f
    bl func_ov002_021de390
.L_29c:
    ldrh r1, [r6, #0x2]
    ldr r0, _LIT5
    ldr r0, [r0, #0x4]
    mov r1, r1, lsl #0x1f
    cmp r0, r1, lsr #0x1f
    bne .L_2dc
    ldr r0, _LIT0
    ldr r0, [r0, #0x5ac]
    cmp r0, #0x5
    blt .L_2d0
    mov r0, #0x30
    mov r1, #0x1
    bl func_ov002_021b0b24
.L_2d0:
    mov r0, #0x31
    mov r1, #0x1
    bl func_ov002_021b0b24
.L_2dc:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_2e8:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
_LIT3: .word 0x00000fb6
_LIT4: .word data_ov002_022d0170
_LIT5: .word data_ov002_022cd65c
