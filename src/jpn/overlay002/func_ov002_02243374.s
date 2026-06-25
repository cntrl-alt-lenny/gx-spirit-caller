; func_ov002_02243374 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d0d8c
        .extern func_ov002_0223dd14
        .extern func_ov002_02253600
        .extern func_ov002_0226b0a4
        .global func_ov002_02243374
        .arm
func_ov002_02243374:
    stmdb sp!, {r3, lr}
    ldrh r2, [r0, #0x2]
    ldr r1, _LIT0
    ldr r1, [r1, #0x5b8]
    mov r2, r2, lsl #0x1f
    cmp r1, #0x0
    mov r2, r2, lsr #0x1f
    beq .L_1dc
    cmp r1, #0x1
    beq .L_20c
    cmp r1, #0x2
    beq .L_230
    b .L_244
.L_1dc:
    ldrh r1, [r0]
    mov r0, r2
    bl func_ov002_02253600
    cmp r0, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, pc}
.L_20c:
    ldrh r1, [r0]
    rsb r0, r2, #0x1
    bl func_ov002_0226b0a4
    ldr r1, _LIT0
    mov r0, #0x0
    ldr r2, [r1, #0x5b8]
    add r2, r2, #0x1
    str r2, [r1, #0x5b8]
    ldmia sp!, {r3, pc}
.L_230:
    ldr r3, _LIT1
    mov r1, r2
    ldrh r3, [r3, #0xb2]
    mov r2, #0xe
    bl func_ov002_0223dd14
.L_244:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d0d8c
