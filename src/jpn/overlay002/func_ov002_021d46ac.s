; func_ov002_021d46ac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cd65c
        .extern data_ov002_022ce870
        .extern data_ov002_022ce878
        .extern data_ov002_022ce87a
        .extern data_ov002_022ce87c
        .extern data_ov002_022ce87e
        .extern func_ov002_0229cc30
        .global func_ov002_021d46ac
        .arm
func_ov002_021d46ac:
    stmdb sp!, {r4, lr}
    ldr ip, _LIT0
    ldr r4, [ip, #0x8]
    cmp r4, #0x3
    ldmeqia sp!, {r4, pc}
    ldr lr, _LIT1
    ldr r4, [lr, #0x808]
    cmp r4, #0x100
    ldmcsia sp!, {r4, pc}
    ldr ip, _LIT2
    mov r4, r4, lsl #0x3
    strh r0, [ip, r4]
    ldr r4, [lr, #0x808]
    ldr r0, _LIT3
    mov r4, r4, lsl #0x3
    strh r1, [r0, r4]
    ldr r1, [lr, #0x808]
    ldr r0, _LIT4
    mov r1, r1, lsl #0x3
    strh r2, [r0, r1]
    ldr r1, [lr, #0x808]
    ldr r0, _LIT5
    mov r1, r1, lsl #0x3
    strh r3, [r0, r1]
    ldr r0, [lr, #0x808]
    add r0, ip, r0, lsl #0x3
    bl func_ov002_0229cc30
    ldr r0, _LIT1
    ldr r1, [r0, #0x808]
    add r1, r1, #0x1
    str r1, [r0, #0x808]
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov002_022cd65c
_LIT1: .word data_ov002_022ce870
_LIT2: .word data_ov002_022ce878
_LIT3: .word data_ov002_022ce87a
_LIT4: .word data_ov002_022ce87c
_LIT5: .word data_ov002_022ce87e
