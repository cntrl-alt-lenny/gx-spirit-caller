; func_ov002_022aaf8c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cc4b4
        .extern func_02006c0c
        .extern Task_Invoke
        .extern func_0201d710
        .extern func_0208f920
        .global func_ov002_022aaf8c
        .arm
func_ov002_022aaf8c:
    stmdb sp!, {r3, r4, r5, lr}
    movs r5, r1
    ldrne r2, [r0, #0x8]
    addne r1, r5, #0x15
    cmpne r2, r1
    ldmeqia sp!, {r3, r4, r5, pc}
    str r1, [r0, #0x8]
    ldr r0, _LIT0
    mov r1, #0x4
    mov r2, #0x0
    bl func_02006c0c
    mov r4, r0
    bl func_0201d710
    sub r1, r5, #0x1
    add r0, r0, r1, lsl #0x8
    mov r1, #0x1f40
    mov r2, #0x100
    bl func_0208f920
    mov r0, r4
    bl Task_Invoke
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov002_022cc4b4
