; func_02087314 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a4778
        .extern func_02094e80
        .global func_02087314
        .arm
func_02087314:
    stmdb sp!, {r4, lr}
    movs r4, r0
    moveq r0, #0x1
    ldmeqia sp!, {r4, pc}
    ldr r1, _LIT0
    ldr r1, [r1]
    ands r1, r4, r1
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    mov r1, #0x0
    bl func_02094e80
    ldr r1, _LIT0
    mov r0, #0x1
    ldr r2, [r1]
    orr r2, r2, r4
    str r2, [r1]
    ldmia sp!, {r4, pc}
_LIT0: .word data_021a4778
