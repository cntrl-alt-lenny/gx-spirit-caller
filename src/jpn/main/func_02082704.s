; func_02082704 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02082704
        .arm
func_02082704:
    cmp r3, #0x0
    beq .L_4f0
    ldr r1, [r0]
    add r1, r1, r2
    str r1, [r0]
    ldr r1, [r0, #0x4]
    add r1, r1, r2
    str r1, [r0, #0x4]
    ldr r1, [r0, #0x8]
    add r1, r1, r2
    str r1, [r0, #0x8]
    bx lr
.L_4f0:
    ldr r3, [r1]
    ldr ip, [r0]
    mul r3, r2, r3
    add r3, ip, r3, asr #0xc
    str r3, [r0]
    ldr r3, [r1, #0x4]
    ldr ip, [r0, #0x4]
    mul r3, r2, r3
    add r3, ip, r3, asr #0xc
    str r3, [r0, #0x4]
    ldr r1, [r1, #0x8]
    ldr r3, [r0, #0x8]
    mul r1, r2, r1
    add r1, r3, r1, asr #0xc
    str r1, [r0, #0x8]
    bx lr
