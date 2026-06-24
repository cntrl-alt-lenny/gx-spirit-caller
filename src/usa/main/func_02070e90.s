; func_02070e90 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219ee3c
        .extern data_021a62f0
        .extern func_02070fa4
        .global func_02070e90
        .arm
func_02070e90:
    stmdb sp!, {r4, lr}
    ldr r3, _LIT0
    ldr r3, [r3, #0x4]
    ldr r4, [r3, #0xa4]
    cmp r4, #0x0
    ldmeqia sp!, {r4, lr}
    bxeq lr
    ldr r3, _LIT1
    cmp r2, r3
    ldreq r2, _LIT2
    ldreq r2, [r2]
    cmp r0, #0x0
    strh r1, [r4, #0x1a]
    ldrh r1, [r4, #0x1a]
    strh r1, [r4, #0x18]
    str r2, [r4, #0x20]
    ldr r1, [r4, #0x20]
    str r1, [r4, #0x1c]
    strneh r0, [r4, #0xa]
    ldmneia sp!, {r4, lr}
    bxne lr
    bl func_02070fa4
    strh r0, [r4, #0xa]
    ldmia sp!, {r4, lr}
    bx lr
_LIT0: .word data_021a62f0
_LIT1: .word 0x7f000001
_LIT2: .word data_0219ee3c
