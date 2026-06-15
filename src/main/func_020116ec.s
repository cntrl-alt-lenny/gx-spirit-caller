; func_020116ec — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020bef80
        .global func_020116ec
        .arm
func_020116ec:
    mov r1, r1, asr #0x4
    mov r3, r1, lsl #0x1
    add r1, r3, #0x1
    ldr r2, _LIT0
    mov r1, r1, lsl #0x1
    mov ip, r3, lsl #0x1
    ldrsh r3, [r2, r1]
    ldrsh r1, [r2, ip]
    mov r2, #0x0
    str r3, [r0]
    stmib r0, {r1, r2}
    rsb r1, r1, #0x0
    str r1, [r0, #0xc]
    str r3, [r0, #0x10]
    str r2, [r0, #0x14]
    str r2, [r0, #0x18]
    str r2, [r0, #0x1c]
    mov r1, #0x1000
    str r1, [r0, #0x20]
    str r2, [r0, #0x24]
    str r2, [r0, #0x28]
    str r2, [r0, #0x2c]
    bx lr
_LIT0: .word data_020bef80
