; func_ov002_0224b5a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf09c
        .extern func_0202b824
        .extern func_0202e1e0
        .extern func_ov002_021b3ef8
        .extern func_ov002_02253370
        .global func_ov002_0224b5a4
        .arm
func_ov002_0224b5a4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r4, r0
    cmp r2, #0x0
    beq .L_24
    cmp r2, #0x1
    beq .L_cc
    cmp r2, #0x2
    beq .L_13c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_24:
    ldr r0, _LIT0
    and r2, r4, #0x1
    mul r1, r2, r0
    ldr r0, _LIT1
    mov r8, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT2
    ldr r6, _LIT3
    add sl, r0, r1
    add r9, sl, #0x260
    mov r5, #0xd
    mov r7, #0xb
.L_5c:
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_b4
    ldr r2, [r9]
    mov r0, r4
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov ip, r2, lsl #0x12
    mov r3, r1, lsl #0x1
    mov r1, r7
    mov r2, r6
    add r3, r3, ip, lsr #0x1f
    bl func_ov002_021b3ef8
    cmp r0, #0x0
    bne .L_b4
    mov r0, r4
    mov r1, r5
    mov r2, r8
    bl func_ov002_02253370
.L_b4:
    ldr r0, [sl, #0x10]
    add r8, r8, #0x1
    cmp r8, r0
    add r9, r9, #0x4
    bcc .L_5c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_cc:
    ldr r0, _LIT0
    and r2, r4, #0x1
    mul r1, r2, r0
    ldr r0, _LIT1
    mov r7, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT2
    mov r8, #0xd
    add r6, r0, r1
    add r5, r6, #0x260
.L_fc:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b824
    cmp r0, #0x16
    bne .L_124
    mov r0, r4
    mov r1, r8
    mov r2, r7
    bl func_ov002_02253370
.L_124:
    ldr r0, [r6, #0x10]
    add r7, r7, #0x1
    cmp r7, r0
    add r5, r5, #0x4
    bcc .L_fc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_13c:
    ldr r0, _LIT0
    and r2, r4, #0x1
    mul r1, r2, r0
    ldr r0, _LIT1
    mov r7, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT2
    mov r8, #0xd
    add r6, r0, r1
    add r5, r6, #0x260
.L_16c:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b824
    cmp r0, #0x17
    bne .L_194
    mov r0, r4
    mov r1, r8
    mov r2, r7
    bl func_ov002_02253370
.L_194:
    ldr r0, [r6, #0x10]
    add r7, r7, #0x1
    cmp r7, r0
    add r5, r5, #0x4
    bcc .L_16c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x000012a1
