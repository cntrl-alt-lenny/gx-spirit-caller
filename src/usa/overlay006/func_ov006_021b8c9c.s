; func_ov006_021b8c9c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_0224f2c0
        .extern func_0202b060
        .global func_ov006_021b8c9c
        .arm
func_ov006_021b8c9c:
    stmdb sp!, {r4, lr}
    mov r4, r1
    bl func_0202b060
    ldr r2, _LIT0
    mov r1, r4, asr #0x4
    ldr ip, [r2, #0x4]
    add r3, r4, r1, lsr #0x1b
    mov r2, r4, lsr #0x1f
    rsb r1, r2, r4, lsl #0x1b
    mov r3, r3, asr #0x5
    add r0, ip, r0, lsl #0x3
    ldr r0, [r0, r3, lsl #0x2]
    add r1, r2, r1, ror #0x1b
    mov r2, #0x1
    and r0, r0, r2, lsl r1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov006_0224f2c0
