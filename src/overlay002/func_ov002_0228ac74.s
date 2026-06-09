; func_ov002_0228ac74 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022ce288
        .extern func_ov002_0228a9a4
        .global func_ov002_0228ac74
        .arm
func_ov002_0228ac74:
    stmdb sp!, {r3, lr}
    ldr r2, _LIT0
    ldr r3, [r2, #0x5d4]
    cmp r3, #0x0
    moveq r0, #0x0
    ldmeqia sp!, {r3, pc}
    ldrb r2, [r2, #0x5dc]
    cmp r2, #0x5
    movls r0, #0x0
    ldmlsia sp!, {r3, pc}
    cmp r2, #0x12
    cmpne r2, #0x13
    bne .L_3c
    mov r0, #0x0
    ldmia sp!, {r3, pc}
.L_3c:
    bl func_ov002_0228a9a4
    ldmia sp!, {r3, pc}
_LIT0: .word data_ov002_022ce288
