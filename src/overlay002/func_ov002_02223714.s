; func_ov002_02223714 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern data_ov002_022d0e6c
        .extern func_ov002_021de910
        .extern func_ov002_02257b48
        .extern func_ov002_0226b034
        .global func_ov002_02223714
        .arm
func_ov002_02223714:
    stmdb sp!, {r3, lr}
    ldr r2, _LIT0
    ldr r2, [r2, #0x5a8]
    cmp r2, #0x7e
    beq .L_28c
    cmp r2, #0x7f
    beq .L_268
    cmp r2, #0x80
    bne .L_2ac
    bl func_ov002_02257b48
    cmp r0, #0x0
    movne r0, #0x7f
    moveq r0, #0x0
    ldmia sp!, {r3, pc}
.L_268:
    ldrh r3, [r0, #0x2]
    ldrh r1, [r0]
    mov r2, #0x0
    mov r0, r3, lsl #0x1f
    mov r0, r0, lsr #0x1f
    rsb r0, r0, #0x1
    bl func_ov002_0226b034
    mov r0, #0x7e
    ldmia sp!, {r3, pc}
.L_28c:
    ldr r1, _LIT1
    ldrh r1, [r1, #0xb0]
    mov r2, r1, asr #0x8
    and r1, r1, #0xff
    and r2, r2, #0xff
    bl func_ov002_021de910
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_2ac:
    mov r0, #0x0
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce288
_LIT1: .word data_ov002_022d0e6c
