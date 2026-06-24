; func_ov002_021e8dd4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a4
        .extern data_ov002_022d0250
        .extern func_0202b8f0
        .extern func_0202e2c8
        .extern func_0202e2e0
        .extern func_ov002_021c1e44
        .extern func_ov002_021c1ef0
        .extern func_ov002_021c2084
        .extern func_ov002_021c8470
        .extern func_ov002_021c84a8
        .extern func_ov002_021c8940
        .global func_ov002_021e8dd4
        .arm
func_ov002_021e8dd4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r6, r1
    ldr r3, _LIT0
    and r7, r6, #0x1
    mov r5, r2
    mov r4, #0x14
    mul r3, r7, r3
    mul ip, r5, r4
    ldr r7, _LIT1
    cmp r5, #0x5
    add r4, r7, r3
    add r4, r4, ip
    ldr r4, [r4, #0x30]
    mov r7, r0
    mov r4, r4, lsl #0x13
    mov r4, r4, lsr #0x13
    movge r0, #0x0
    ldmgeia sp!, {r3, r4, r5, r6, r7, pc}
    cmp r4, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldr lr, _LIT2
    add r3, lr, r3
    ldrh r3, [ip, r3]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    bl func_ov002_021c1ef0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r7
    mov r1, r6
    mov r2, r5
    mov r3, #0x0
    bl func_ov002_021c2084
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r7
    mov r1, r6
    mov r2, r5
    bl func_ov002_021c1e44
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r2, [r7]
    ldr r0, _LIT3
    cmp r2, r0
    bgt .L_dc
    bge .L_120
    ldr r0, _LIT4
    cmp r2, r0
    beq .L_104
    b .L_1d4
.L_dc:
    ldr r1, _LIT5
    cmp r2, r1
    bgt .L_1d4
    sub r0, r1, #0x1
    cmp r2, r0
    blt .L_1d4
    beq .L_1bc
    cmp r2, r1
    beq .L_1c8
    b .L_1d4
.L_104:
    mov r0, r6
    mov r1, r5
    bl func_ov002_021c8940
    cmp r0, #0x1
    moveq r0, #0x1
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_120:
    ldrh r1, [r7, #0x2]
    ldrh r4, [r7, #0x4]
    ldr r3, _LIT1
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r7, r1, lsl #0x1a
    ldr r1, _LIT0
    and r2, r0, #0x1
    mla r3, r2, r1, r3
    mov r1, r7, lsr #0x1b
    mov r2, #0x14
    mul r2, r1, r2
    add r3, r3, #0x30
    ldr r3, [r3, r2]
    mov r4, r4, lsl #0x11
    mov r2, r3, lsl #0x2
    mov r2, r2, lsr #0x18
    mov r3, r3, lsl #0x12
    mov r2, r2, lsl #0x1
    mov r4, r4, lsr #0x17
    add r2, r2, r3, lsr #0x1f
    cmp r4, r2
    beq .L_198
    ldr r0, _LIT6
    mov r1, r4, lsl #0x2
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8f0
    b .L_19c
.L_198:
    bl func_ov002_021c8470
.L_19c:
    mov r4, r0
    mov r0, r6
    mov r1, r5
    bl func_ov002_021c84a8
    cmp r0, r4
    movle r0, #0x1
    movgt r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1bc:
    mov r0, r4
    bl func_0202e2c8
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1c8:
    mov r0, r4
    bl func_0202e2e0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_1d4:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf16c
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word 0x000014c5
_LIT4: .word 0x0000119a
_LIT5: .word 0x00001b64
_LIT6: .word data_ov002_022d0250
