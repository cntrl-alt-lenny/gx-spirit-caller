; func_02033814 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern func_02046a74
        .extern func_02046b3c
        .global func_02033814
        .arm
func_02033814:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0xeac]
    tst r0, #0x10000
    movne r0, #0x0
    ldmneia sp!, {r4, pc}
    bl func_02046a74
    cmp r0, #0x1
    ldrgt r0, [r4, #0xeac]
    orrgt r0, r0, #0x10000
    strgt r0, [r4, #0xeac]
    bl func_02046b3c
    cmp r0, #0x0
    ldrne r1, [r4, #0xeac]
    bicne r1, r1, #0x10000
    strne r1, [r4, #0xeac]
    ldmia sp!, {r4, pc}
