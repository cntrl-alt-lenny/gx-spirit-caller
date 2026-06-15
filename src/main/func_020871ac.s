; func_020871ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02087ee4
        .extern func_02088874
        .extern func_0208aa0c
        .extern func_02094cec
        .extern func_02095030
        .extern func_020955a8
        .extern func_020955e8
        .extern func_02095678
        .global func_020871ac
        .arm
func_020871ac:
    stmdb sp!, {r4, lr}
    mov r0, #0x0
    bl func_02087ee4
    mov r0, #0x0
    bl func_0208aa0c
    bl func_02088874
    mov r0, #0x0
    bl func_02094cec
    ldr r0, _LIT0
    mov r3, #0x0
    mov r1, r0
    mov r2, r0
    bl func_02095030
    bl func_020955a8
    mov r4, r0
    mov r0, #0x1
    bl func_02095678
    mov r0, r4
    bl func_020955e8
    ldmia sp!, {r4, pc}
_LIT0: .word 0x0000ffff
