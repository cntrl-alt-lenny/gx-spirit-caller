; func_020aab3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020a9d64
        .extern func_020aaab8
        .global func_020aab3c
        .arm
func_020aab3c:
    stmfd sp!, {lr}
    sub sp, sp, #0xc
    str r0, [sp, #0x4]
    cmp r0, #0x0
    ldrnesb r0, [r0]
    mov lr, r1
    mov r3, r2
    cmpne r0, #0x0
    addeq sp, sp, #0xc
    mvneq r0, #0x0
    ldmeqfd sp!, {pc}
    mov ip, #0x0
    str ip, [sp, #0x8]
    ldr r0, _LIT0
    add r1, sp, #0x4
    mov r2, lr
    str ip, [sp]
    bl func_020a9d64
    add sp, sp, #0xc
    ldmfd sp!, {pc}
_LIT0: .word func_020aaab8
