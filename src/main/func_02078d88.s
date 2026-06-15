; func_02078d88 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02078d88
        .arm
func_02078d88:
    add r2, r0, #0xd
    add ip, r0, #0x2
    and r3, r2, #0xf
    eor r2, r0, #0x8
    and ip, ip, #0xf
    ldr r3, [r1, r3, lsl #0x2]
    ldr r2, [r1, r2, lsl #0x2]
    ldr ip, [r1, ip, lsl #0x2]
    eor r2, r3, r2
    ldr r3, [r1, r0, lsl #0x2]
    eor r2, ip, r2
    eor r3, r3, r2
    mov r2, r3, lsl #0x1
    orr r2, r2, r3, lsr #0x1f
    str r2, [r1, r0, lsl #0x2]
    ldr r0, [r1, r0, lsl #0x2]
    bx lr
