; func_ov002_0222b2b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d008c
        .extern data_ov002_022d0d8c
        .extern func_ov002_021bbdcc
        .extern func_ov002_021debbc
        .extern func_ov002_021f2bb8
        .extern func_ov002_02257790
        .extern func_ov002_0226af44
        .extern func_ov002_0226afa4
        .global func_ov002_0222b2b4
        .arm
func_ov002_0222b2b4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r2, _LIT0
    mov r5, r0
    ldr r1, [r2, #0x5a8]
    ldr r4, [r2, #0x5ac]
    sub r1, r1, #0x78
    cmp r1, #0x8
    addls pc, pc, r1, lsl #0x2
    b .L_148
    b .L_124
    b .L_148
    b .L_148
    b .L_148
    b .L_148
    b .L_104
    b .L_9c
    b .L_5c
    b .L_48
.L_48:
    ldr r1, _LIT1
    mov r0, #0x7f
    ldr r1, [r1, #0xcec]
    str r1, [r2, #0x5ac]
    ldmia sp!, {r3, r4, r5, pc}
.L_5c:
    mov r0, r4
    bl func_ov002_021bbdcc
    cmp r0, #0x5
    movle r0, #0x78
    ldmleia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT2
    mov r0, r5
    bl func_ov002_02257790
    cmp r0, #0x0
    moveq r0, #0x78
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r1, [r5]
    mov r0, r4
    bl func_ov002_0226afa4
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_9c:
    mov r0, r4
    bl func_ov002_021bbdcc
    cmp r0, #0x5
    movle r0, #0x78
    ldmleia sp!, {r3, r4, r5, pc}
    ldr r1, _LIT2
    mov r0, r5
    bl func_ov002_02257790
    cmp r0, #0x0
    moveq r0, #0x78
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r2, [r5, #0x2]
    ldrh r1, [r5]
    mov r0, r4
    mov r3, r2, lsl #0x1f
    mov r2, r2, lsl #0x1a
    mov r3, r3, lsr #0x1f
    mov r2, r2, lsr #0x1b
    and r3, r3, #0xff
    and r2, r2, #0xff
    orr r2, r3, r2, lsl #0x8
    mov r2, r2, lsl #0x10
    mov r2, r2, lsr #0x10
    bl func_ov002_0226af44
    mov r0, #0x7d
    ldmia sp!, {r3, r4, r5, pc}
.L_104:
    ldr r2, _LIT3
    mov r1, r4
    ldrh r2, [r2, #0xb0]
    mov r2, r2, asr #0x8
    and r2, r2, #0xff
    bl func_ov002_021debbc
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_124:
    ldr r0, _LIT1
    ldr r0, [r0, #0xcec]
    cmp r4, r0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, pc}
    eor r0, r4, #0x1
    str r0, [r2, #0x5ac]
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_148:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d008c
_LIT2: .word func_ov002_021f2bb8
_LIT3: .word data_ov002_022d0d8c
