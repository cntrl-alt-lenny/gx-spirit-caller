; func_02087174 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_0208881c
        .extern func_02095030
        .extern func_020955a8
        .extern func_020955e8
        .extern func_02095678
        .global func_02087174
        .arm
func_02087174:
    stmdb sp!, {r4, lr}
    bl func_0208881c
    mov r0, #0x0
    mov r1, r0
    mov r2, r0
    mov r3, r0
    bl func_02095030
    bl func_020955a8
    mov r4, r0
    mov r0, #0x1
    bl func_02095678
    mov r0, r4
    bl func_020955e8
    ldmia sp!, {r4, pc}
