; func_ov002_021e1830 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf09c
        .extern data_ov002_022cf0a4
        .extern func_0202df24
        .extern func_ov002_021d46ac
        .extern func_ov002_02244efc
        .global func_ov002_021e1830
        .arm
func_ov002_021e1830:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov sl, r0
    ldr r0, _LIT0
    and r4, sl, #0x1
    mul r0, r4, r0
    ldr r4, _LIT1
    str r0, [sp]
    ldr r0, [r4, r0]
    mov r5, #0x0
    mov r9, r1
    mov r8, r2
    mov r7, r3
    mov r4, r5
    cmp r0, #0x0
    bls .L_e4
    ldr r1, _LIT2
    ldr r0, [sp]
    add fp, r1, r0
    add r6, fp, #0x260
.L_4c:
    ldr r0, [r6]
    mov r1, r9
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df24
    cmp r0, #0x0
    beq .L_d0
    cmp r8, #0x0
    bne .L_78
    cmp r5, #0x0
    bne .L_e4
.L_78:
    ldr ip, [r6]
    cmp r7, #0x0
    movne r1, #0x1
    moveq r1, #0x0
    mov r3, ip, lsl #0x12
    mov ip, ip, lsl #0x2
    cmp sl, #0x0
    movne r0, #0x8000
    mov ip, ip, lsr #0x18
    moveq r0, #0x0
    mov ip, ip, lsl #0x1
    orr r0, r0, #0x33
    add r3, ip, r3, lsr #0x1f
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r1, #0xd
    mov r3, r3, lsr #0x10
    add r5, r5, #0x1
    bl func_ov002_021d46ac
.L_d0:
    add r6, r6, #0x4
    add r4, r4, #0x1
    ldr r0, [fp, #0x10]
    cmp r4, r0
    bcc .L_4c
.L_e4:
    ldr r1, _LIT3
    ldr r0, [sp]
    mov r6, #0x0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    bls .L_1a4
    ldr r1, _LIT2
    ldr r0, [sp]
    add fp, r1, r0
    add r4, fp, #0x3a0
.L_10c:
    ldr r0, [r4]
    mov r1, r9
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202df24
    cmp r0, #0x0
    beq .L_190
    cmp r8, #0x0
    bne .L_138
    cmp r5, #0x0
    bne .L_1a4
.L_138:
    ldr ip, [r4]
    cmp r7, #0x0
    movne r1, #0x1
    moveq r1, #0x0
    mov r3, ip, lsl #0x12
    mov ip, ip, lsl #0x2
    cmp sl, #0x0
    movne r0, #0x8000
    mov ip, ip, lsr #0x18
    moveq r0, #0x0
    mov ip, ip, lsl #0x1
    orr r0, r0, #0x33
    add r3, ip, r3, lsr #0x1f
    mov r0, r0, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r3, r3, lsl #0x10
    mov r2, r1, lsr #0x10
    mov r0, r0, lsr #0x10
    mov r1, #0xc
    mov r3, r3, lsr #0x10
    add r5, r5, #0x1
    bl func_ov002_021d46ac
.L_190:
    ldr r0, [fp, #0x18]
    add r4, r4, #0x4
    add r6, r6, #0x1
    cmp r6, r0
    bcc .L_10c
.L_1a4:
    cmp r5, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, #0x24
    mov r1, #0x0
    bl func_ov002_02244efc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022cf0a4
