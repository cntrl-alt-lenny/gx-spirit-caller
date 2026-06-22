; func_ov002_02215bf4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022cf16c
        .extern data_ov002_022d016c
        .extern data_ov002_022d0e6c
        .extern func_0202b8f0
        .extern func_ov002_021c1e44
        .extern func_ov002_021debe0
        .extern func_ov002_021df818
        .extern func_ov002_022577dc
        .extern func_ov002_0226b034
        .global func_ov002_02215bf4
        .arm
func_ov002_02215bf4:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r1, _LIT0
    mov r6, r0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7f
    beq .L_54
    cmp r1, #0x80
    bne .L_e4
    bl func_ov002_022577dc
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    ldrh r2, [r6, #0x2]
    ldr r0, _LIT1
    ldrh r1, [r6]
    mov r2, r2, lsl #0x1f
    ldr r0, [r0, #0xcec]
    mov r2, r2, lsr #0x1f
    bl func_ov002_0226b034
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_54:
    ldr r1, _LIT2
    ldr r0, _LIT3
    ldrh r5, [r1, #0xb0]
    ldr r2, _LIT4
    mov r1, #0x14
    and r4, r5, #0xff
    and r3, r4, #0x1
    mla r0, r3, r0, r2
    mov r2, r5, asr #0x8
    and r5, r2, #0xff
    mla r0, r5, r1, r0
    ldr r0, [r0, #0x30]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8f0
    mov r7, r0
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_021c1e44
    cmp r0, #0x0
    movne r0, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r6
    mov r1, r4
    mov r2, r5
    bl func_ov002_021debe0
    ldr r0, _LIT1
    add r2, r7, #0x1
    ldr r1, [r0, #0xcec]
    mov r0, r6
    rsb r1, r1, #0x1
    mov r2, r2, asr #0x1
    bl func_ov002_021df818
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
.L_e4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d016c
_LIT2: .word data_ov002_022d0e6c
_LIT3: .word 0x00000868
_LIT4: .word data_ov002_022cf16c
