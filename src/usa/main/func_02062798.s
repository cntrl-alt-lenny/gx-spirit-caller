; func_02062798 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020629ac
        .extern func_02062d84
        .global func_02062798
        .arm
func_02062798:
    stmfd sp!, {lr}
    sub sp, sp, #0x4
    cmp r3, #0x0
    beq .L_1c
    bl func_02062d84
    add sp, sp, #0x4
    ldmfd sp!, {pc}
.L_1c:
    bl func_020629ac
    add sp, sp, #0x4
    ldmfd sp!, {pc}
