; func_ov002_0223a1f4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce1a8
        .extern data_ov002_022d0d8c
        .extern func_ov002_0220e428
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_02257564
        .extern func_ov002_0226b168
        .global func_ov002_0223a1f4
        .arm
func_ov002_0223a1f4:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7e
    beq .L_5ec
    cmp r1, #0x7f
    beq .L_5cc
    cmp r1, #0x80
    bne .L_60c
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_5c4
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0
    mov r0, r1, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r2, r0, asr #0x8
    mov r0, r4
    and r1, r1, #0xff
    and r2, r2, #0xff
    bl func_ov002_02257564
    cmp r0, #0x0
    movne r0, #0x7f
    ldmneia sp!, {r4, pc}
.L_5c4:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_5cc:
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r2, r0, lsl #0x1f
    mov r0, r2, lsr #0x1f
    mov r1, r1, lsr #0x1b
    bl func_ov002_0226b168
    mov r0, #0x7e
    ldmia sp!, {r4, pc}
.L_5ec:
    ldr r1, _LIT1
    ldrh r1, [r1, #0xb0]
    cmp r1, #0x1
    cmpne r1, #0x6
    beq .L_604
    bl func_ov002_0220e428
.L_604:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_60c:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022d0d8c
