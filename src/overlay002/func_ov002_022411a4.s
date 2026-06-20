; func_ov002_022411a4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_0202b100
        .extern func_ov002_021ae400
        .extern func_ov002_0223dcc0
        .extern func_ov002_0223de94
        .extern func_ov002_022410f0
        .extern func_ov002_022575c8
        .extern func_ov002_022577dc
        .extern func_ov002_02257878
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .extern func_ov002_0229ce5c
        .global func_ov002_022411a4
        .arm
func_ov002_022411a4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    sub sp, sp, #0x100
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5b8]
    cmp r1, #0x3
    addls pc, pc, r1, lsl #0x2
    b .L_234
    b .L_30
    b .L_1d4
    b .L_8c
    b .L_1d4
.L_30:
    bl func_ov002_022577dc
    cmp r0, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r0, [r4, #0x2]
    mov r1, #0x8b
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_8c:
    ldr r1, _LIT2
    bl func_ov002_02257878
    cmp r0, #0x0
    addeq sp, sp, #0x100
    moveq r0, #0x1
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT3
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    ldr r0, [r0, r1, lsl #0x2]
    mov r1, #0x0
    cmp r0, #0x1
    mov r0, r4
    bne .L_13c
    bl func_ov002_0223de94
    and r0, r0, #0xff
    mov r8, #0x0
    eor r6, r0, #0x1
    mov r5, r8
.L_dc:
    mov r7, r5
.L_e0:
    mov r0, r4
    mov r1, r6
    mov r2, r7
    bl func_ov002_022410f0
    cmp r0, #0x0
    beq .L_114
    mov r0, r4
    mov r1, r6
    mov r2, r7
    bl func_ov002_0223dcc0
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_114:
    add r7, r7, #0x1
    cmp r7, #0x4
    ble .L_e0
    add r8, r8, #0x1
    cmp r8, #0x2
    eor r6, r6, #0x1
    blt .L_dc
    add sp, sp, #0x100
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_13c:
    bl func_ov002_0223de94
    and r3, r0, #0xff
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r0, asr #0x8
    ldr r0, _LIT4
    ldr r2, _LIT5
    and r3, r3, #0x1
    mla r2, r3, r0, r2
    and r1, r1, #0xff
    mov r0, #0x14
    mla r0, r1, r0, r2
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b100
    mov r2, r0
    add r0, sp, #0x0
    mov r1, #0x8c
    bl func_ov002_0229ce5c
    ldrh r0, [r4, #0x2]
    add r1, sp, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    ldr r2, _LIT2
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_1d4:
    bl func_ov002_022593f4
    cmp r0, #0x0
    beq .L_218
    ldr r1, _LIT6
    mov r0, r4
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_0223dcc0
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_218:
    ldr r1, _LIT0
    add sp, sp, #0x100
    ldr r2, [r1, #0x5b8]
    mov r0, #0x0
    sub r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
.L_234:
    mov r0, #0x1
    add sp, sp, #0x100
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word func_ov002_022575c8
_LIT2: .word func_ov002_022410f0
_LIT3: .word data_ov002_022cd744
_LIT4: .word 0x00000868
_LIT5: .word data_ov002_022cf16c
_LIT6: .word data_ov002_022d016c
