; func_02011688 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bef80
        .global func_02011688
        .arm
func_02011688:
    mov r1, r1, asr #0x4
    mov r3, r1, lsl #0x1
    add r1, r3, #0x1
    ldr r2, _LIT0
    mov r1, r1, lsl #0x1
    mov ip, r3, lsl #0x1
    ldrsh r3, [r2, r1]
    ldrsh ip, [r2, ip]
    mov r2, #0x0
    str r3, [r0]
    str r2, [r0, #0x4]
    rsb r1, ip, #0x0
    str r1, [r0, #0x8]
    str r2, [r0, #0xc]
    mov r1, #0x1000
    str r1, [r0, #0x10]
    str r2, [r0, #0x14]
    str ip, [r0, #0x18]
    str r2, [r0, #0x1c]
    str r3, [r0, #0x20]
    str r2, [r0, #0x24]
    str r2, [r0, #0x28]
    str r2, [r0, #0x2c]
    bx lr
_LIT0: .word data_020bef80
