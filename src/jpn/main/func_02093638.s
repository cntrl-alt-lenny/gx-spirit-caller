; func_02093638 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a65fc
        .extern data_021a6600
        .extern data_021a6604
        .extern data_021a6608
        .extern func_020904f4
        .global func_02093638
        .arm
func_02093638:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    ldr r2, _LIT0
    ldrh r0, [r2]
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    bxne lr
    ldr r1, _LIT1
    mov r3, #0x0
    mov ip, #0x1
    mov r0, #0x4
    strh ip, [r2]
    str r3, [r1]
    str r3, [r1, #0x4]
    bl func_020904f4
    ldr r1, _LIT2
    mov r2, #0x0
    ldr r0, _LIT3
    str r2, [r1]
    str r2, [r0]
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a65fc
_LIT1: .word data_021a6608
_LIT2: .word data_021a6604
_LIT3: .word data_021a6600
