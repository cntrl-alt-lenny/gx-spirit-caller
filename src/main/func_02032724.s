; func_02032724 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02032e6c
        .global func_02032724
        .arm
func_02032724:
    stmdb sp!, {r4, lr}
    add r4, r0, #0x1fc
    ldr r1, [r4, #0xc80]
    cmp r1, #0x0
    ldmeqia sp!, {r4, pc}
    bl func_02032e6c
    mov r0, #0x0
    str r0, [r4, #0xc80]
    ldmia sp!, {r4, pc}
