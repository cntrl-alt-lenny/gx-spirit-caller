; func_ov002_022274d8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d0e6c
        .extern func_ov002_021bbf50
        .extern func_ov002_021de4b0
        .extern func_ov002_021e96a0
        .extern func_ov002_02257878
        .extern func_ov002_0226b034
        .global func_ov002_022274d8
        .arm
func_ov002_022274d8:
    stmdb sp!, {r3, r4, r5, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_021bbf50
    ldrh r1, [r4, #0x2]
    mov r5, r0
    mov r0, r1, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_021bbf50
    cmp r5, r0
    movle r0, #0x0
    ldmleia sp!, {r3, r4, r5, pc}
    ldr r0, _LIT0
    ldr r0, [r0, #0x5a8]
    cmp r0, #0x7e
    beq .L_a0
    cmp r0, #0x7f
    beq .L_64
    cmp r0, #0x80
    bne .L_c4
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_64:
    ldr r1, _LIT1
    mov r0, r4
    bl func_ov002_02257878
    cmp r0, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldrh r0, [r4, #0x2]
    ldrh r1, [r4]
    mov r2, #0x0
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b034
    mov r0, #0x7e
    ldmia sp!, {r3, r4, r5, pc}
.L_a0:
    ldr r1, _LIT2
    mov r0, r4
    ldrh r1, [r1, #0xb0]
    mov r2, r1, asr #0x8
    and r1, r1, #0xff
    and r2, r2, #0xff
    bl func_ov002_021de4b0
    mov r0, #0x7f
    ldmia sp!, {r3, r4, r5, pc}
.L_c4:
    mov r0, #0x0
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word func_ov002_021e96a0
_LIT2: .word data_ov002_022d0e6c
