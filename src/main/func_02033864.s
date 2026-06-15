; func_02033864 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02046ae0
        .extern func_02046ba8
        .global func_02033864
        .arm
func_02033864:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xeb4]
    tst r0, #0x10000
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    bl func_02046ae0
    cmp r0, #0x1
    ldrgt r0, [r4, #0xeb4]
    orrgt r0, r0, #0x10000
    strgt r0, [r4, #0xeb4]
    bl func_02046ba8
    cmp r0, #0x0
    ldrne r1, [r4, #0xeb4]
    bicne r1, r1, #0x10000
    strne r1, [r4, #0xeb4]
    ldmia sp!, {r4, pc}
