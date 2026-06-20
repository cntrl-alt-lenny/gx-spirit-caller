; func_ov002_0223c918 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf180
        .extern func_0202de9c
        .extern func_02030b84
        .extern func_02031684
        .extern func_ov002_021bd85c
        .extern func_ov002_021ca698
        .extern func_ov002_0223b468
        .extern func_ov002_0223b584
        .extern func_ov002_0223b5cc
        .extern func_ov002_0223b6ec
        .extern func_ov002_0223c72c
        .global func_ov002_0223c918
        .arm
func_ov002_0223c918:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, lr}
    mov r4, r1
    mov sl, r0
    mov r0, r4
    bl func_0202de9c
    cmp r0, #0x3
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r4
    mvn r1, #0x0
    bl func_ov002_021bd85c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    mov r0, r4
    bl func_02030b84
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
    ldr r1, _LIT0
    mov r0, r4
    str r4, [r1, #0x69c]
    bl func_ov002_0223b468
    ldr r1, _LIT0
    mov r2, #0x0
    str r0, [r1, #0x6a4]
    mov r0, r4
    str r2, [r1, #0x6ac]
    bl func_02031684
    cmp r0, #0x0
    moveq r1, #0x1
    ldr r0, _LIT0
    movne r1, #0x0
    str r1, [r0, #0x6b0]
    bl func_ov002_0223b584
    mov r7, #0x0
    ldr r0, _LIT1
    and r1, sl, #0x1
    mul r9, r1, r0
    ldr r0, _LIT2
    ldr r4, _LIT0
    add fp, r0, r9
    add r8, fp, #0x30
    mov r5, #0x1
    mov r6, r7
.L_b4:
    mov r0, sl
    mov r1, r7
    mov r2, r6
    bl func_ov002_0223c72c
    cmp r0, #0x0
    beq .L_12c
    mov r0, sl
    mov r1, r7
    mov r2, r5
    bl func_ov002_0223b6ec
    ldr r3, [r4, #0x6ac]
    add r0, r3, #0x1
    str r0, [r4, #0x6ac]
    ldr r0, [r8]
    ldr r1, [r4, #0x494]
    mov r2, r0, lsl #0x2
    add r1, r1, r3
    mov r1, r1, lsl #0x19
    mov r2, r2, lsr #0x18
    mov r3, r0, lsl #0x12
    mov r0, r2, lsl #0x1
    add r1, r4, r1, lsr #0x18
    add r2, r0, r3, lsr #0x1f
    add r0, r1, #0x400
    strh r2, [r0, #0x98]
    ldr r1, [r4, #0x6ac]
    ldr r0, [r4, #0x6a4]
    cmp r1, r0
    movcs r0, #0x1
    ldmcsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_12c:
    add r7, r7, #0x1
    cmp r7, #0x4
    add r8, r8, #0x14
    ble .L_b4
    mov r0, sl
    mov r1, sl
    bl func_ov002_021ca698
    cmp r0, #0x0
    beq .L_210
    ldr r0, _LIT3
    mov r4, #0x0
    ldr r0, [r0, r9]
    cmp r0, #0x0
    bls .L_210
    ldr r1, _LIT2
    add r0, fp, #0x18
    add r8, r1, r9
    ldr r9, _LIT0
    add r7, r0, #0x400
    mov r5, #0x1
    mov r6, #0xe
.L_180:
    mov r0, sl
    mov r1, r6
    mov r2, r4
    bl func_ov002_0223c72c
    cmp r0, #0x0
    beq .L_1fc
    ldr r0, [r7]
    mov r1, r5
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_ov002_0223b5cc
    ldr r3, [r9, #0x6ac]
    add r0, r3, #0x1
    str r0, [r9, #0x6ac]
    ldr r0, [r7]
    ldr r1, [r9, #0x494]
    mov r2, r0, lsl #0x2
    add r1, r1, r3
    mov r1, r1, lsl #0x19
    mov r2, r2, lsr #0x18
    mov r3, r0, lsl #0x12
    mov r0, r2, lsl #0x1
    add r1, r9, r1, lsr #0x18
    add r2, r0, r3, lsr #0x1f
    add r0, r1, #0x400
    strh r2, [r0, #0x98]
    ldr r1, [r9, #0x6ac]
    ldr r0, [r9, #0x6a4]
    cmp r1, r0
    movcs r0, #0x1
    ldmcsia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
.L_1fc:
    ldr r0, [r8, #0x14]
    add r4, r4, #0x1
    cmp r4, r0
    add r7, r7, #0x4
    bcc .L_180
.L_210:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, sl, fp, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf16c
_LIT3: .word data_ov002_022cf180
