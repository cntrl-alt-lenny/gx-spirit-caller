; func_02008d1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02105bb0
        .extern func_02008c10
        .global func_02008d1c
        .arm
func_02008d1c:
    stmdb sp!, {r3, r4, r5, lr}
    mov r5, r1
    mov r4, r0
    bl func_02008c10
    mov r0, r5, asr #0x4
    ldr ip, _LIT0
    add r0, r5, r0, lsr #0x1b
    mov r2, r5, lsr #0x1f
    rsb r1, r2, r5, lsl #0x1b
    mov r3, r0, asr #0x5
    add r0, ip, r4, lsl #0x3
    ldr r3, [r0, r3, lsl #0x2]
    add r0, r2, r1, ror #0x1b
    mov r0, r3, lsr r0
    and r0, r0, #0x1
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02105bb0
