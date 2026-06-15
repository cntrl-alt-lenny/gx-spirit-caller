; func_0204037c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020fe66c
        .extern data_0219d9d4
        .extern func_020418ac
        .global func_0204037c
        .arm
func_0204037c:
    stmdb sp!, {r4, lr}
    ldr r0, _LIT0
    ldr r0, [r0]
    cmp r0, #0x0
    ldmeqia sp!, {r4, pc}
    add r1, r0, #0x1000
    ldr r0, [r1, #0x314]
    ldr r4, [r1, #0x210]
    cmp r0, #0x0
    beq .L_cdc
    bl func_020418ac
.L_cdc:
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r1, [r1]
    mov r2, #0x0
    blx r4
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0]
    ldmia sp!, {r4, pc}
_LIT0: .word data_0219d9d4
_LIT1: .word data_020fe66c
