; func_ov004_021d570c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104acc
        .global func_ov004_021d570c
        .arm
func_ov004_021d570c:
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    movne r1, #0x0
    strne r1, [r0, #0x38]
    ldr r1, _LIT0
    ldrh r1, [r1, #0x54]
    tst r1, #0x1
    bxeq lr
    mov r1, #0x18
    str r1, [r0, #0x30]
    mov r1, #0x1
    str r1, [r0, #0x38]
    mov r1, #0x0
    str r1, [r0, #0x3c]
    bx lr
_LIT0: .word data_02104acc
