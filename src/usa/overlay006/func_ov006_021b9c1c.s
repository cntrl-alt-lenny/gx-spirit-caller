; func_ov006_021b9c1c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov006_021b9c1c
        .arm
func_ov006_021b9c1c:
    ldrh ip, [r1]
    ldrh r3, [r0]
    mov r0, ip, asr #0x8
    mov r2, r3, asr #0x8
    and r1, r0, #0xff
    and r0, ip, #0xff
    orr r0, r1, r0, lsl #0x8
    mov r1, r0, lsl #0x10
    and r2, r2, #0xff
    and r0, r3, #0xff
    orr r0, r2, r0, lsl #0x8
    mov r0, r0, lsl #0x10
    mov r1, r1, lsr #0x10
    rsb r0, r1, r0, lsr #0x10
    bx lr
