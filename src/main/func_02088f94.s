; func_02088f94 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a524c
        .extern func_02088874
        .extern func_0208b0a4
        .global func_02088f94
        .arm
func_02088f94:
    stmdb sp!, {r4, lr}
    ldr r4, _LIT0
    mov r2, r0
    ldr r0, [r4]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r0, [r4, #0x4]
    cmp r0, #0x0
    ldmneia sp!, {r4, pc}
    cmp r2, #0x0
    bne .L_e4
    bl func_02088874
    ldmia sp!, {r4, pc}
.L_e4:
    add r0, r4, #0x3c
    mov r1, #0x0
    bl func_0208b0a4
    mov r0, #0x1
    str r0, [r4, #0x4c]
    ldmia sp!, {r4, pc}
_LIT0: .word data_021a524c
