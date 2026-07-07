; func_ov002_0222e630 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_ov002_021ae320
        .extern func_ov002_021af8f0
        .extern func_ov002_021aff6c
        .extern func_ov002_021bc538
        .extern func_ov002_021e2a4c
        .extern func_ov002_021e2b6c
        .extern func_ov002_021ff310
        .extern func_ov002_022535a4
        .extern func_ov002_0227acc8
        .global func_ov002_0222e630
        .arm
func_ov002_0222e630:
    stmdb sp!, {r4, r5, r6, lr}
    mov r5, r0
    ldrh r4, [r5, #0x2]
    ldr r2, _LIT0
    mov r3, r4, lsl #0x11
    ldr r2, [r2, #0x5a8]
    mov r4, r4, lsl #0x1f
    mov r3, r3, lsr #0x1f
    cmp r2, #0x7d
    eor r4, r3, r4, lsr #0x1f
    beq .L_e8
    cmp r2, #0x7e
    beq .L_b4
    cmp r2, #0x80
    bne .L_138
    bl func_ov002_021ff310
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r0, r4
    bl func_ov002_021bc538
    mov r6, r0
    ldrh r1, [r5]
    mov r0, r4
    mov r2, #0x0
    bl func_ov002_022535a4
    cmp r6, r0
    bge .L_7c
    mov r0, r4
    bl func_ov002_021bc538
    b .L_8c
.L_7c:
    ldrh r1, [r5]
    mov r0, r4
    mov r2, #0x0
    bl func_ov002_022535a4
.L_8c:
    strh r0, [r5, #0xa]
    ldrh r0, [r5, #0xa]
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    ldr r1, _LIT1
    mov r0, r4
    bl func_ov002_021ae320
    mov r0, #0x7e
    ldmia sp!, {r4, r5, r6, pc}
.L_b4:
    ldrh r1, [r5, #0xa]
    ldrh r2, [r5]
    mov r0, r4
    cmp r1, #0x20
    movcs r1, #0x20
    add r1, r1, #0x6
    mov r3, #0x0
    bl func_ov002_021af8f0
    mov r0, #0x0
    strh r0, [r5, #0x8]
    bl func_ov002_021e2a4c
    mov r0, #0x7d
    ldmia sp!, {r4, r5, r6, pc}
.L_e8:
    ldrh r1, [r5, #0x8]
    ldrh r0, [r5, #0xa]
    cmp r1, r0
    bcs .L_12c
    add r0, r1, #0x1
    bl func_ov002_021aff6c
    ldrh r2, [r5]
    mov r1, r0
    mov r0, r4
    mov r3, r2, lsl #0x10
    mov r2, #0x1
    bl func_ov002_0227acc8
    ldrh r1, [r5, #0x8]
    mov r0, #0x7d
    add r1, r1, #0x1
    strh r1, [r5, #0x8]
    ldmia sp!, {r4, r5, r6, pc}
.L_12c:
    bl func_ov002_021e2b6c
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
.L_138:
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x0000011d
