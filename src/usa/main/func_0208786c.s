; func_0208786c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020874f8
        .extern func_020876a8
        .extern func_0208afbc
        .global func_0208786c
        .arm
func_0208786c:
    stmdb sp!, {r4, lr}
    movs r4, r0
    mov r2, r1
    ldmeqia sp!, {r4, pc}
    ldrb r1, [r4, #0x2c]
    cmp r1, #0x0
    ldmeqia sp!, {r4, pc}
    cmp r2, #0x0
    bne .L_2c
    bl func_020876a8
    ldmia sp!, {r4, pc}
.L_2c:
    add r0, r4, #0x1c
    mov r1, #0x0
    bl func_0208afbc
    mov r0, r4
    mov r1, #0x0
    bl func_020874f8
    mov r0, #0x2
    strb r0, [r4, #0x2c]
    ldmia sp!, {r4, pc}
