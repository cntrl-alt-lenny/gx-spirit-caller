; func_ov010_021b4d6c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .extern data_ov010_021b90b4
        .extern data_ov010_021b9160
        .extern data_ov010_021b92d0
        .extern func_ov010_021b22f4
        .extern func_ov010_021b2380
        .extern func_ov010_021b2388
        .global func_ov010_021b4d6c
        .arm
func_ov010_021b4d6c:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r1, _LIT0
    ldr r4, _LIT1
    ldr r0, [r1, #0xd8]
    ldr r6, [r1, #0xb0]
    ldr r5, _LIT2
    bl func_ov010_021b2380
    ldr r1, _LIT0
    mov r7, r0
    ldr r0, [r1, #0xd8]
    bl func_ov010_021b2388
    ldr r2, _LIT3
    mov r1, #0x0
    cmp r0, #0x0
    ldrh r3, [r2, #0x54]
    movlt r0, r1
    tst r3, #0x2
    beq .L_58
    ldr r0, [r4, #0x220]
    orr r0, r0, #0x4
    str r0, [r4, #0x220]
    b .L_ec
.L_58:
    ldrh r3, [r2, #0x52]
    tst r3, #0x40
    beq .L_9c
    ldrsh r2, [r5, #0x48]
    cmp r2, r7
    ble .L_9c
    ldrh r0, [r5, #0x4c]
    mov r1, #0x1
    sub r0, r2, r0
    strh r0, [r5, #0x48]
    ldrsh r0, [r5, #0x48]
    cmp r0, r7
    ldrh r0, [r5, #0x4e]
    strlth r7, [r5, #0x48]
    add r0, r0, #0x1
    strh r0, [r5, #0x4e]
    b .L_ec
.L_9c:
    tst r3, #0x80
    beq .L_dc
    ldrsh r2, [r5, #0x48]
    cmp r2, r0
    bge .L_dc
    ldrh r1, [r5, #0x4c]
    add r1, r2, r1
    strh r1, [r5, #0x48]
    ldrsh r1, [r5, #0x48]
    cmp r1, r0
    strgth r0, [r5, #0x48]
    ldrh r0, [r5, #0x4e]
    mov r1, #0x1
    add r0, r0, #0x1
    strh r0, [r5, #0x4e]
    b .L_ec
.L_dc:
    mov r2, #0x1
    mov r0, #0x0
    strh r2, [r5, #0x4c]
    strh r0, [r5, #0x4e]
.L_ec:
    ldrh r0, [r5, #0x4e]
    cmp r0, #0xa
    bls .L_11c
    ldrh r2, [r5, #0x4c]
    mov r0, #0x0
    strh r0, [r5, #0x4e]
    add r0, r2, #0x1
    strh r0, [r5, #0x4c]
    ldrh r0, [r5, #0x4c]
    cmp r0, #0xc
    movhi r0, #0xc
    strhih r0, [r5, #0x4c]
.L_11c:
    cmp r1, #0x1
    bne .L_130
    ldrsh r1, [r5, #0x48]
    ldr r0, [r4, #0x2c]
    bl func_ov010_021b22f4
.L_130:
    ldr r1, [r4, #0x220]
    mov r0, r1, lsl #0x19
    mov r0, r0, lsr #0x1f
    cmp r0, #0x1
    bne .L_158
    ldr r0, _LIT3
    ldrh r0, [r0, #0x54]
    tst r0, #0x800
    orrne r0, r1, #0x8
    strne r0, [r4, #0x220]
.L_158:
    mov r0, r6
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov010_021b90b4
_LIT1: .word data_ov010_021b9160
_LIT2: .word data_ov010_021b92d0
_LIT3: .word data_02104acc
