; func_ov002_022209b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd744
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern func_ov002_021ae400
        .extern func_ov002_021de4b0
        .extern func_ov002_0225764c
        .extern func_ov002_022577dc
        .extern func_ov002_0225935c
        .extern func_ov002_022593f4
        .global func_ov002_022209b4
        .arm
func_ov002_022209b4:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r8, r0
    ldrh r2, [r8, #0x4]
    mov r1, r2, lsl #0x1d
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r1, [r8, #0x2]
    mov r3, r2, lsl #0x11
    ldr r5, _LIT0
    mov r2, r1, lsl #0x1f
    mov r4, r2, lsr #0x1f
    mov r2, r1, lsl #0x1a
    ldr r1, _LIT1
    and r4, r4, #0x1
    mla r5, r4, r1, r5
    mov r2, r2, lsr #0x1b
    mov r1, #0x14
    mul r1, r2, r1
    add r2, r5, #0x30
    ldr r2, [r2, r1]
    mov r3, r3, lsr #0x17
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    cmp r3, r1
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r1, [r8, #0x8]
    cmp r1, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r1, _LIT2
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7f
    beq .L_170
    cmp r1, #0x80
    bne .L_1a4
    bl func_ov002_022577dc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldrh r0, [r8, #0x2]
    ldr r1, _LIT3
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    ldr r1, [r1, r0, lsl #0x2]
    cmp r1, #0x1
    bne .L_148
    mov r7, #0x0
    mov r4, r7
    mov r5, #0x1
    mov r9, r7
.L_dc:
    ldrh r0, [r8, #0x2]
    cmp r7, #0x0
    moveq r1, r5
    movne r1, r4
    mov r0, r0, lsl #0x1f
    mov r6, r9
    eor sl, r1, r0, lsr #0x1f
.L_f8:
    mov r0, r8
    mov r1, sl
    mov r2, r6
    bl func_ov002_0225764c
    cmp r0, #0x0
    beq .L_128
    mov r0, r8
    mov r1, sl
    mov r2, r6
    bl func_ov002_021de4b0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_128:
    add r6, r6, #0x1
    cmp r6, #0x4
    ble .L_f8
    add r7, r7, #0x1
    cmp r7, #0x2
    blt .L_dc
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_148:
    mov r1, #0x6d
    bl func_ov002_021ae400
    ldrh r0, [r8, #0x2]
    ldrh r1, [r8]
    ldr r2, _LIT4
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0225935c
    mov r0, #0x7f
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_170:
    bl func_ov002_022593f4
    cmp r0, #0x0
    moveq r0, #0x80
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r1, _LIT5
    mov r0, r8
    ldr r3, [r1, #0xd74]
    ldr r2, [r1, #0xd78]
    ldr r1, [r1, #0xd70]
    add r2, r3, r2
    bl func_ov002_021de4b0
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_1a4:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022cf16c
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022ce288
_LIT3: .word data_ov002_022cd744
_LIT4: .word func_ov002_0225764c
_LIT5: .word data_ov002_022d016c
