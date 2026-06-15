; func_0202b9ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02105bc0
        .extern func_0202b0b4
        .global func_0202b9ec
        .arm
func_0202b9ec:
    stmdb sp!, {r3, lr}
    bl func_0202b0b4
    mov r2, r0, lsr #0x1f
    rsb r1, r2, r0, lsl #0x1f
    adds r1, r2, r1, ror #0x1f
    bne .L_68
    ldr r1, _LIT0
    add r0, r0, r0, lsr #0x1f
    ldrb r0, [r1, r0, asr #0x1]
    and r0, r0, #0xf
    ldmia sp!, {r3, pc}
.L_68:
    ldr r1, _LIT0
    add r0, r0, r0, lsr #0x1f
    ldrb r0, [r1, r0, asr #0x1]
    and r0, r0, #0xf0
    mov r0, r0, asr #0x4
    and r0, r0, #0xff
    ldmia sp!, {r3, pc}
_LIT0: .word data_02105bc0
