; func_0208708c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02088734
        .extern func_02094f3c
        .extern func_020954b4
        .extern func_020954f4
        .extern func_02095584
        .global func_0208708c
        .arm
func_0208708c:
    stmdb sp!, {r4, lr}
    bl func_02088734
    mov r0, #0x0
    mov r1, r0
    mov r2, r0
    mov r3, r0
    bl func_02094f3c
    bl func_020954b4
    mov r4, r0
    mov r0, #0x1
    bl func_02095584
    mov r0, r4
    bl func_020954f4
    ldmia sp!, {r4, pc}
