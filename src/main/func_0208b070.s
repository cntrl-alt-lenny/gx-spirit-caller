; func_0208b070 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_020b3870
        .global func_0208b070
        .arm
func_0208b070:
    stmdb sp!, {r4, lr}
    ldr r1, [r0, #0xc]
    ldr r2, [r0, #0x8]
    cmp r2, r1
    ldrge r0, [r0, #0x4]
    ldmgeia sp!, {r4, pc}
    ldr r4, [r0]
    ldr r0, [r0, #0x4]
    sub r0, r0, r4
    mul r0, r2, r0
    bl func_020b3870
    add r0, r4, r0
    ldmia sp!, {r4, pc}
