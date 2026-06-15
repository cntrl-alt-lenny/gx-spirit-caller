; func_020896cc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_021a5800
        .extern func_020894e0
        .extern func_02098088
        .extern func_0209815c
        .extern func_02098388
        .global func_020896cc
        .arm
func_020896cc:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov ip, #0x0
    str ip, [r6, #0x8c]
    str ip, [r6, #0x84]
    add r0, r6, #0x7c
    mov r5, r2
    mov r4, r3
    str ip, [r6, #0x88]
    bl func_0209815c
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    add r0, r6, #0x34
    bl func_02098388
    add r1, r6, #0x7c
    add r0, r6, #0x34
    ldmia r1, {r1, r2}
    bl func_02098088
    cmp r0, #0x0
    ldmeqia sp!, {r4, r5, r6, pc}
    mov r3, #0x1
    mov r0, r6
    mov r1, r5
    mov r2, r4
    str r3, [r6, #0x30]
    bl func_020894e0
    cmp r0, #0x0
    ldrne r0, _LIT0
    strne r6, [r0]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_021a5800
