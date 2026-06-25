; func_02038f60 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe3e0
        .extern data_0219c3a0
        .global func_02038f60
        .arm
func_02038f60:
    ldr r2, _LIT0
    ldr r3, [r2, #0x10]
    cmp r3, #0x0
    bxeq lr
    ldr r1, [r0, #0x14]
    ldr ip, _LIT1
    str r1, [r3]
    ldr r1, [r2, #0x10]
    mov r3, #0x0
    str ip, [r1, #0x4]
    ldr ip, [r2, #0x10]
    ldr r1, _LIT2
    add ip, ip, #0x4
    str ip, [r2, #0x10]
    ldr ip, [r2, #0xc]
    str r0, [ip]
    ldr r0, [r2, #0xc]
    str r3, [r0, #0x4]
    ldr r0, [r2, #0xc]
    add r0, r0, #0x4
    str r0, [r2, #0xc]
    ldrsh r0, [r1]
    add r0, r0, #0x1
    strh r0, [r1]
    bx lr
_LIT0: .word data_0219c3a0
_LIT1: .word 0x0000ffff
_LIT2: .word data_020fe3e0
