; func_0209dc30 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a8d2c
        .extern func_020928cc
        .extern func_0209dc8c
        .global func_0209dc30
        .arm
func_0209dc30:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_0209dc8c
    cmp r0, #0x0
    addne sp, sp, #0x4
    ldmnefd sp!, {lr}
    bxne lr
    ldr r0, _LIT0
    mov r1, #0x2
    ldr r0, [r0]
    ldr r0, [r0, #0x4]
    bl func_020928cc
    ldr r0, _LIT0
    ldr r0, [r0]
    ldr r0, [r0, #0x4]
    ldrh r0, [r0]
    cmp r0, #0x1
    movls r0, #0x3
    movhi r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {lr}
    bx lr
_LIT0: .word data_021a8d2c
