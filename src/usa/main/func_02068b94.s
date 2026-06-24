; func_02068b94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ebe8
        .extern func_0205468c
        .extern func_02068bf8
        .extern func_02068c08
        .extern func_02068c1c
        .global func_02068b94
        .arm
func_02068b94:
    stmfd sp!, {lr}
    sub sp, sp, #0xc
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    bne .L_44
    ldr r0, _LIT1
    ldr ip, _LIT2
    str r0, [sp]
    ldr r3, _LIT3
    mov r0, #0x8
    mov r1, #0x64
    mov r2, #0x2
    str ip, [sp, #0x4]
    bl func_0205468c
    ldr r1, _LIT0
    str r0, [r1]
.L_44:
    ldr r0, _LIT0
    ldr r0, [r0]
    add sp, sp, #0xc
    ldmfd sp!, {pc}
_LIT0: .word data_0219ebe8
_LIT1: .word func_02068c08
_LIT2: .word func_02068bf8
_LIT3: .word func_02068c1c
