; func_ov002_021e2e80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022ce588
        .extern data_ov002_022d016c
        .extern func_ov002_021b1570
        .extern func_ov002_021b97d4
        .extern func_ov002_021e2e18
        .extern func_ov002_0229cd5c
        .global func_ov002_021e2e80
        .arm
func_ov002_021e2e80:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0xc
    mov r6, r2
    mov r4, r0
    mov r7, r1
    mov r5, r3
    movs r0, r6, asr #0x1
    bne .L_3c
    and r0, r7, #-2147483648
    mov r1, r7, lsl #0x10
    mov r0, r0, lsr #0x1f
    mov r1, r1, lsr #0x10
    bl func_ov002_021b97d4
    mov r0, r0, lsl #0x10
    mov r6, r0, lsr #0x10
.L_3c:
    mov r0, r7, lsl #0x10
    movs r9, r0, lsr #0x10
    addeq sp, sp, #0xc
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r0, _LIT0
    ldr r1, [r0, #0xd0c]
    cmp r1, #0x0
    beq .L_ac
    ldr r1, [r0, #0xcec]
    ldr r0, _LIT1
    ldr r0, [r0, r1, lsl #0x2]
    cmp r0, #0x2
    bne .L_ac
    mov r0, #0x14
    mov r9, r7, lsr #0x10
    mov r8, r5, lsr #0x10
    add r2, sp, #0x0
    sub r1, r0, #0x15
    mov r3, #0xc
    strh r4, [sp]
    strh r7, [sp, #0x2]
    strh r9, [sp, #0x4]
    strh r5, [sp, #0x6]
    strh r8, [sp, #0x8]
    strh r6, [sp, #0xa]
    bl func_ov002_021b1570
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_ac:
    cmp r4, #0x0
    beq .L_d4
    ldr r1, _LIT2
    ldr r3, _LIT3
    ldr r2, [r1, #0x480]
    mov r0, #0x18
    mla r4, r2, r0, r3
    add r0, r2, #0x1
    str r0, [r1, #0x480]
    b .L_140
.L_d4:
    ldr r8, _LIT2
    mov r4, #0x0
    ldr r2, [r8, #0x490]
    cmp r2, #0x0
    bls .L_128
    mov sl, r8
.L_ec:
    ldrh r0, [r8, #0x4]
    mov r0, r0, lsl #0x11
    cmp r6, r0, lsr #0x17
    ldreqh r0, [r8]
    cmpeq r0, r9
    bne .L_114
    bl func_ov002_021e2e18
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
.L_114:
    ldr r2, [sl, #0x490]
    add r4, r4, #0x1
    cmp r4, r2
    add r8, r8, #0x18
    bcc .L_ec
.L_128:
    ldr r1, _LIT2
    mov r0, #0x18
    mla r4, r2, r0, r1
    ldr r0, [r1, #0x490]
    add r0, r0, #0x1
    str r0, [r1, #0x490]
.L_140:
    mov r0, r4
    mov r1, #0x18
    bl func_ov002_0229cd5c
    strh r9, [r4]
    ldrh r2, [r4, #0x2]
    and r0, r7, #-2147483648
    mov r3, r0, lsr #0x1f
    bic r8, r2, #0x1
    and r2, r3, #0x1
    and r0, r7, #0x1000000
    orr r2, r8, r2
    mov r0, r0, lsr #0x18
    strh r2, [r4, #0x2]
    ldrh r2, [r4, #0x2]
    mov r0, r0, lsl #0x10
    mov r1, r0, lsr #0x10
    and r0, r7, #0xe00000
    mov r0, r0, lsr #0x15
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    and r3, r7, #0x1f0000
    mov r3, r3, lsr #0x10
    mov r3, r3, lsl #0x10
    mov r8, r3, lsr #0x10
    and r3, r7, #0x7e000000
    mov r3, r3, lsr #0x19
    mov r3, r3, lsl #0x10
    bic r2, r2, #0x4000
    mov r1, r1, lsl #0x1f
    orr r1, r2, r1, lsr #0x11
    strh r1, [r4, #0x2]
    ldrh r2, [r4, #0x2]
    mov r0, r0, lsl #0x1e
    mov r3, r3, lsr #0x10
    bic r2, r2, #0x3000
    orr r0, r2, r0, lsr #0x12
    strh r0, [r4, #0x2]
    ldrh r7, [r4, #0x2]
    mov r2, r3, lsl #0x1a
    mov r1, r8, lsl #0x1b
    bic r3, r7, #0x3e
    orr r1, r3, r1, lsr #0x1a
    strh r1, [r4, #0x2]
    ldrh r3, [r4, #0x2]
    ldr r0, _LIT4
    mov r1, r6, lsl #0x17
    bic r3, r3, #0xfc0
    orr r2, r3, r2, lsr #0x14
    strh r2, [r4, #0x2]
    ldrh r2, [r4, #0x4]
    and r0, r2, r0
    orr r0, r0, r1, lsr #0x11
    strh r0, [r4, #0x4]
    str r5, [r4, #0x14]
    add sp, sp, #0xc
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022d016c
_LIT1: .word data_ov002_022cd744
_LIT2: .word data_ov002_022ce288
_LIT3: .word data_ov002_022ce588
_LIT4: .word 0xffff803f
