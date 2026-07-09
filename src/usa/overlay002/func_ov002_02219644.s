; func_ov002_02219644 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern func_02030538
        .extern func_ov002_021b3d48
        .extern func_ov002_021b98d4
        .extern func_ov002_021bc538
        .extern func_ov002_021c3304
        .extern func_ov002_021c9d10
        .extern func_ov002_021ca1d8
        .extern func_ov002_021e267c
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de04
        .extern func_ov002_0227ab74
        .extern func_ov002_0227acc8
        .global func_ov002_02219644
        .arm
func_ov002_02219644:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    ldr r1, _LIT0
    mov r6, r0
    ldr r1, [r1, #0x5ac]
    bl func_ov002_0223dda4
    ldrh r1, [r6, #0x4]
    and r5, r0, #0xff
    mov r0, r1, lsl #0x1d
    movs r0, r0, lsr #0x1f
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, pc}
    ldr r1, _LIT0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x64
    bgt .L_4c
    beq .L_244
    b .L_254
.L_4c:
    cmp r0, #0x80
    bgt .L_254
    cmp r0, #0x7e
    blt .L_254
    beq .L_224
    cmp r0, #0x7f
    beq .L_a4
    cmp r0, #0x80
    bne .L_254
    mov r0, #0x0
    str r0, [r1, #0x5ac]
    bl func_ov002_021ca1d8
    mov r4, r0
    mov r0, #0x1
    bl func_ov002_021ca1d8
    ldr r1, _LIT0
    orr r0, r4, r0, lsl #0x1
    str r0, [r1, #0x5b0]
    bl func_ov002_021e2a4c
    add sp, sp, #0x4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_a4:
    ldrh r0, [r6, #0x6]
    ldr r1, [r1, #0x5ac]
    mov r0, r0, lsl #0x10
    cmp r1, r0, lsr #0x18
    bge .L_218
    mov r0, r5
    bl func_ov002_021bc538
    cmp r0, #0x0
    beq .L_218
    ldr r0, _LIT0
    ldr r1, [r0, #0x5b0]
    mov r1, r1, asr r5
    tst r1, #0x1
    beq .L_218
    ldr r1, [r0, #0x5ac]
    mov r0, r6
    bl func_ov002_0223de04
    mov r1, r0
    mov r0, r5
    bl func_ov002_021b98d4
    movs r4, r0
    bmi .L_218
    mov r0, r5
    mov r1, r5
    mov r2, r4
    bl func_ov002_021c3304
    cmp r0, #0x0
    beq .L_218
    ldr r2, _LIT1
    ldr r0, _LIT2
    and r1, r5, #0x1
    mla r0, r1, r0, r2
    add r0, r0, #0x18
    add r1, r0, #0x400
    ldrh r2, [r6]
    ldr r0, _LIT3
    add r4, r1, r4, lsl #0x2
    cmp r2, r0
    beq .L_15c
    add r0, r0, #0x2a
    cmp r2, r0
    beq .L_1c8
    ldr r0, _LIT4
    cmp r2, r0
    beq .L_1fc
    b .L_218
.L_15c:
    ldr r0, [r4]
    mov r0, r0, lsl #0x13
    cmp r2, r0, lsr #0x13
    bne .L_194
    mov r0, r5
    mov r1, #0xb
    bl func_ov002_021b3d48
    cmp r0, #0xa
    bge .L_218
    ldrh r1, [r6]
    mov r0, r5
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_021e267c
.L_194:
    ldr r0, [r4]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_02030538
    cmp r0, #0x0
    ldrh r3, [r6]
    movne r2, #0x1
    moveq r2, #0x0
    mov r0, r5
    mov r1, r4
    mov r3, r3, lsl #0x10
    bl func_ov002_0227acc8
    b .L_218
.L_1c8:
    mov r0, r5
    bl func_ov002_021c9d10
    cmp r0, #0x0
    beq .L_218
    ldrh r2, [r6]
    mov r0, r5
    mov r1, r4
    mov r4, r2, lsl #0x10
    mov r2, #0x0
    mov r3, #0x1
    str r4, [sp]
    bl func_ov002_0227ab74
    b .L_218
.L_1fc:
    mov r6, r2, lsl #0x10
    mov r2, #0x1
    mov r0, r5
    mov r1, r4
    mov r3, r2
    str r6, [sp]
    bl func_ov002_0227ab74
.L_218:
    add sp, sp, #0x4
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_224:
    ldr r0, [r1, #0x5ac]
    add sp, sp, #0x4
    add r0, r0, #0x1
    str r0, [r1, #0x5ac]
    cmp r0, #0x2
    movge r0, #0x64
    movlt r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_244:
    bl func_ov002_021e2b6c
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_254:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
_LIT3: .word 0x0000133b
_LIT4: .word 0x00001990
