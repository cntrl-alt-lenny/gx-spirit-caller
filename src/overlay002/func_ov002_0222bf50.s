; func_ov002_0222bf50 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd3f4
        .extern data_ov002_022cd42c
        .extern data_ov002_022d0250
        .extern func_0202b8f0
        .extern func_ov002_021b947c
        .extern func_ov002_021c8470
        .extern func_ov002_021df818
        .global func_ov002_0222bf50
        .arm
func_ov002_0222bf50:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x14
    mov r0, r0, lsr #0x1a
    cmp r0, #0x16
    bne .L_a8
    ldr r0, _LIT0
    ldr r1, [r4, #0x14]
    ldr r2, [r0, #0x38]
    mov r0, r1, lsl #0x17
    cmp r2, r0, lsr #0x17
    moveq r2, #0x1
    movne r2, #0x0
    mov r0, #0x38
    mul r1, r2, r0
    ldr r0, _LIT1
    ldr r5, [r0, r1]
    mov r0, r5
    bl func_ov002_021b947c
    mov r1, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    mov r1, r1, asr #0x8
    and r1, r1, #0xff
    cmp r1, #0x4
    bhi .L_74
    and r0, r0, #0xff
    bl func_ov002_021c8470
    b .L_8c
.L_74:
    ldr r0, _LIT2
    mov r1, r5, lsl #0x2
    ldrh r0, [r0, r1]
    mov r0, r0, lsl #0x13
    mov r0, r0, lsr #0x13
    bl func_0202b8f0
.L_8c:
    ldrh r1, [r4, #0x2]
    mov r2, r0
    mov r0, r4
    mov r1, r1, lsl #0x1f
    mov r1, r1, lsr #0x1f
    rsb r1, r1, #0x1
    bl func_ov002_021df818
.L_a8:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cd3f4
_LIT1: .word data_ov002_022cd42c
_LIT2: .word data_ov002_022d0250
