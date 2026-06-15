; func_0202ba38 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02105bc0
        .extern func_0202b0b4
        .global func_0202ba38
        .arm
func_0202ba38:
    stmdb sp!, {r4, lr}
    mov r4, r1
    bl func_0202b0b4
    mov r2, r0, lsr #0x1f
    rsb r1, r2, r0, lsl #0x1f
    adds r1, r2, r1, ror #0x1f
    bne .L_c4
    ldr r3, _LIT0
    add r0, r0, r0, lsr #0x1f
    ldrb r1, [r3, r0, asr #0x1]
    and r2, r1, #0xf0
    and r1, r2, #0xff
    orr r1, r1, r4
    strb r1, [r3, r0, asr #0x1]
    ldmia sp!, {r4, pc}
.L_c4:
    ldr r2, _LIT0
    add r0, r0, r0, lsr #0x1f
    ldrb r1, [r2, r0, asr #0x1]
    and r1, r1, #0xf
    orr r1, r1, r4, lsl #0x4
    strb r1, [r2, r0, asr #0x1]
    ldmia sp!, {r4, pc}
_LIT0: .word data_02105bc0
