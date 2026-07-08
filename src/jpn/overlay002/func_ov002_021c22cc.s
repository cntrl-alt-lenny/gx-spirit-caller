; func_ov002_021c22cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0cc
        .extern func_0202e1e0
        .extern func_0202e2a4
        .extern func_ov002_021b9dec
        .extern func_ov002_021ca43c
        .global func_ov002_021c22cc
        .arm
func_ov002_021c22cc:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    mov r6, r1
    bl func_ov002_021b9dec
    movs r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT0
    cmp r4, r0
    bne .L_80
    sub r1, r0, #0xe90
    and r2, r7, #0x1
    mul r3, r2, r1
    mov r0, #0x14
    ldr r2, _LIT1
    mul r0, r6, r0
    add r2, r2, r3
    ldr r1, _LIT2
    ldr r5, [r0, r2]
    add r3, r1, r3
    mov r2, r5, lsr #0x6
    mov r1, r5, lsr #0x2
    and r2, r2, #0x1
    orr r1, r1, r5, lsr #0x1
    ldrh r3, [r0, r3]
    and r1, r1, #0x1
    mvn r2, r2
    mvn r0, r1
    and r1, r3, r2
    tst r1, r0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
.L_80:
    mov r0, r4
    bl func_0202e2a4
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    bl func_ov002_021ca43c
    mov r5, r0
    tst r5, #0x1
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    tst r5, #0x2
    beq .L_c4
    mov r0, r4
    bl func_0202e1e0
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
.L_c4:
    tst r5, #0x4
    beq .L_f8
    ldr r0, _LIT3
    ldr r1, _LIT4
    and r2, r7, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mla r0, r6, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x12
    movs r0, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_f8:
    tst r5, #0x8
    beq .L_130
    ldr r0, _LIT3
    ldr r1, _LIT4
    and r2, r7, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mla r0, r6, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x12
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
.L_130:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x000016f8
_LIT1: .word data_ov002_022cf0cc
_LIT2: .word data_ov002_022cf0c4
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf08c
