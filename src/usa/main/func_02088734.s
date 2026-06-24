; func_02088734 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a516c
        .extern func_02094f3c
        .extern func_020954b4
        .extern func_020954f4
        .extern func_02095584
        .global func_02088734
        .arm
func_02088734:
    stmdb sp!, {r4, lr}
    ldr r3, _LIT0
    ldr r0, [r3]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    ldr r1, [r3, #0x2c]
    cmp r1, #0x0
    movge r0, #0x1
    movge r2, r0, lsl r1
    ldr r0, [r3, #0x24]
    ldr r1, [r3, #0x28]
    movlt r2, #0x0
    mov r3, #0x0
    bl func_02094f3c
    bl func_020954b4
    mov r4, r0
    mov r0, #0x1
    bl func_02095584
    mov r0, r4
    bl func_020954f4
    ldmia sp!, {r4, pc}
_LIT0: .word data_021a516c
