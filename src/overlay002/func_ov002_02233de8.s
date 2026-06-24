; func_ov002_02233de8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern func_ov002_021ae400
        .extern func_ov002_021ba294
        .extern func_ov002_021d8288
        .extern func_ov002_021e286c
        .extern func_ov002_021e2b3c
        .extern func_ov002_021e2c5c
        .extern func_ov002_0226b054
        .global func_ov002_02233de8
        .arm
func_ov002_02233de8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r1, _LIT0
    mov r7, r0
    ldr r0, [r1, #0x5a8]
    cmp r0, #0x64
    beq .L_158
    cmp r0, #0x6f
    beq .L_13c
    cmp r0, #0x80
    bne .L_170
    ldrh r0, [r7, #0x2]
    ldr r1, _LIT1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ba294
    ldrh r2, [r7, #0x2]
    mov r4, r0
    ldr r1, _LIT2
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ba294
    ldrh r2, [r7, #0x2]
    mov r5, r0
    ldr r1, _LIT3
    mov r0, r2, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ba294
    cmp r4, #0x0
    mov r6, r0
    cmpge r5, #0x0
    cmpge r6, #0x0
    blt .L_120
    bl func_ov002_021e2b3c
    cmp r4, #0x0
    blt .L_b4
    ldrh r0, [r7, #0x2]
    ldr r3, _LIT4
    ldr r1, _LIT5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x260
    add r1, r1, r4, lsl #0x2
    bl func_ov002_021d8288
.L_b4:
    cmp r5, #0x0
    blt .L_e4
    ldrh r0, [r7, #0x2]
    ldr r3, _LIT4
    ldr r1, _LIT5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x260
    add r1, r1, r5, lsl #0x2
    bl func_ov002_021d8288
.L_e4:
    cmp r6, #0x0
    blt .L_114
    ldrh r0, [r7, #0x2]
    ldr r3, _LIT4
    ldr r1, _LIT5
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    and r2, r0, #0x1
    mla r1, r2, r1, r3
    add r1, r1, #0x260
    add r1, r1, r6, lsl #0x2
    bl func_ov002_021d8288
.L_114:
    bl func_ov002_021e2c5c
    mov r0, #0x64
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_120:
    ldrh r0, [r7, #0x2]
    mov r1, #0x15
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021ae400
    mov r0, #0x6f
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_13c:
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b054
    mov r0, #0x64
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_158:
    ldrh r0, [r7, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e286c
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_170:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00001681
_LIT2: .word 0x000016b3
_LIT3: .word 0x000016b4
_LIT4: .word data_ov002_022cf16c
_LIT5: .word 0x00000868
