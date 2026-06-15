; func_02088070 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02095030
        .extern func_020955a8
        .extern func_020955e8
        .extern func_02095678
        .global func_02088070
        .arm
func_02088070:
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0x24]
    mov r1, r1, lsl #0x1e
    movs r1, r1, asr #0x1f
    ldmeqia sp!, {r4, pc}
    ldr r2, [r0, #0x40]
    mov r3, #0x1
    mov r1, #0x0
    mov r2, r3, lsl r2
    ldr r0, [r0, #0x44]
    mov r3, r1
    bl func_02095030
    bl func_020955a8
    mov r4, r0
    mov r0, #0x1
    bl func_02095678
    mov r0, r4
    bl func_020955e8
    ldmia sp!, {r4, pc}
