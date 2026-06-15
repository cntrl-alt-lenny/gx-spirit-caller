; func_02037208 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_0219b2e0
        .extern func_02034a84
        .extern func_02036d7c
        .global func_02037208
        .arm
func_02037208:
    stmdb sp!, {r4, r5, r6, lr}
    ldr ip, _LIT0
    mov r6, r1
    ldrh r1, [ip, #0x12]
    mov r5, r2
    mov r4, r3
    tst r1, #0x4000
    moveq r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    bl func_02034a84
    mov r1, r6
    mov r2, r5
    orr r0, r0, #0x1000000
    orr r3, r4, #0x1400
    bl func_02036d7c
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_0219b2e0
