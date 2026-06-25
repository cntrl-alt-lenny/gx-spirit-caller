; func_020895e4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a5720
        .extern func_020893f8
        .extern func_02097f94
        .extern func_02098068
        .extern func_02098294
        .global func_020895e4
        .arm
func_020895e4:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov ip, #0x0
    str ip, [r6, #0x8c]
    str ip, [r6, #0x84]
    add r0, r6, #0x7c
    mov r5, r2
    mov r4, r3
    str ip, [r6, #0x88]
    bl func_02098068
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    add r0, r6, #0x34
    bl func_02098294
    add r1, r6, #0x7c
    add r0, r6, #0x34
    ldmia r1, {r1, r2}
    bl func_02097f94
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r3, #0x1
    mov r0, r6
    mov r1, r5
    mov r2, r4
    str r3, [r6, #0x30]
    bl func_020893f8
    cmp r0, #0x0
    ldrne r0, _LIT0
    strne r6, [r0]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_021a5720
