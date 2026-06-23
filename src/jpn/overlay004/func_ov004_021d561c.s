; func_ov004_021d561c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_ov004_021d561c
        .arm
func_ov004_021d561c:
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    movne r1, #0x0
    strne r1, [r0, #0x38]
    ldr r2, [r0, #0x3c]
    ldr r1, [r0, #0x44]
    cmp r2, r1
    bxcc lr
    ldr r2, [r0, #0x40]
    mov r1, #0x1
    str r2, [r0, #0x30]
    str r1, [r0, #0x38]
    mov r1, #0x0
    str r1, [r0, #0x3c]
    bx lr
