; func_ov002_02225d64 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd664
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf09c
        .extern data_ov002_022d008c
        .extern func_0202b824
        .extern func_0202e1e0
        .extern func_ov002_021ae434
        .extern func_ov002_021c97ac
        .extern func_ov002_021d86ec
        .extern func_ov002_021df64c
        .extern func_ov002_021e2728
        .extern func_ov002_021e277c
        .extern func_ov002_0226afe0
        .global func_ov002_02225d64
        .arm
func_ov002_02225d64:
    stmdb sp!, {r4, lr}
    sub sp, sp, #0x8
    ldr r1, _LIT0
    mov r4, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x64
    bgt .L_24
    beq .L_238
    b .L_254
.L_24:
    sub r0, r0, #0x7d
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_254
    b .L_150
    b .L_f4
    b .L_c4
    b .L_44
.L_44:
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT2
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    and r2, r3, #0x1
    mul r0, r2, r0
    ldr r0, [r1, r0]
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, _LIT3
    ldr r0, [r0, r3, lsl #0x2]
    cmp r0, #0x1
    bne .L_94
    ldr r0, _LIT4
    mov r1, #0x0
    str r1, [r0, #0xd44]
    b .L_b8
.L_94:
    mov r1, #0x1b8
    mov r0, #0x0
    str r0, [sp]
    mov r4, #0xf
    add r2, r1, #0x1
    add r3, r1, #0x2
    mov r0, #0x104
    str r4, [sp, #0x4]
    bl func_ov002_021ae434
.L_b8:
    add sp, sp, #0x8
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_c4:
    ldr r0, _LIT4
    ldr r2, [r0, #0xd44]
    str r2, [r1, #0x5ac]
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226afe0
    add sp, sp, #0x8
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_f4:
    ldrh r0, [r4, #0x2]
    mov r1, #0xd
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021c97ac
    cmp r0, #0x0
    bne .L_144
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e2728
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021d86ec
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e2728
.L_144:
    add sp, sp, #0x8
    mov r0, #0x7d
    ldmia sp!, {r4, pc}
.L_150:
    ldrh r2, [r4, #0x2]
    ldr r1, [r1, #0x5ac]
    ldr r0, _LIT1
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    ldr r2, _LIT5
    and r3, r3, #0x1
    mla r0, r3, r0, r2
    ldr r0, [r0, #0x260]
    cmp r1, #0x0
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    beq .L_198
    cmp r1, #0x1
    beq .L_1b0
    cmp r1, #0x2
    beq .L_1c8
    b .L_1dc
.L_198:
    bl func_0202e1e0
    cmp r0, #0x0
    bne .L_1dc
    add sp, sp, #0x8
    mov r0, #0x64
    ldmia sp!, {r4, pc}
.L_1b0:
    bl func_0202b824
    cmp r0, #0x16
    beq .L_1dc
    add sp, sp, #0x8
    mov r0, #0x64
    ldmia sp!, {r4, pc}
.L_1c8:
    bl func_0202b824
    cmp r0, #0x17
    addne sp, sp, #0x8
    movne r0, #0x64
    ldmneia sp!, {r4, pc}
.L_1dc:
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT1
    ldr r2, _LIT5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r3, r0, #0x1
    and r3, r3, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    bl func_ov002_021df64c
    ldrh r2, [r4, #0x2]
    ldr r0, _LIT1
    ldr r1, _LIT5
    mov r2, r2, lsl #0x1f
    mov r3, r2, lsr #0x1f
    and r2, r3, #0x1
    mul r0, r2, r0
    ldr r1, [r1, r0]
    rsb r0, r3, #0x1
    bl func_ov002_021df64c
    add sp, sp, #0x8
    mov r0, #0x64
    ldmia sp!, {r4, pc}
.L_238:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e277c
    add sp, sp, #0x8
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_254:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf09c
_LIT3: .word data_ov002_022cd664
_LIT4: .word data_ov002_022d008c
_LIT5: .word data_ov002_022cf08c
