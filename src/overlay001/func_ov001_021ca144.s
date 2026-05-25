; func_ov001_021ca144 — brief 207 / Phase 2: C-34 candidate. Vanilla
; brief 202 `.s` recipe — explicit `.word` per pool slot.
; Brief 204's patcher trim-protect handles relocation-tail
; cases.

        .text
        .extern data_ov001_021ca420
        .extern func_02005ca0
        .extern func_02005e20
        .extern func_ov000_021ab520
        .extern func_ov000_021ab5ac
        .extern func_ov000_021ab6cc
        .extern func_ov000_021ab8f8
        .extern func_ov001_021c9f24
        .global func_ov001_021ca144
        .arm
func_ov001_021ca144:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, .L_021ca2cc
    ldr r4, .L_021ca2d0
    ldr r0, [r0, #0x0]
    mov r5, #0x0
    mov r0, r0, lsl #0x18
    movs r0, r0, lsr #0x18
    beq .L_021ca170
    cmp r0, #0xa
    beq .L_021ca294
    b .L_021ca2a0
.L_021ca170:
    ldr r0, [r4, #0x0]
    mov r1, r0, lsl #0x10
    mov r6, r1, lsr #0x18
    cmp r6, #0x3c
    bgt .L_021ca1d4
    mov r0, r5
    mov r1, #0x1
    bl func_ov000_021ab520
    mov r0, #0x1
    mov r1, r0
    bl func_ov000_021ab520
    mov r1, r6, lsl #0x4
    ldr r2, .L_021ca2d4
    mov r0, r1, lsr #0x1f
    smull r1, r3, r2, r1
    add r3, r3, r6, lsl #0x4
    add r3, r0, r3, asr #0x5
    sub r7, r3, #0x10
    mov r1, r7
    mov r0, r5
    bl func_ov000_021ab5ac
    mov r1, r7
    mov r0, #0x1
    bl func_ov000_021ab5ac
    b .L_021ca274
.L_021ca1d4:
    cmp r6, #0xb4
    blt .L_021ca274
    cmp r6, #0xf0
    bgt .L_021ca238
    mov r0, r5
    mov r1, #0x1
    bl func_ov000_021ab520
    mov r0, #0x1
    mov r1, r0
    bl func_ov000_021ab520
    add r0, r6, #0x3c
    mov r0, r0, lsl #0x4
    rsb r3, r0, #0x0
    ldr r2, .L_021ca2d4
    mov r0, r3, lsr #0x1f
    smull r1, r7, r2, r3
    add r7, r3, r7
    add r7, r0, r7, asr #0x5
    mov r1, r7
    mov r0, r5
    bl func_ov000_021ab5ac
    mov r1, r7
    mov r0, #0x1
    bl func_ov000_021ab5ac
    b .L_021ca274
.L_021ca238:
    mov r0, r0, lsl #0x8
    mov r7, r0, lsr #0x18
    add r0, r7, #0x1
    cmp r0, #0x2
    movge r5, #0x1
    bge .L_021ca274
    bl func_ov001_021c9f24
    add r0, r7, #0x1
    ldr r1, [r4, #0x0]
    and r0, r0, #0xff
    bic r1, r1, #0xff0000
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x8
    str r0, [r4, #0x0]
    mov r6, r5
.L_021ca274:
    add r0, r6, #0x1
    ldr r1, [r4, #0x0]
    and r0, r0, #0xff
    bic r1, r1, #0xff00
    mov r0, r0, lsl #0x18
    orr r0, r1, r0, lsr #0x10
    str r0, [r4, #0x0]
    b .L_021ca2a0
.L_021ca294:
    bl func_ov000_021ab6cc
    cmp r0, #0x0
    movne r5, #0x1
.L_021ca2a0:
    mov r0, #0x1
    bl func_02005e20
    mov r0, #0x2
    bl func_02005e20
    mov r0, #0x1
    bl func_02005ca0
    mov r0, #0x2
    bl func_02005ca0
    bl func_ov000_021ab8f8 ; func_ov020_021ab8f8
    mov r0, r5
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_021ca2cc:
        .word   data_ov001_021ca420
.L_021ca2d0:
        .word   data_ov001_021ca420
.L_021ca2d4:
        .word   0x88888889
