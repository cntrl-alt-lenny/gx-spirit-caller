; func_ov002_02286c9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022ce884
        .extern data_ov002_022cf178
        .extern data_ov002_022d0250
        .extern func_0202b8a8
        .extern func_0202b8f0
        .extern func_0203058c
        .extern func_ov002_02280a1c
        .extern func_ov002_02281a74
        .global func_ov002_02286c9c
        .arm
func_ov002_02286c9c:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    sub sp, sp, #0x8
    mov r4, r0
    ldrh r0, [r4, #0x2]
    ldr r1, _LIT0
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r3, r0, #0x1
    mul r1, r3, r1
    ldr r1, [r2, r1]
    cmp r1, #0x2
    addhi sp, sp, #0x8
    movhi r0, #0x0
    ldmhiia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    bl func_ov002_02281a74
    cmp r0, #0x0
    addeq sp, sp, #0x8
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r0, [r4, #0x2]
    add r1, sp, #0x4
    add r2, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    mov r3, #0x1
    bl func_ov002_02280a1c
    ldr r6, _LIT2
    mov r5, #0x0
    ldr r0, [r6, #0x5d4]
    cmp r0, #0x0
    bls .L_130
    ldr r7, _LIT3
    ldr r4, _LIT4
    ldr r8, _LIT5
    mov r9, r6
.L_94:
    ldrb r0, [r6, #0x5dc]
    cmp r0, #0x16
    bne .L_118
    ldr r0, [r7]
    mov r0, r0, lsl #0x17
    mov r0, r0, lsr #0x15
    ldrh r0, [r4, r0]
    mov r0, r0, lsl #0x13
    mov sl, r0, lsr #0x13
    mov r0, sl
    bl func_0202b8a8
    cmp r0, #0x4
    addgt sp, sp, #0x8
    movgt r0, #0x1
    ldmgtia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, sl
    bl func_0203058c
    cmp r0, #0x0
    addne sp, sp, #0x8
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, sl
    bl func_0202b8f0
    cmp r0, r8
    ble .L_118
    mov r0, sl
    bl func_0202b8f0
    ldr r1, [sp, #0x4]
    add r0, r0, #0x320
    cmp r0, r1
    addge sp, sp, #0x8
    movge r0, #0x1
    ldmgeia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_118:
    ldr r0, [r9, #0x5d4]
    add r5, r5, #0x1
    cmp r5, r0
    add r6, r6, #0x1
    add r7, r7, #0x4
    bcc .L_94
.L_130:
    mov r0, #0x0
    add sp, sp, #0x8
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf178
_LIT2: .word data_ov002_022ce288
_LIT3: .word data_ov002_022ce884
_LIT4: .word data_ov002_022d0250
_LIT5: .word 0x00000578
