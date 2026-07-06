; func_ov002_02203dc4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022ce640
        .extern data_ov002_022cf08c
        .extern func_0202e748
        .extern func_ov002_021b9dec
        .extern func_ov002_021ff37c
        .extern func_ov002_0223dda4
        .global func_ov002_02203dc4
        .arm
func_ov002_02203dc4:
    stmdb sp!, {r4, r5, r6, r7, r8, lr}
    movs r6, r1
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldr r2, _LIT0
    ldr r3, _LIT1
    ldr r2, [r2, #0x494]
    mov r4, #0x0
    mov r2, r2, lsl #0x19
    mov r2, r2, lsr #0x18
    strh r4, [r3, r2]
    bl func_ov002_021ff37c
    cmp r0, #0x0
    moveq r0, r4
    ldmeqia sp!, {r4, r5, r6, r7, r8, pc}
    ldrh r0, [r6, #0x6]
    mov r5, r4
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x0
    ble .L_c8
    ldr r4, _LIT2
    ldr r7, _LIT3
    mov r8, #0x14
.L_60:
    mov r0, r6
    mov r1, r5
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    cmp r1, #0x4
    bhi .L_b4
    and r0, r0, #0xff
    and r3, r0, #0x1
    mla r2, r3, r7, r4
    mla r2, r1, r8, r2
    ldrh r2, [r2, #0x38]
    cmp r2, #0x0
    beq .L_b4
    bl func_ov002_021b9dec
    bl func_0202e748
    cmp r0, #0x0
    movne r0, #0x1
    ldmneia sp!, {r4, r5, r6, r7, r8, pc}
.L_b4:
    ldrh r0, [r6, #0x6]
    add r5, r5, #0x1
    mov r0, r0, lsl #0x18
    cmp r5, r0, lsr #0x18
    blt .L_60
.L_c8:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022ce640
_LIT2: .word data_ov002_022cf08c
_LIT3: .word 0x00000868
