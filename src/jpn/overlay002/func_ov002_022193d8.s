; func_ov002_022193d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern func_0202b824
        .extern func_0202e1e0
        .extern func_0202f994
        .extern func_ov002_021b9dec
        .extern func_ov002_021c1fa4
        .extern func_ov002_021de55c
        .extern func_ov002_021e1830
        .extern func_ov002_021e277c
        .extern func_ov002_021e2a2c
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .extern func_ov002_0226af64
        .global func_ov002_022193d8
        .arm
func_ov002_022193d8:
    stmdb sp!, {r3, r4, r5, r6, lr}
    sub sp, sp, #0x4
    mov r4, r0
    ldrh r1, [r4, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    addne sp, sp, #0x4
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, pc}
    ldr r1, _LIT0
    ldr r1, [r1, #0x5a8]
    sub r1, r1, #0x7a
    cmp r1, #0x6
    addls pc, pc, r1, lsl #0x2
    b .L_778
    b .L_758
    b .L_73c
    b .L_71c
    b .L_700
    b .L_6d4
    b .L_6ac
    b .L_578
.L_578:
    add r2, sp, #0x0
    mov r1, #0x0
    bl func_ov002_0223de48
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    ldr r2, [sp]
    mov r0, r4
    mov r1, r2, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r5, r2, #0xff
    and r6, r1, #0xff
    mov r1, r5
    mov r2, r6
    bl func_ov002_02257564
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    mov r0, r4
    mov r1, r5
    mov r2, r6
    mov r3, #0x1
    bl func_ov002_021c1fa4
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    mov r0, r5
    mov r1, r6
    bl func_ov002_021b9dec
    strh r0, [r4, #0xa]
    mov r1, r5
    ldrh r5, [r4, #0xa]
    mov r0, r4
    mov r2, r6
    mov r3, #0x2
    bl func_ov002_021de55c
    cmp r0, #0x0
    addeq sp, sp, #0x4
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, pc}
    mov r0, #0x1e
    bl func_ov002_021e2a2c
    ldrh r1, [r4]
    ldr r0, _LIT1
    cmp r1, r0
    beq .L_650
    add r0, r0, #0x1
    cmp r1, r0
    beq .L_684
    b .L_6a0
.L_650:
    mov r0, r5
    bl func_0202e1e0
    cmp r0, #0x0
    beq .L_678
    mov r0, r5
    bl func_0202f994
    cmp r0, #0x1
    addeq sp, sp, #0x4
    moveq r0, #0x7f
    ldmeqia sp!, {r3, r4, r5, r6, pc}
.L_678:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_684:
    mov r0, r5
    bl func_0202b824
    cmp r0, #0x17
    moveq r0, #0x7f
    add sp, sp, #0x4
    movne r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_6a0:
    add sp, sp, #0x4
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_6ac:
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4, #0xa]
    mov r2, #0x1
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, #0x0
    bl func_ov002_021e1830
    add sp, sp, #0x4
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_6d4:
    ldrh r0, [r4, #0x2]
    mov r2, #0x1
    ldrh r1, [r4, #0xa]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    mov r3, r2
    rsb r0, r0, #0x1
    bl func_ov002_021e1830
    add sp, sp, #0x4
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_700:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_0226af64
    add sp, sp, #0x4
    mov r0, #0x7c
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_71c:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226af64
    add sp, sp, #0x4
    mov r0, #0x7b
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_73c:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021e277c
    add sp, sp, #0x4
    mov r0, #0x7a
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_758:
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021e277c
    add sp, sp, #0x4
    mov r0, #0x1
    ldmia sp!, {r3, r4, r5, r6, pc}
.L_778:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmia sp!, {r3, r4, r5, r6, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word 0x00001363
