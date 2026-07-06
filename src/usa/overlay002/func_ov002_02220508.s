; func_ov002_02220508 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd314
        .extern data_ov002_022ce1a8
        .extern func_ov002_021d46ac
        .extern func_ov002_0223dda4
        .extern func_ov002_0223de48
        .extern func_ov002_0226b114
        .global func_ov002_02220508
        .arm
func_ov002_02220508:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    mov r4, r0
    ldr r1, [r1, #0x5a8]
    cmp r1, #0x7f
    beq .L_c0
    cmp r1, #0x80
    bne .L_d0
    ldrh r1, [r4, #0x4]
    mov r1, r1, lsl #0x1d
    movs r1, r1, lsr #0x1f
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r1, #0x0
    mov r2, r1
    bl func_ov002_0223de48
    cmp r0, #0x0
    beq .L_b8
    mov r0, r4
    mov r1, #0x0
    bl func_ov002_0223dda4
    mov r1, r0, lsl #0x10
    ldrh r2, [r4, #0x2]
    mov r3, r1, lsr #0x10
    mov r1, r2, lsl #0x1f
    mov r2, r3, asr #0x8
    and r3, r0, #0xff
    mov r1, r1, lsr #0x1f
    rsbs r0, r1, #0x1
    movne r1, #0x8000
    mov r3, r3, lsl #0x10
    ldr r0, _LIT1
    moveq r1, #0x0
    and ip, r2, #0xff
    orr r2, r1, #0x19
    ldr r1, [r0, #0x1c]
    mov r0, r2, lsl #0x10
    mov r1, r1, lsl #0x10
    mov r2, ip, lsl #0x10
    mov r0, r0, lsr #0x10
    mov r1, r1, lsr #0x10
    mov r2, r2, lsr #0x10
    mov r3, r3, lsr #0x10
    bl func_ov002_021d46ac
    mov r0, #0x7f
    ldmia sp!, {r4, pc}
.L_b8:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_c0:
    mov r0, #0x1
    bl func_ov002_0226b114
    mov r0, #0x0
    ldmia sp!, {r4, pc}
.L_d0:
    mov r0, #0x0
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022ce1a8
_LIT1: .word data_ov002_022cd314
