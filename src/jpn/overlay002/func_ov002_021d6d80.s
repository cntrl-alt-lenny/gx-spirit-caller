; func_ov002_021d6d80 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf0c4
        .extern data_ov002_022cf0c6
        .extern data_ov002_022cf0c8
        .extern data_ov002_022d0570
        .extern func_ov002_021b9dec
        .extern func_ov002_021d8fd0
        .extern func_ov002_021d9054
        .extern func_ov002_021e2fc4
        .global func_ov002_021d6d80
        .arm
func_ov002_021d6d80:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
    sub sp, sp, #0xc
    mov r3, r0, asr #0x8
    and r7, r0, #0xff
    and r0, r1, #0xff
    mov r2, r1, asr #0x8
    str r0, [sp, #0x4]
    cmp r7, r0
    and r0, r3, #0xff
    str r0, [sp, #0x8]
    and r0, r2, #0xff
    str r0, [sp]
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r4, _LIT0
    and r0, r7, #0x1
    mul sl, r0, r4
    ldr r0, [sp, #0x8]
    mov r1, #0x14
    mul r9, r0, r1
    ldr r2, _LIT1
    add r0, r2, sl
    ldrh r0, [r9, r0]
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT2
    add r0, r0, sl
    ldrh r8, [r9, r0]
    cmp r8, #0x0
    beq .L_ec
    ldr r5, _LIT3
    ldr r6, _LIT4
    ldr fp, _LIT5
.L_88:
    mov r0, r8, lsl #0x3
    ldrh r1, [r6, r0]
    add r0, r6, r8, lsl #0x3
    ldrh r2, [r0, #0x2]
    ldrh r8, [r0, #0x6]
    and r0, r1, #0xff
    mov r2, r2, lsl #0x1c
    mov r1, r1, asr #0x8
    mov r2, r2, lsr #0x1c
    and r1, r1, #0xff
    cmp r2, #0xa
    bne .L_e4
    and r2, r0, #0x1
    mla r3, r2, r4, r5
    mov r2, #0x14
    mla r2, r1, r2, r3
    ldr r2, [r2, #0x30]
    mov r2, r2, lsl #0x13
    mov r2, r2, lsr #0x13
    cmp r2, fp
    bne .L_e4
    mov r2, #0x0
    bl func_ov002_021d9054
.L_e4:
    cmp r8, #0x0
    bne .L_88
.L_ec:
    ldr r1, [sp, #0x8]
    mov r0, r7
    bl func_ov002_021b9dec
    ldr r1, _LIT6
    cmp r0, r1
    addne r1, r1, #0x3f
    cmpne r0, r1
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp]
    cmp r0, #0x5
    addge sp, sp, #0xc
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, _LIT7
    add r0, r0, sl
    ldr r0, [r9, r0]
    cmp r0, #0x0
    addne sp, sp, #0xc
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT3
    mov r0, r7
    add r2, r1, sl
    ldr r1, [sp, #0x8]
    add r4, r2, #0x30
    bl func_ov002_021b9dec
    ldr r3, [r4, r9]
    ldr r1, [sp, #0x4]
    mov r0, r0, lsl #0x10
    mov r4, r1, lsl #0x1f
    mov r1, r3, lsl #0x2
    mov r2, r1, lsr #0x18
    ldr r1, [sp]
    and r5, r4, #-2147483648
    mov r4, r1, lsl #0x10
    mov r1, r2, lsl #0x1
    mov r3, r3, lsl #0x12
    add r1, r1, r3, lsr #0x1f
    mov r1, r1, lsl #0x10
    orr r3, r5, #0x200000
    and r2, r4, #0x1f0000
    orr r2, r3, r2
    orr r0, r2, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, #0x0
    bl func_ov002_021e2fc4
    cmp r0, #0x0
    addeq sp, sp, #0xc
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r0, [sp, #0x4]
    ldr r1, [sp]
    mov r2, #0x1
    bl func_ov002_021d8fd0
    add sp, sp, #0xc
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c4
_LIT2: .word data_ov002_022cf0c6
_LIT3: .word data_ov002_022cf08c
_LIT4: .word data_ov002_022d0570
_LIT5: .word 0x0000149d
_LIT6: .word 0x0000118a
_LIT7: .word data_ov002_022cf0c8
