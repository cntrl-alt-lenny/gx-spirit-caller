; func_ov002_02292a9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf098
        .extern data_ov002_022cf1a8
        .extern func_0202e1e0
        .extern func_02030538
        .extern func_ov002_021bc538
        .extern func_ov002_021bca30
        .extern func_ov002_021c37e4
        .extern func_ov002_0227d570
        .global func_ov002_02292a9c
        .arm
func_ov002_02292a9c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r8, r0
    ldrh r0, [r8, #0x2]
    mov r1, #0x0
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bca30
    cmp r0, #0x0
    ble .L_15c
    ldrh r0, [r8, #0x2]
    ldr r9, _LIT0
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mul r0, r2, r9
    ldr r1, [r1, r0]
    mov r1, r1, lsr #0x11
    tst r1, #0x1
    bne .L_15c
    ldr r1, _LIT2
    mov r6, #0x0
    ldr r1, [r1, r0]
    cmp r1, #0x0
    bls .L_15c
    ldr r5, _LIT3
    mov r7, r6
    mov r4, #0x1
.L_78:
    add r0, r5, r0
    add r0, r0, r7
    ldr r0, [r0, #0x120]
    mov r0, r0, lsl #0x13
    mov sl, r0, lsr #0x13
    mov r0, sl
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_130
    mov r0, sl
    bl func_02030538
    cmp r0, #0x0
    bne .L_130
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bc538
    cmp r0, #0x0
    beq .L_130
    ldrh r0, [r8, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mla r2, r1, r9, r5
    add r1, r2, #0x120
    ldr r2, [r1, r7]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021c37e4
    cmp r0, #0x7
    blt .L_124
    ldrh r0, [r8, #0x2]
    mov r1, r4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0227d570
    cmp r0, #0x0
    blt .L_130
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_124:
    cmp r0, #0x5
    movge r0, #0x1
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_130:
    ldrh r0, [r8, #0x2]
    add r6, r6, #0x1
    add r7, r7, #0x4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r1, r0, #0x1
    mul r0, r1, r9
    add r1, r5, r0
    ldr r1, [r1, #0xc]
    cmp r6, r1
    bcc .L_78
.L_15c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf1a8
_LIT2: .word data_ov002_022cf098
_LIT3: .word data_ov002_022cf08c
