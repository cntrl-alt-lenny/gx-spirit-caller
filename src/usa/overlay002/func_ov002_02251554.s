; func_ov002_02251554 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c6
        .extern data_ov002_022d0570
        .extern func_ov002_021b939c
        .extern func_ov002_021c3304
        .extern func_ov002_02253370
        .global func_ov002_02251554
        .arm
func_ov002_02251554:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r9, r0
    mov r3, #0x14
    ldr r0, _LIT0
    ldr r4, _LIT1
    and r5, r9, #0x1
    mul r3, r2, r3
    mla r0, r5, r0, r4
    ldrh r6, [r3, r0]
    mov r8, r1
    cmp r6, #0x0
    ldmeqia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
    ldr r5, _LIT2
    mov r4, #0xe
.L_38:
    add r1, r5, r6, lsl #0x3
    ldrh r0, [r1, #0x2]
    ldrh r6, [r1, #0x6]
    mov r0, r0, lsl #0x1c
    mov r0, r0, lsr #0x1c
    cmp r0, #0x6
    bcs .L_b8
    ldrh r0, [r1]
    cmp r0, r8
    bne .L_b8
    ldrh r0, [r1, #0x4]
    bl func_ov002_021b939c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    cmp r1, #0xe
    bne .L_b8
    mov r1, r0, lsr #0x10
    mov r1, r1, lsl #0x10
    and r7, r0, #0xff
    mov sl, r1, lsr #0x10
    mov r0, r9
    mov r1, r7
    mov r2, sl
    bl func_ov002_021c3304
    cmp r0, #0x0
    beq .L_b8
    mov r0, r7
    mov r1, r4
    mov r2, sl
    bl func_ov002_02253370
.L_b8:
    cmp r6, #0x0
    bne .L_38
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c6
_LIT2: .word data_ov002_022d0570
