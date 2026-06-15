; func_02028754 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02005ca0
        .extern func_02005e20
        .extern func_020211a4
        .global func_02028754
        .arm
func_02028754:
    stmdb sp!, {r3, lr}
    mov r0, #0x0
    bl func_020211a4
    cmp r0, #0x0
    beq .L_34
    mov r0, #0x1
    bl func_02005e20
    mov r0, #0x2
    bl func_02005e20
    mov r0, #0x1
    bl func_02005ca0
    mov r0, #0x2
    bl func_02005ca0
.L_34:
    mov r0, #0x1
    ldmia sp!, {r3, pc}
