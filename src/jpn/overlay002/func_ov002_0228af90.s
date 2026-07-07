; func_ov002_0228af90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c2
        .extern data_ov002_022cf0c4
        .extern func_ov002_0223dda4
        .extern func_ov002_022574e0
        .global func_ov002_0228af90
        .arm
func_ov002_0228af90:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    movs sl, r1
    mov r4, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r1, [sl, #0x2]
    ldrh r0, [r4, #0x2]
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    mov r0, r0, lsl #0x1f
    cmp r1, r0, lsr #0x1f
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldrh r0, [sl, #0x6]
    mov r0, r0, lsl #0x18
    mov r0, r0, lsr #0x18
    cmp r0, #0x1
    bne .L_244
    mov r0, sl
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0xa
    bhi .L_244
    mov r0, sl
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    and r7, r0, #0xff
    mov r0, r1, lsr #0x10
    mov r0, r0, asr #0x8
    and r8, r0, #0xff
    mov r0, r4
    mov r1, r7
    mov r2, r8
    bl func_ov002_022574e0
    cmp r0, #0x0
    beq .L_244
    ldr r1, _LIT0
    and r2, r7, #0x1
    mul r3, r2, r1
    mov r0, #0x14
    mul r6, r8, r0
    ldr r2, _LIT1
    ldr r1, _LIT2
    add r5, r2, r3
    add r4, r1, r3
    ldrh fp, [r5, r6]
    ldrh r9, [r4, r6]
    mov r0, #0x0
    mov r3, #0x1
    strh r0, [r5, r6]
    mov r0, sl
    mov r1, r7
    mov r2, r8
    strh r3, [r4, r6]
    bl func_ov002_022574e0
    strh fp, [r5, r6]
    cmp r0, #0x0
    strh r9, [r4, r6]
    moveq r0, #0x1
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_244:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c4
_LIT2: .word data_ov002_022cf0c2
