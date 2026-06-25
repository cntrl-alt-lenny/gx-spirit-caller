; func_020492a8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dba0
        .extern func_0204520c
        .extern func_02048e60
        .global func_020492a8
        .arm
func_020492a8:
    stmdb sp!, {r4, lr}
    ldr r2, _LIT0
    mov r4, r0
    ldr r2, [r2]
    cmp r2, #0x0
    ldmeqia sp!, {r4, pc}
    cmp r4, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_0204520c
    ldr r0, _LIT0
    ldr r3, [r0]
    ldr r0, [r3]
    cmp r0, #0x0
    beq .L_54
    cmp r0, #0x2
    beq .L_54
    ldrb r1, [r3, #0x1d]
    ldr r2, [r3, #0x30]
    ldr r3, [r3, #0x2c]
    mov r0, r4
    blx r3
.L_54:
    bl func_02048e60
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219dba0
