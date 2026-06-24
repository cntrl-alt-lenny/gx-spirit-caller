; func_0203f6f0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe470
        .extern func_0203f540
        .extern func_020a734c
        .global func_0203f6f0
        .arm
func_0203f6f0:
    stmfd sp!, {lr}
    sub sp, sp, #0x1c
    add r1, sp, #0x0
    bl func_0203f540
    ldr r1, _LIT0
    add r0, sp, #0x0
    mov r2, #0x8
    bl func_020a734c
    cmp r0, #0x0
    moveq r0, #0x1
    movne r0, #0x0
    add sp, sp, #0x1c
    ldmfd sp!, {pc}
_LIT0: .word data_020fe470
