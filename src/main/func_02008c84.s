; func_02008c84 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02105bb0
        .extern func_02008c10
        .global func_02008c84
        .arm
func_02008c84:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r3, _LIT0
    mov r6, r1
    mov r5, r2
    add r4, r3, r0, lsl #0x3
    bl func_02008c10
    mov r1, r6, lsr #0x1f
    mov r2, r6, asr #0x4
    rsb r0, r1, r6, lsl #0x1b
    add r2, r6, r2, lsr #0x1b
    mov r2, r2, asr #0x5
    add r3, r1, r0, ror #0x1b
    mov r0, #0x1
    mvn r1, r0, lsl r3
    ldr r0, [r4, r2, lsl #0x2]
    and r0, r1, r0
    orr r0, r0, r5, lsl r3
    str r0, [r4, r2, lsl #0x2]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_02105bb0
