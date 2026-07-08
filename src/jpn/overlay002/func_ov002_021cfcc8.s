; func_ov002_021cfcc8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce870
        .extern data_ov002_022cf08c
        .extern data_ov002_022d0170
        .extern func_ov002_021b939c
        .extern func_ov002_021b9a84
        .extern func_ov002_0229acd0
        .extern func_ov002_0229c6e8
        .global func_ov002_021cfcc8
        .arm
func_ov002_021cfcc8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r0, _LIT0
    ldrh r0, [r0]
    tst r0, #0x8000
    ldr r0, _LIT0
    movne r7, #0x1
    ldrh r5, [r0, #0x4]
    ldrh r4, [r0, #0x2]
    moveq r7, #0x0
    mov r0, r5
    bl func_ov002_021b939c
    ldr r1, _LIT0
    mov r6, #0x0
    ldr r1, [r1, #0x810]
    cmp r1, #0x0
    beq .L_260
    cmp r1, #0x1
    beq .L_354
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_260:
    cmp r4, #0xb
    beq .L_270
    cmp r4, #0x10
    blt .L_280
.L_270:
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_280:
    and r1, r0, #0xff
    cmp r7, r1
    bne .L_2b4
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    cmp r4, r1
    bne .L_2b4
    mov r0, r0, lsr #0x10
    mov r0, r0, lsl #0x10
    mov r6, r0, lsr #0x10
    b .L_2f4
.L_2b4:
    cmp r4, #0xa
    bgt .L_2f4
    ldr r0, _LIT1
    ldr r1, _LIT2
    and r2, r7, #0x1
    mla r1, r2, r0, r1
    mov r0, #0x14
    mla r0, r4, r0, r1
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    bne .L_2f4
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x80c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_2f4:
    cmp r4, #0xe
    bne .L_32c
    ldr r0, _LIT3
    mov r1, r5, lsl #0x2
    ldrh r1, [r0, r1]
    ldr r0, _LIT4
    mov r1, r1, lsl #0x13
    cmp r0, r1, lsr #0x13
    bne .L_32c
    mov r0, r5
    bl func_ov002_021b9a84
    ldr r1, [r0]
    bic r1, r1, #0x20000
    str r1, [r0]
.L_32c:
    mov r1, r7
    mov r2, r4
    mov r3, r6
    mov r0, #0x21
    bl func_ov002_0229acd0
    ldr r0, _LIT0
    ldr r1, [r0, #0x810]
    add r1, r1, #0x1
    str r1, [r0, #0x810]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_354:
    mov r0, #0x21
    bl func_ov002_0229c6e8
    cmp r0, #0x0
    ldreq r0, _LIT0
    moveq r1, r6
    streq r1, [r0, #0x80c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce870
_LIT1: .word 0x00000868
_LIT2: .word data_ov002_022cf08c
_LIT3: .word data_ov002_022d0170
_LIT4: .word 0x00001571
