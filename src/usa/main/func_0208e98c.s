; func_0208e98c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_0208e98c
        .arm
func_0208e98c:
    ldr r1, _LIT0
    mov r2, #0x3
    str r2, [r1]
    ldr r2, [r0]
    ldr r1, _LIT1
    mov r2, r2, lsl #0x4
    str r2, [r1]
    ldr r2, [r0, #0x4]
    mov r2, r2, lsl #0x4
    str r2, [r1]
    ldr r2, [r0, #0x8]
    mov r2, r2, lsl #0x4
    str r2, [r1]
    ldr r2, [r0, #0xc]
    mov r2, r2, lsl #0x4
    str r2, [r1]
    ldr r2, [r0, #0x10]
    mov r2, r2, lsl #0x4
    str r2, [r1]
    ldr r2, [r0, #0x14]
    mov r2, r2, lsl #0x4
    str r2, [r1]
    ldr r2, [r0, #0x18]
    mov r2, r2, lsl #0x4
    str r2, [r1]
    ldr r2, [r0, #0x1c]
    mov r2, r2, lsl #0x4
    str r2, [r1]
    ldr r2, [r0, #0x20]
    mov r2, r2, lsl #0x4
    str r2, [r1]
    ldr r2, [r0, #0x24]
    mov r2, r2, lsl #0x4
    str r2, [r1]
    ldr r2, [r0, #0x28]
    mov r2, r2, lsl #0x4
    str r2, [r1]
    ldr r2, [r0, #0x2c]
    mov r2, r2, lsl #0x4
    str r2, [r1]
    ldr r2, [r0, #0x30]
    str r2, [r1]
    ldr r2, [r0, #0x34]
    str r2, [r1]
    ldr r2, [r0, #0x38]
    str r2, [r1]
    ldr r0, [r0, #0x3c]
    str r0, [r1]
    bx lr
_LIT0: .word 0x04000440
_LIT1: .word 0x04000458
