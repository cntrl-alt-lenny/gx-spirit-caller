; func_0208722c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02087ab4
        .extern func_02088cc0
        .extern func_0208a8f8
        .extern func_02095678
        .extern func_0209591c
        .global func_0208722c
        .arm
func_0208722c:
    stmdb sp!, {r4, lr}
    mov r4, #0x0
.L_8:
    mov r0, r4
    bl func_0209591c
    cmp r0, #0x0
    bne .L_8
    bl func_02087ab4
    bl func_02088cc0
    bl func_0208a8f8
    mov r0, #0x0
    bl func_02095678
    ldmia sp!, {r4, pc}
