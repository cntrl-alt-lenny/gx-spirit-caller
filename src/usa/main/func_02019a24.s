; func_02019a24 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02102b84
        .extern func_0201990c
        .global func_02019a24
        .arm
func_02019a24:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, _LIT0
    mov r2, #0x0
    ldr ip, [r3]
    ldmib r3, {r1, lr}
    umull r5, r4, lr, ip
    mla r4, lr, r1, r4
    ldr r1, [r3, #0xc]
    ldr lr, [r3, #0x10]
    mla r4, r1, ip, r4
    ldr r1, [r3, #0x14]
    adds r5, lr, r5
    adc r4, r1, r4
    mov r1, #0x65
    umull ip, lr, r4, r1
    str r5, [r3]
    mla lr, r4, r2, lr
    mov ip, r2
    mla lr, ip, r1, lr
    mov r1, #0x2
    cmp lr, #0x5
    str r4, [r3, #0x4]
    movlt r1, r2
    blt .L_180
    cmp lr, #0x1e
    movlt r1, #0x1
.L_180:
    bl func_0201990c
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02102b84
