; func_02085664 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .global func_02085664
        .arm
func_02085664:
    ands r2, r3, #0x4
    ldrne r1, [r0]
    orrne r1, r1, #0x1
    strne r1, [r0]
    bne .L_19c
    ldr r2, [r1]
    str r2, [r0, #0x4]
    ldr r2, [r1, #0x4]
    str r2, [r0, #0x8]
    ldr r1, [r1, #0x8]
    str r1, [r0, #0xc]
.L_19c:
    ldr r1, [r0]
    orr r1, r1, #0x18
    str r1, [r0]
    bx lr
