; func_ov000_021ab798 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021c7588
        .extern func_ov000_021ab520
        .extern func_ov000_021ab5ac
        .global func_ov000_021ab798
        .arm
func_ov000_021ab798:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r4, _LIT0
    ldr r0, [r4]
    mov r1, r0, lsl #0x18
    movs r5, r1, lsr #0x18
    ldmeqia sp!, {r3, r4, r5, r6, r7, pc}
    mov r0, r0, lsl #0x16
    movs r0, r0, lsr #0x1e
    ldr r0, [r4]
    moveq r1, r5
    mov r0, r0, lsl #0x14
    rsbne r1, r5, #0xff
    movs r0, r0, lsr #0x1e
    mvneq r0, #0x0
    movne r0, #0x1
    mov r0, r0, lsl #0x4
    mul r2, r1, r0
    ldr r1, _LIT1
    ldr r3, [r4]
    smull r0, r6, r1, r2
    add r6, r2, r6
    mov r2, r2, lsr #0x1f
    mov r0, #0x0
    mov r1, #0x3f
    add r6, r2, r6, asr #0x7
    mov r7, r3, lsl #0xc
    bl func_ov000_021ab520
    mov r0, #0x1
    mov r1, #0x3f
    bl func_ov000_021ab520
    mov r1, r6
    mov r0, #0x0
    bl func_ov000_021ab5ac
    mov r1, r6
    mov r0, #0x1
    bl func_ov000_021ab5ac
    subs r5, r5, r7, lsr #0x18
    ldr r1, [r4]
    movmi r5, #0x0
    and r0, r5, #0xff
    bic r1, r1, #0xff
    orr r0, r1, r0
    str r0, [r4]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov000_021c7588
_LIT1: .word 0x80808081
