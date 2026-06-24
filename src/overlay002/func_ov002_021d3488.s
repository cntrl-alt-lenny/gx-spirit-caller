; func_ov002_021d3488 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce950
        .extern data_ov002_022cf16c
        .extern data_ov002_022cf1a2
        .extern data_ov002_022cf1a4
        .extern func_ov002_0229ade0
        .extern func_ov002_0229c7f8
        .global func_ov002_021d3488
        .arm
func_ov002_021d3488:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r5, #0x1
    ldr r1, [r0, #0x810]
    moveq r5, #0x0
    ldrh r4, [r0, #0x4]
    cmp r1, #0x0
    ldrh r6, [r0, #0x6]
    beq .L_44
    cmp r1, #0x1
    beq .L_4c
    cmp r1, #0x2
    beq .L_13c
    ldmia sp!, {r4, r5, r6, pc}
.L_44:
    add r1, r1, #0x1
    str r1, [r0, #0x810]
.L_4c:
    mvn r0, #0x0
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldmneia sp!, {r4, r5, r6, pc}
    cmp r6, #0x2
    bne .L_e4
    ldr r2, _LIT1
    and r0, r5, #0x1
    mov r1, #0x14
    mul lr, r0, r2
    ldr r2, _LIT2
    ldr r3, _LIT3
    ldr r5, _LIT4
    add ip, r3, lr
    mov r3, r4, lsl #0x1b
    mul r6, r4, r1
    add r1, r2, lr
    add r5, r5, lr
    ldrh r4, [r6, r1]
    add r1, ip, #0x30
    ldr r2, [r1, r6]
    ldrh r5, [r6, r5]
    mov r1, r2, lsl #0x2
    mov r1, r1, lsr #0x18
    mov r4, r4, lsl #0x1f
    orr r0, r0, r3, lsr #0x1a
    mov r3, r5, lsl #0x1f
    orr r0, r0, r4, lsr #0x11
    orr r0, r0, r3, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r3, r2, lsl #0x12
    mov r2, r1, lsl #0x1
    mov r1, r0, lsr #0x10
    add r2, r2, r3, lsr #0x1f
    mov r0, #0x34
    mov r3, #0x0
    bl func_ov002_0229ade0
    b .L_128
.L_e4:
    ldr r2, _LIT3
    ldr r0, _LIT1
    and r1, r5, #0x1
    mla r2, r1, r0, r2
    mov r0, #0x14
    mul r0, r4, r0
    add r1, r2, #0x30
    ldr r2, [r1, r0]
    mov r1, r5
    mov r0, r2, lsl #0x2
    mov r0, r0, lsr #0x18
    mov r3, r2, lsl #0x12
    mov r0, r0, lsl #0x1
    mov r2, r4
    add r3, r0, r3, lsr #0x1f
    mov r0, #0x33
    bl func_ov002_0229ade0
.L_128:
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r4, r5, r6, pc}
.L_13c:
    cmp r6, #0x2
    moveq r0, #0x34
    movne r0, #0x33
    bl func_ov002_0229c7f8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, #0x0
    streq r1, [r0, #0x80c]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce950
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf1a4
_LIT3: .word data_ov002_022cf16c
_LIT4: .word data_ov002_022cf1a2
