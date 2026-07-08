; func_ov002_022303e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022cf08c
        .extern func_ov002_021b939c
        .extern func_ov002_021d8814
        .extern func_ov002_021de3c0
        .extern func_ov002_021deda4
        .extern func_ov002_021e2460
        .extern func_ov002_021e2480
        .extern func_ov002_021e277c
        .global func_ov002_022303e4
        .arm
func_ov002_022303e4:
    stmdb sp!, {r4, r5, r6, lr}
    movs r5, r1
    mov r6, r0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldrh r0, [r5, #0x4]
    orr r2, r0, #0x2
    mov r0, r2, lsl #0x1e
    mov r0, r0, lsr #0x1f
    bic r1, r2, #0x4
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x1d
    strh r0, [r5, #0x4]
    ldrh r1, [r5, #0x4]
    mov r0, r1, lsl #0x1d
    mov r0, r0, lsr #0x1f
    bic r1, r1, #0x8
    mov r0, r0, lsl #0x1f
    orr r0, r1, r0, lsr #0x1c
    strh r0, [r5, #0x4]
    ldrh r0, [r5, #0x4]
    mov r0, r0, lsl #0x11
    mov r0, r0, lsr #0x17
    bl func_ov002_021b939c
    ldrh r2, [r5, #0x2]
    mov r4, r0
    ldrh r1, [r5, #0x4]
    mov r0, r2, lsl #0x1f
    mov r3, r2, lsl #0x1a
    mov r2, r1, lsl #0x11
    mov r0, r0, lsr #0x1f
    mov r1, r3, lsr #0x1b
    mov r2, r2, lsr #0x17
    bl func_ov002_021d8814
    mov r0, r4, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r0, r0, asr #0x8
    and r0, r0, #0xff
    cmp r0, #0xa
    bhi .L_2b4
    mov r0, r4, lsr #0x10
    mov r0, r0, lsl #0x10
    movs r0, r0, lsr #0x10
    beq .L_294
    ldrh r2, [r5, #0x2]
    ldr r0, _LIT0
    ldr r3, [r0, #0x4]
    mov r1, r2, lsl #0x1f
    cmp r3, r1, lsr #0x1f
    ldreq r1, [r0, #0x20]
    moveq r0, r2, lsl #0x1a
    cmpeq r1, r0, lsr #0x1b
    moveq r1, #0x1
    movne r1, #0x0
    mov r0, r6
    bl func_ov002_021deda4
    b .L_34c
.L_294:
    ldrh r1, [r5, #0x2]
    mov r0, r6
    mov r3, r1, lsl #0x1f
    mov r2, r1, lsl #0x1a
    mov r1, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    bl func_ov002_021de3c0
    b .L_34c
.L_2b4:
    cmp r0, #0xb
    bne .L_310
    ldrh r1, [r5, #0x2]
    ldrh r2, [r6, #0x2]
    mov r0, r4, lsr #0x10
    mov r3, r1, lsl #0x1f
    mov r1, r0, lsl #0x10
    mov r5, r1, lsr #0x10
    mov r0, r3, lsr #0x1f
    mov r2, r2, lsl #0x1f
    cmp r0, r2, lsr #0x1f
    ldr r4, _LIT1
    ldr r1, _LIT2
    and r2, r0, #0x1
    mla r4, r2, r1, r4
    mov r1, r5, lsl #0x10
    movne r3, #0x1
    mov r1, r1, lsr #0x10
    add r2, r4, #0x120
    moveq r3, #0x0
    add r2, r2, r1, lsl #0x2
    bl func_ov002_021e2460
    b .L_34c
.L_310:
    cmp r0, #0xd
    bne .L_34c
    ldrh r0, [r6, #0x2]
    and r5, r4, #0xff
    mov r0, r0, lsl #0x1f
    cmp r5, r0, lsr #0x1f
    mov r0, r4, lsr #0x10
    mov r1, r0, lsl #0x10
    movne r2, #0x1
    moveq r2, #0x0
    mov r0, r5
    mov r1, r1, lsr #0x10
    bl func_ov002_021e2480
    mov r0, r5
    bl func_ov002_021e277c
.L_34c:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022cd314
_LIT1: .word data_ov002_022cf08c
_LIT2: .word 0x00000868
