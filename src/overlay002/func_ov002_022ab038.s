; func_ov002_022ab038 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cc498
        .extern data_ov002_022cc4d0
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d710
        .extern func_0208f920
        .global func_ov002_022ab038
        .arm
func_ov002_022ab038:
    stmdb sp!, {r3, r4, r5, lr}
    movs r5, r1
    ldrne r1, [r0, #0xc]
    cmpne r1, r5
    ldmeqia sp!, {r3, r4, r5, pc}
    str r5, [r0, #0xc]
    cmp r5, #0x7
    ldrlt r0, _LIT0
    mov r1, #0x4
    ldrge r0, _LIT1
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    cmp r5, #0x7
    sublt r5, r5, #0x1
    subge r5, r5, #0x8
    mov r0, r4
    bl func_0201d710
    add r0, r0, r5, lsl #0x8
    mov r1, #0x2140
    mov r2, #0x100
    bl func_0208f920
    mov r0, r4
    bl Task_Invoke
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cc4d0
_LIT1: .word data_ov002_022cc498
