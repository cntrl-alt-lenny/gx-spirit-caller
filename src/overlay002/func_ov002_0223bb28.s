; func_ov002_0223bb28 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_0202de9c
        .extern func_02030b84
        .extern func_02031684
        .extern func_ov002_021b947c
        .extern func_ov002_021b9aa8
        .extern func_ov002_021bd85c
        .extern func_ov002_0223b468
        .extern func_ov002_0223b584
        .extern func_ov002_0223b5cc
        .extern func_ov002_0223b6ec
        .extern func_ov002_0223ba60
        .global func_ov002_0223bb28
        .arm
func_ov002_0223bb28:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r4, r1
    mov r9, r0
    mov r0, r4
    bl func_0202de9c
    cmp r0, #0x3
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r4
    mvn r1, #0x0
    bl func_ov002_021bd85c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    mov r0, r4
    bl func_02030b84
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
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
    ldr r6, _LIT0
    mov r8, #0x0
    ldr r0, [r6, #0x6a4]
    cmp r0, #0x0
    ble .L_180
    mov r4, #0x1
    mov r5, r4
.L_a8:
    mov r0, r9
    bl func_ov002_0223ba60
    movs r7, r0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr ip, [r6, #0x6ac]
    mov r0, r9
    add r1, ip, #0x1
    str r1, [r6, #0x6ac]
    ldr r1, [r7]
    ldr r2, [r6, #0x494]
    mov r3, r1, lsl #0x2
    add r2, r2, ip
    mov r3, r3, lsr #0x18
    mov r2, r2, lsl #0x19
    add r2, r6, r2, lsr #0x18
    mov ip, r1, lsl #0x12
    mov r1, r3, lsl #0x1
    add r3, r1, ip, lsr #0x1f
    add r1, r2, #0x400
    strh r3, [r1, #0x98]
    ldr r2, [r7]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r2, r2, lsl #0x12
    mov r1, r1, lsl #0x1
    add r1, r1, r2, lsr #0x1f
    bl func_ov002_021b9aa8
    cmp r0, #0x0
    blt .L_138
    ldr r0, [r7]
    mov r1, r5
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_ov002_0223b5cc
    b .L_170
.L_138:
    ldr r1, [r7]
    mov r0, r1, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r1, r1, lsl #0x12
    mov r0, r0, lsl #0x1
    add r0, r0, r1, lsr #0x1f
    bl func_ov002_021b947c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    mov r2, r4
    and r0, r0, #0xff
    and r1, r1, #0xff
    bl func_ov002_0223b6ec
.L_170:
    ldr r0, [r6, #0x6a4]
    add r8, r8, #0x1
    cmp r8, r0
    blt .L_a8
.L_180:
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word data_ov002_022ce288
