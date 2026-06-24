; func_ov002_021e9ac4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern func_0202b890
        .extern func_0202ee40
        .extern func_ov002_021b3314
        .extern func_ov002_021b9ecc
        .extern func_ov002_021c1e44
        .extern func_ov002_021c2084
        .extern func_ov002_021c84a8
        .extern func_ov002_021c84e0
        .extern func_ov002_021c8940
        .extern func_ov002_021c92ec
        .extern func_ov002_021c93cc
        .extern func_ov002_0223de94
        .global func_ov002_021e9ac4
        .arm
func_ov002_021e9ac4:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r7, r2
    mov r9, r0
    cmp r7, #0x5
    mov r8, r1
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r4, _LIT0
    and r6, r8, #0x1
    mul r5, r6, r4
    mov r3, #0x14
    mul r4, r7, r3
    ldr r6, _LIT1
    add r3, r6, r5
    add r3, r3, r4
    ldr r3, [r3, #0x30]
    mov r3, r3, lsl #0x13
    movs r3, r3, lsr #0x13
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r3, _LIT2
    add r3, r3, r5
    ldrh r3, [r4, r3]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    bl func_ov002_021c1e44
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r9
    mov r1, r8
    mov r2, r7
    mov r3, #0x0
    bl func_ov002_021c2084
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c8940
    ldrh r6, [r9]
    ldr r1, _LIT3
    cmp r6, r1
    bgt .L_164
    bge .L_2b0
    ldr r3, _LIT4
    cmp r6, r3
    bgt .L_12c
    bge .L_20c
    sub r1, r3, #0x1e0
    cmp r6, r1
    bgt .L_11c
    bge .L_27c
    sub r1, r6, #0x33
    sub r1, r1, #0x1200
    cmp r1, #0xb
    addls pc, pc, r1, lsl #0x2
    b .L_36c
    b .L_22c
    b .L_36c
    b .L_36c
    b .L_1f0
    b .L_36c
    b .L_36c
    b .L_36c
    b .L_23c
    b .L_36c
    b .L_24c
    b .L_25c
    b .L_26c
.L_11c:
    ldr r1, _LIT5
    cmp r6, r1
    beq .L_28c
    b .L_36c
.L_12c:
    add r2, r3, #0x138
    cmp r6, r2
    bgt .L_154
    mov r1, r2
    cmp r6, r1
    bge .L_29c
    add r0, r3, #0x5e
    cmp r6, r0
    beq .L_1e8
    b .L_36c
.L_154:
    sub r0, r1, #0x2d8
    cmp r6, r0
    beq .L_1f0
    b .L_36c
.L_164:
    ldr r2, _LIT6
    cmp r6, r2
    bgt .L_1a4
    bge .L_344
    add r0, r1, #0x38
    cmp r6, r0
    bgt .L_194
    bge .L_330
    add r0, r1, #0x32
    cmp r6, r0
    beq .L_2fc
    b .L_36c
.L_194:
    sub r0, r2, #0x1
    cmp r6, r0
    beq .L_344
    b .L_36c
.L_1a4:
    add r0, r2, #0x2
    cmp r6, r0
    bgt .L_1c4
    bge .L_344
    add r0, r2, #0x1
    cmp r6, r0
    beq .L_344
    b .L_36c
.L_1c4:
    add r0, r2, #0x3
    cmp r6, r0
    bgt .L_1d8
    beq .L_344
    b .L_36c
.L_1d8:
    add r0, r2, #0x4
    cmp r6, r0
    beq .L_344
    b .L_36c
.L_1e8:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_1f0:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021b3314
    cmp r0, #0x0
    movgt r0, #0x1
    movle r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_20c:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c84a8
    ldrh r1, [r9, #0x8]
    cmp r0, r1
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_22c:
    cmp r0, #0xf
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_23c:
    cmp r0, #0x7
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_24c:
    cmp r0, #0xa
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_25c:
    cmp r0, #0x6
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_26c:
    cmp r0, #0x8
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_27c:
    cmp r0, #0x12
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_28c:
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_29c:
    ldrh r1, [r9, #0x8]
    cmp r0, r1
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2b0:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021b9ecc
    bl func_0202ee40
    cmp r0, #0x0
    beq .L_2f4
    mov r0, r9
    mov r1, #0x0
    bl func_ov002_0223de94
    and r2, r8, #0xff
    and r1, r7, #0xff
    orr r1, r2, r1, lsl #0x8
    mov r1, r1, lsl #0x10
    mov r1, r1, lsr #0x10
    cmp r1, r0
    movne r0, #0x1
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2f4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_2fc:
    ldr r0, _LIT7
    add r0, r0, r5
    ldrh r0, [r4, r0]
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c84e0
    cmp r0, #0x3
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_330:
    ldrh r2, [r9, #0x8]
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c93cc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_344:
    mov r0, r8
    mov r1, r7
    bl func_ov002_021c92ec
    mov r4, r0
    mov r0, r6
    bl func_0202b890
    cmp r4, r0
    movne r0, #0x1
    moveq r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_36c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word 0x00001945
_LIT4: .word 0x000014e4
_LIT5: .word 0x00001305
_LIT6: .word 0x00001b46
_LIT7: .word data_ov002_022cf1a2
