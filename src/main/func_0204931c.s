; func_0204931c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc80
        .extern func_0204525c
        .extern func_02048ed4
        .global func_0204931c
        .arm
func_0204931c:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2]
    cmp r2, #0x0
    ldmeqia sp!, {r4, pc}
    cmp r4, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_0204525c
    ldr r0, _LIT0
    ldr r3, [r0]
    ldr r0, [r3]
    cmp r0, #0x0
    beq .L_3c4
    cmp r0, #0x2
    beq .L_3c4
    ldrb r1, [r3, #0x1d]
    ldr r2, [r3, #0x30]
    ldr r3, [r3, #0x2c]
    mov r0, r4
    blx r3
.L_3c4:
    bl func_02048ed4
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219dc80
