; func_0203276c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02032e18
        .global func_0203276c
        .arm
func_0203276c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r1, [r4, #0xea0]
    cmp r1, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_02032e18
    mov r0, #0x0
    str r0, [r4, #0xea0]
    ldmia sp!, {r4, pc}
