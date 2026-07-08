; func_ov002_022334e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf09c
        .extern func_0202e1e0
        .extern func_02030584
        .extern func_ov002_021bc538
        .extern func_ov002_021c97ac
        .extern func_ov002_021ca1d8
        .extern func_ov002_021ca360
        .extern func_ov002_021d81a8
        .extern func_ov002_021d86ec
        .extern func_ov002_021e1304
        .extern func_ov002_021e2728
        .extern func_ov002_021e2c30
        .extern func_ov002_0227acc8
        .global func_ov002_022334e8
        .arm
func_ov002_022334e8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r0
    ldrh r0, [r5, #0x2]
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r3, r0, #0x1
    mul r4, r3, r1
    ldr r1, [r2, r4]
    cmp r1, #0x0
    beq .L_18c
    ldr r2, _LIT2
    mov r1, #0xd
    add r2, r2, r4
    ldr r3, [r2, #0x260]
    mov r2, #0x0
    mov r3, r3, lsl #0x13
    mov r4, r3, lsr #0x13
    bl func_ov002_021c97ac
    cmp r0, #0x0
    bne .L_70
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e2728
.L_70:
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021d86ec
    mov r0, r4
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_144
    mov r0, r4
    bl func_02030584
    cmp r0, #0x0
    beq .L_144
    ldrh r0, [r5, #0x2]
    mov r1, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca360
    cmp r0, #0x0
    beq .L_144
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x0
    beq .L_124
    ldrh r0, [r5, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ca1d8
    cmp r0, #0x0
    beq .L_124
    ldrh r0, [r5, #0x2]
    ldr r3, _LIT2
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r2, r0, #0x1
    and r2, r2, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x260
    mov r2, #0x1
    mov r3, #0x0
    bl func_ov002_0227acc8
    b .L_18c
.L_124:
    ldrh r0, [r5, #0x2]
    mov r1, #0x1
    mov r2, r1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e1304
    b .L_18c
.L_144:
    ldrh r0, [r5, #0x2]
    ldr r3, _LIT2
    ldr r1, _LIT0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x260
    mov r2, #0x0
    bl func_ov002_021d81a8
    ldrh r0, [r5, #0x2]
    mov r1, #0x2
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e2c30
.L_18c:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf09c
_LIT2: .word data_ov002_022cf08c
