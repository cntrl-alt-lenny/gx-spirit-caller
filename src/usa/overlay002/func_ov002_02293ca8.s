; func_ov002_02293ca8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov002_022cf0c4
        .extern func_ov002_02280870
        .global func_ov002_02293ca8
        .arm
func_ov002_02293ca8:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldrh r0, [r4, #0x2]
    mov r1, r0, lsl #0x1a
    mov r1, r1, lsr #0x1b
    cmp r1, #0xa
    movcs r0, #0x0
    ldmcsia sp!, {r4, pc}
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02280870
    cmp r0, #0x0
    movgt r0, #0x0
    ldmgtia sp!, {r4, pc}
    ldrh r1, [r4, #0x2]
    ldr r0, _LIT0
    ldr r3, _LIT1
    mov r2, r1, lsl #0x1f
    mov r2, r2, lsr #0x1f
    and ip, r2, #0x1
    mov r1, r1, lsl #0x1a
    mov r2, r1, lsr #0x1b
    mov r1, #0x14
    mul r1, r2, r1
    mla r0, ip, r0, r3
    mov r2, #0x1
    strh r2, [r1, r0]
    ldrh r0, [r4, #0x2]
    mov r0, r0, lsl #0x1f
    mov r0, r0, lsr #0x1f
    bl func_ov002_02280870
    ldrh r2, [r4, #0x2]
    ldr r1, _LIT0
    ldr r4, _LIT1
    mov r3, r2, lsl #0x1f
    mov r3, r3, lsr #0x1f
    and ip, r3, #0x1
    mov r2, r2, lsl #0x1a
    mov r3, r2, lsr #0x1b
    mov r2, #0x14
    mul r2, r3, r2
    mla r1, ip, r1, r4
    mov r3, #0x0
    strh r3, [r2, r1]
    cmp r0, #0x0
    movgt r3, #0x1
    mov r0, r3
    ldmia sp!, {r4, pc}
_LIT0: .word 0x00000868
_LIT1: .word data_ov002_022cf0c4
