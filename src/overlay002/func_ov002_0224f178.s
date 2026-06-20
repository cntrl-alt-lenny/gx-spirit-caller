; func_ov002_0224f178 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern func_0202b878
        .extern func_0202b8a8
        .extern func_0202e234
        .extern func_ov002_021c33e4
        .extern func_ov002_021ca5bc
        .extern func_ov002_02253458
        .global func_ov002_0224f178
        .arm
func_ov002_0224f178:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    ldr r1, _LIT0
    mov r7, r0
    ldr r0, [r1, #0x48c]
    mov r6, r2
    ldrh r4, [r0, #0xc]
    ldr r0, _LIT1
    cmp r4, #0x0
    bne .L_13c
    and r1, r7, #0x1
    mul r8, r1, r0
    ldr r0, _LIT2
    add r9, r0, r8
    add r0, r9, r6, lsl #0x2
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov r5, r0, lsr #0x13
    mov r0, r5
    bl func_0202e234
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, r5
    bl func_0202b878
    cmp r0, #0x2
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, r5
    bl func_0202b8a8
    cmp r0, #0x1
    ldmleia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT2
    add r4, r0, r8
    add r0, r4, #0x120
    ldr r1, [r0, r6, lsl #0x2]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    bl func_ov002_021ca5bc
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, r5
    bl func_0202b8a8
    ldr r1, _LIT3
    mov r5, r0
    ldr r0, [r1, r8]
    mov r8, #0x0
    cmp r0, #0x0
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    add r0, r9, #0x18
    add r9, r0, #0x400
.L_cc:
    ldr r0, [r9]
    mov r0, r0, lsl #0x13
    mov sl, r0, lsr #0x13
    mov r0, sl
    bl func_0202b878
    cmp r0, #0x2
    bne .L_124
    mov r0, sl
    bl func_0202b8a8
    cmp r0, r5
    bge .L_124
    mov r0, r7
    mov r1, r7
    mov r2, r8
    bl func_ov002_021c33e4
    cmp r0, #0x0
    beq .L_124
    mov r0, r7
    mov r2, r6
    mov r1, #0xb
    bl func_ov002_02253458
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_124:
    ldr r0, [r4, #0x14]
    add r8, r8, #0x1
    cmp r8, r0
    add r9, r9, #0x4
    bcc .L_cc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_13c:
    and r2, r7, #0x1
    mul r1, r2, r0
    ldr r0, _LIT3
    mov r5, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    ldmlsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT2
    mov r9, #0xe
    add r8, r0, r1
    add r0, r8, #0x18
    add r6, r0, #0x400
.L_16c:
    ldr r0, [r6]
    mov r0, r0, lsl #0x13
    mov sl, r0, lsr #0x13
    mov r0, sl
    bl func_0202e234
    cmp r0, #0x0
    beq .L_1d0
    mov r0, sl
    bl func_0202b878
    cmp r0, #0x2
    bne .L_1d0
    mov r0, sl
    bl func_0202b8a8
    cmp r0, r4
    bge .L_1d0
    mov r0, r7
    mov r1, r7
    mov r2, r5
    bl func_ov002_021c33e4
    cmp r0, #0x0
    beq .L_1d0
    mov r0, r7
    mov r1, r9
    mov r2, r5
    bl func_ov002_02253458
.L_1d0:
    ldr r0, [r8, #0x14]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x4
    bcc .L_16c
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cf180
