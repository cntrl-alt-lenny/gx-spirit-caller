; func_0204550c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0203cb90
        .extern func_0204525c
        .extern func_02045570
        .extern func_02045618
        .extern func_02045744
        .global func_0204550c
        .arm
func_0204550c:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    bl func_02045744
    bl func_02045570
    cmp r0, #0x0
    beq .L_48
    bl func_0203cb90
    mov r2, r0
    cmp r2, #0x63
    ldr r1, _LIT0
    movhi r2, #0x63
    mov r0, #0x8
    sub r1, r1, r2
    bl func_0204525c
    bl func_02045618
    add sp, sp, #0x4
    mov r0, #0x1
    ldmfd sp!, {pc}
.L_48:
    mov r0, #0x0
    add sp, sp, #0x4
    ldmfd sp!, {pc}
_LIT0: .word 0xffff2d10
