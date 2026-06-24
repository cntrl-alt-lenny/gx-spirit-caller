; func_ov002_021d01e0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern data_ov002_022cf1ac
        .extern data_ov002_022d0250
        .extern func_0203058c
        .extern func_ov002_021b00e8
        .extern func_ov002_021b9210
        .extern func_ov002_021b9254
        .extern func_ov002_021b9368
        .extern func_ov002_021ba11c
        .extern func_ov002_021ba1e8
        .extern func_ov002_021c2a40
        .extern func_ov002_021c2abc
        .extern func_ov002_021c93f0
        .extern func_ov002_021c9504
        .extern func_ov002_0229ade0
        .global func_ov002_021d01e0
        .arm
func_ov002_021d01e0:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, lr}
    sub sp, sp, #0xc
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r7, #0x1
    ldrh r1, [r0, #0x2]
    ldrh r8, [r0, #0x6]
    ldrh r6, [r0, #0x4]
    mov r0, r1, asr #0x8
    and r4, r1, #0xff
    and r5, r0, #0xff
    ldrh r1, [sp, #0x4]
    moveq r7, #0x0
    add r0, r4, r5
    cmp r0, #0xa
    movle r4, r0
    mov r0, r7, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r1, r1, #0x1
    and r0, r0, #0x1
    orr r0, r1, r0
    strh r0, [sp, #0x4]
    ldrh r2, [sp, #0x4]
    mov r1, r4, lsl #0x10
    mov r1, r1, lsr #0x10
    movle r5, #0x0
    bic r2, r2, #0x3e
    mov r1, r1, lsl #0x1b
    orr r1, r2, r1, lsr #0x1a
    strh r1, [sp, #0x4]
    mov r1, r5, lsl #0x10
    mov r2, r1, lsr #0x10
    ldr r0, _LIT1
    mov lr, r8, lsr #0x1f
    smull ip, r1, r0, r8
    smull ip, r9, r0, r8
    add r9, lr, r9, asr #0x2
    add r1, lr, r1, asr #0x2
    mov lr, #0xa
    smull r1, ip, lr, r1
    ldrh r3, [sp, #0x4]
    sub r1, r8, r1
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r0, r9, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r3, r3, #0x3fc0
    mov r2, r2, lsl #0x18
    orr r2, r3, r2, lsr #0x12
    strh r2, [sp, #0x4]
    ldrh r2, [sp, #0x4]
    mov r1, r1, lsl #0x1f
    mov r0, r0, lsl #0x1f
    bic r2, r2, #0x4000
    orr r1, r2, r1, lsr #0x11
    strh r1, [sp, #0x4]
    ldrh r1, [sp, #0x4]
    cmp r4, #0xc
    bic r1, r1, #0x8000
    orr r0, r1, r0, lsr #0x10
    strh r0, [sp, #0x4]
    mov r0, r7
    mov r1, r4
    blt .L_110
    bl func_ov002_021b00e8
    b .L_118
.L_110:
    mov r2, r5
    bl func_ov002_021c9504
.L_118:
    cmp r0, #0x0
    beq .L_1bc
    mov r0, r7
    mov r1, r4
    mov r2, r5
    bl func_ov002_021c93f0
    mov r1, #0x2000
    rsb r1, r1, #0x0
    ldr r3, [r0]
    and r2, r6, r1, lsr #0x13
    and r1, r3, r1
    orr r1, r1, r2
    str r1, [r0]
    mov r0, r7
    mov r1, r4
    mov r2, r5
    bl func_ov002_021c93f0
    mov r8, r0
    mov r0, r7
    mov r1, r4
    mov r2, r5
    bl func_ov002_021c93f0
    ldr r0, [r0]
    ldr r2, [r8]
    mov r0, r0, lsl #0x2
    mov r1, r0, lsr #0x18
    mov r0, #0x2000
    rsb r0, r0, #0x0
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r5, r1, r2, lsr #0x1f
    ldr r7, _LIT2
    mov r4, r5, lsl #0x2
    ldrh r3, [r7, r4]
    mov r1, r6, lsl #0x10
    mov r2, r0, lsr #0x13
    and r3, r3, r0
    and r0, r2, r1, lsr #0x10
    orr r0, r3, r0
    strh r0, [r7, r4]
    b .L_384
.L_1bc:
    mov r3, #0x0
    sub r0, r3, #0x2000
    ldr r1, _LIT3
    and r2, r0, #0x0
    and r0, r6, r1
    orr r0, r2, r0
    add r5, sp, #0x8
    bic r1, r0, #0x2000
    mov r0, r7, lsl #0x1f
    orr r1, r1, r0, lsr #0x12
    str r3, [r5]
    mov r0, r6
    str r1, [sp, #0x8]
    bl func_0203058c
    ldr r1, [sp, #0x8]
    mov r0, r0, lsl #0x1f
    bic r1, r1, #0x4000
    orr r1, r1, r0, lsr #0x11
    mov r0, r7
    str r1, [sp, #0x8]
    bl func_ov002_021b9210
    ldr r1, [sp, #0x8]
    mov r3, #0x2000
    rsb r3, r3, #0x0
    bic r1, r1, #0x3fc00000
    mov r0, r0, lsl #0x18
    orr r2, r1, r0, lsr #0x2
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    add r5, r0, r1, lsr #0x1f
    ldr r1, _LIT2
    mov r0, r5, lsl #0x2
    ldrh lr, [r1, r0]
    mov r8, r6, lsl #0x10
    mov ip, r3, lsr #0x13
    and lr, lr, r3
    and r3, ip, r8, lsr #0x10
    orr r3, lr, r3
    str r2, [sp, #0x8]
    strh r3, [r1, r0]
    cmp r4, #0x5
    bge .L_2d8
    ldrh r1, [sp, #0x4]
    add r2, sp, #0x8
    mov r0, r7
    mov r8, r1, lsl #0x11
    mov r3, r1, lsl #0x10
    mov r8, r8, lsr #0x1f
    mov r1, r4
    mov r3, r3, lsr #0x1f
    str r8, [sp]
    bl func_ov002_021b9254
    ldr r3, _LIT4
    ldr r0, _LIT5
    and r2, r7, #0x1
    mov r1, #0x14
    mla r8, r2, r0, r3
    mul r7, r4, r1
    ldr r1, [r8, r7]
    mov r0, r6
    bic r1, r1, #0x200000
    str r1, [r8, r7]
    bl func_0203058c
    cmp r0, #0x0
    beq .L_384
    ldr r0, [r8, r7]
    orr r0, r0, #0x10
    str r0, [r8, r7]
    b .L_384
.L_2d8:
    cmp r4, #0xa
    bgt .L_324
    ldrh r1, [sp, #0x4]
    add r2, sp, #0x8
    mov r0, r7
    mov r3, r1, lsl #0x11
    mov r1, r4
    mov r3, r3, lsr #0x1f
    bl func_ov002_021b9368
    mov r1, #0x14
    ldr r3, _LIT4
    ldr r0, _LIT5
    and r2, r7, #0x1
    mla r3, r2, r0, r3
    mul r1, r4, r1
    ldr r0, [r3, r1]
    bic r0, r0, #0x100000
    str r0, [r3, r1]
    b .L_384
.L_324:
    bic r1, r2, #0x4000
    sub r0, r4, #0xc
    str r1, [sp, #0x8]
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_384
    b .L_34c
    b .L_35c
    b .L_36c
    b .L_378
.L_34c:
    add r1, sp, #0x8
    mov r0, r7
    bl func_ov002_021ba1e8
    b .L_384
.L_35c:
    add r1, sp, #0x8
    mov r0, r7
    bl func_ov002_021ba11c
    b .L_384
.L_36c:
    add r0, sp, #0x8
    bl func_ov002_021c2a40
    b .L_384
.L_378:
    add r0, sp, #0x8
    mov r1, #0x0
    bl func_ov002_021c2abc
.L_384:
    ldrh r1, [sp, #0x4]
    mov r2, r6
    mov r3, r5
    mov r0, #0x1b
    bl func_ov002_0229ade0
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word 0x66666667
_LIT2: .word data_ov002_022d0250
_LIT3: .word 0x00001fff
_LIT4: .word data_ov002_022cf1ac
_LIT5: .word 0x00000868
