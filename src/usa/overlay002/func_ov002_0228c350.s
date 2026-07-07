; func_ov002_0228c350 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf08c
        .extern func_ov002_021bbe70
        .extern func_ov002_021bbff4
        .extern func_ov002_021be3c0
        .extern func_ov002_021c8390
        .extern func_ov002_02259eb0
        .extern func_ov002_022812e8
        .global func_ov002_0228c350
        .arm
func_ov002_0228c350:
    stmdb sp!, {r3, r4, r5, r6, r7, r8, r9, lr}
    mov r5, r0
    rsb r6, r5, #0x1
    mov r1, #0x1
    mov r0, r6
    mov r2, r1
    bl func_ov002_021bbff4
    mov r4, r0
    mov r0, r5
    bl func_ov002_021bbe70
    add r1, r4, #0x1
    sub r4, r1, r0
    mov r0, r6
    bl func_ov002_02259eb0
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    cmp r4, #0x0
    movle r0, #0x0
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    ldr r0, _LIT0
    ldr r1, _LIT1
    and r2, r5, #0x1
    mla r7, r2, r0, r1
    add r5, r7, #0x30
    mov r4, #0x0
.L_68:
    ldr r0, [r5]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_ov002_022812e8
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
    add r4, r4, #0x1
    cmp r4, #0x5
    add r5, r5, #0x14
    blt .L_68
    ldr r2, _LIT1
    ldr r0, _LIT0
    and r1, r6, #0x1
    mla r5, r1, r0, r2
    add r4, r5, #0x30
    mov r8, #0x0
    mov r9, #0x1
.L_b0:
    ldr r0, [r4]
    mov r0, r0, lsl #0x13
    movs r0, r0, lsr #0x13
    beq .L_100
    ldrh r0, [r5, #0x36]
    cmp r0, #0x0
    bne .L_100
    mov r0, r6
    mov r1, r8
    mov r2, r9
    bl func_ov002_021be3c0
    cmp r0, #0x0
    beq .L_100
    mov r0, r6
    mov r1, r8
    bl func_ov002_021c8390
    ldr r1, [r7]
    cmp r1, r0
    movle r0, #0x1
    ldmleia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
.L_100:
    add r8, r8, #0x1
    cmp r8, #0x5
    add r4, r4, #0x14
    add r5, r5, #0x14
    blt .L_b0
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, r8, r9, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf08c
