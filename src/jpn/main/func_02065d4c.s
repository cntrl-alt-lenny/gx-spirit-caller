; func_02065d4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02054c34
        .global func_02065d4c
        .arm
func_02065d4c:
    stmfd sp!, {lr}
    sub sp, sp, #0x14
    mov ip, r2, asr #0x8
    mov r2, r2, lsl #0x8
    str r1, [sp, #0xc]
    mov r1, r3
    and r3, ip, #0xff
    and r2, r2, #0xff00
    orr r2, r3, r2
    mov lr, #0x2
    strh r2, [sp, #0xa]
    add r3, sp, #0x8
    strb lr, [sp, #0x9]
    str r3, [sp]
    mov ip, #0x8
    ldr r2, [sp, #0x18]
    mov r3, #0x0
    str ip, [sp, #0x4]
    bl func_02054c34
    add sp, sp, #0x14
    ldmfd sp!, {pc}
