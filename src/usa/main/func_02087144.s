; func_02087144 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020879cc
        .extern func_02088bd8
        .extern func_0208a810
        .extern func_02095584
        .extern func_02095828
        .global func_02087144
        .arm
func_02087144:
    stmdb sp!, {r4, lr}
    mov r4, #0x0
.L_8:
    mov r0, r4
    bl func_02095828
    cmp r0, #0x0
    bne .L_8
    bl func_020879cc
    bl func_02088bd8
    bl func_0208a810
    mov r0, #0x0
    bl func_02095584
    ldmia sp!, {r4, pc}
