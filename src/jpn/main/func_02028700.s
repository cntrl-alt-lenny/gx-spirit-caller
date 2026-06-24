; func_02028700 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02005c84
        .extern func_02005e04
        .extern func_02021150
        .global func_02028700
        .arm
func_02028700:
    stmdb sp!, {r3, lr}
    mov r0, #0x0
    bl func_02021150
    cmp r0, #0x0
    beq .L_8a4
    mov r0, #0x1
    bl func_02005e04
    mov r0, #0x2
    bl func_02005e04
    mov r0, #0x1
    bl func_02005c84
    mov r0, #0x2
    bl func_02005c84
.L_8a4:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
