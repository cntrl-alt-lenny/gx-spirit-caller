; func_ov002_0223cefc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022cf08c
        .extern data_ov002_022cf09c
        .extern func_0202de48
        .extern func_02030b30
        .extern func_ov002_021bd77c
        .extern func_ov002_0223b378
        .extern func_ov002_0223b494
        .extern func_ov002_0223b4dc
        .extern func_ov002_0223ce28
        .global func_ov002_0223cefc
        .arm
func_ov002_0223cefc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r4, r1
    mov r9, r0
    mov r0, r4
    bl func_0202de48
    cmp r0, #0x3
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, r4
    mvn r1, #0x0
    bl func_ov002_021bd77c
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    mov r0, r4
    bl func_02030b30
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r1, _LIT0
    mov r0, r4
    str r4, [r1, #0x69c]
    bl func_ov002_0223b378
    ldr r1, _LIT0
    mov r2, #0x0
    str r0, [r1, #0x6a4]
    str r2, [r1, #0x6ac]
    mov r0, #0x1
    str r0, [r1, #0x6b0]
    bl func_ov002_0223b494
    ldr r0, _LIT1
    and r2, r9, #0x1
    mul r1, r2, r0
    ldr r0, _LIT2
    mov r6, #0x0
    ldr r0, [r0, r1]
    cmp r0, #0x0
    bls .L_140
    ldr r0, _LIT3
    ldr sl, _LIT0
    add r8, r0, r1
    add r7, r8, #0x260
    mov r4, #0x1
    mov r5, #0xd
.L_b0:
    mov r0, r9
    mov r1, r5
    mov r2, r6
    bl func_ov002_0223ce28
    cmp r0, #0x0
    beq .L_12c
    ldr r0, [r7]
    mov r1, r4
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_ov002_0223b4dc
    ldr r3, [sl, #0x6ac]
    add r0, r3, #0x1
    str r0, [sl, #0x6ac]
    ldr r0, [r7]
    ldr r1, [sl, #0x494]
    mov r2, r0, lsl #0x2
    add r1, r1, r3
    mov r1, r1, lsl #0x19
    mov r2, r2, lsr #0x18
    mov r3, r0, lsl #0x12
    mov r0, r2, lsl #0x1
    add r1, sl, r1, lsr #0x18
    add r2, r0, r3, lsr #0x1f
    add r0, r1, #0x400
    strh r2, [r0, #0x98]
    ldr r1, [sl, #0x6ac]
    ldr r0, [sl, #0x6a4]
    cmp r1, r0
    movcs r0, #0x1
    ldmcsia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
.L_12c:
    ldr r0, [r8, #0x10]
    add r6, r6, #0x1
    cmp r6, r0
    add r7, r7, #0x4
    bcc .L_b0
.L_140:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf09c
_LIT3: .word data_ov002_022cf08c
