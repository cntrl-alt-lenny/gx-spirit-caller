; func_02001ddc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02001ddc
        .arm
func_02001ddc:
    str r1, [r0, #0x28]
    ldr ip, [r0, #0x1c]
    ldr r1, _LIT0
    mov r3, r3, lsl #0x17
    and ip, ip, r1
    orr ip, ip, r3, lsr #0x7
    ldr r3, [sp]
    str ip, [r0, #0x1c]
    str r3, [r0, #0xc]
    ldr ip, [r0, #0x20]
    mov r3, r3, lsl #0x17
    and r1, ip, r1, asr #0x7
    orr r1, r1, r3, lsr #0xe
    str r1, [r0, #0x20]
    str r2, [r0, #0x2c]
    ldr r2, [r0, #0x20]
    ldr r1, [sp, #0x4]
    bic r2, r2, #0x3c0000
    mov r1, r1, lsl #0x1c
    orr r2, r2, r1, lsr #0xa
    ldr r1, [sp, #0x8]
    str r2, [r0, #0x20]
    str r1, [r0, #0x30]
    bx lr
_LIT0: .word 0xfe00ffff
