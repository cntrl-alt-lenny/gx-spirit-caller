; func_020480b4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219dc78
        .extern func_0204525c
        .extern func_0204802c
        .global func_020480b4
        .arm
func_020480b4:
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
    ldr r0, [r0]
    ldr r3, [r0, #0x14]
    cmp r3, #0x0
    beq .L_ac
    ldr r2, [r0, #0x18]
    mov r0, r4
    mov r1, #0x0
    blx r3
.L_ac:
    bl func_0204802c
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219dc78
