; func_02033584 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02032de4
        .extern func_02094500
        .global func_02033584
        .arm
func_02033584:
    stmdb sp!, {r4, r5, r6, lr}
    sub r3, r1, #0x1
    mul r5, r3, r2
    mov r6, r0
    str r1, [r6, #0xe98]
    str r2, [r6, #0xe9c]
    mov r1, r5
    mov r2, #0x4
    bl func_02032de4
    movs r4, r0
    mvneq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r2, r5
    mov r1, #0x0
    bl func_02094500
    str r4, [r6, #0xea0]
    mov r0, #0x0
    ldmia sp!, {r4, r5, r6, pc}
