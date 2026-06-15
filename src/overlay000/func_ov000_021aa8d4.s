; func_ov000_021aa8d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov000_021c73e0
        .extern func_0208bf3c
        .extern func_0208c490
        .global func_ov000_021aa8d4
        .arm
func_ov000_021aa8d4:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r0, _LIT0
    ldr r5, [r0]
    ldr r3, [r5, #0x38]
    ldr r2, [r5, #0x2c]
    ldr r1, [r5, #0x30]
    ldr r0, [r5, #0x24]
    sub r4, r3, r2
    sub r1, r1, r0
    smull r0, r2, r1, r1
    adds r3, r0, #0x800
    smull r1, r0, r4, r4
    adc r2, r2, #0x0
    adds r1, r1, #0x800
    mov r3, r3, lsr #0xc
    adc r0, r0, #0x0
    mov r1, r1, lsr #0xc
    orr r3, r3, r2, lsl #0x14
    orr r1, r1, r0, lsl #0x14
    add r0, r3, r1
    bl func_0208bf3c
    ldr r3, [r5, #0x28]
    ldr r2, [r5, #0x34]
    mov r1, r0
    ldr ip, [r5, #0x24]
    ldr r4, [r5, #0x30]
    sub r0, r3, r2
    sub r4, ip, r4
    bl func_0208c490
    ldr r1, _LIT1
    ldr r2, _LIT2
    umull ip, r3, r0, r1
    mla r3, r0, r2, r3
    mov r0, r0, asr #0x1f
    mla r3, r0, r1, r3
    adds r0, ip, #0x0
    adc r0, r3, #0x800
    mov r1, r0, asr #0xc
    add r0, r5, #0x100
    strh r1, [r0, #0x2c]
    ldr r2, [r5, #0x2c]
    ldr r1, [r5, #0x38]
    mov r0, r4
    sub r1, r2, r1
    bl func_0208c490
    ldr r1, _LIT1
    ldr r2, _LIT2
    umull r4, r3, r0, r1
    adds r4, r4, #0x0
    mla r3, r0, r2, r3
    mov r0, r0, asr #0x1f
    mla r3, r0, r1, r3
    adc r0, r3, #0x800
    mov r1, r0, asr #0xc
    add r0, r5, #0x100
    strh r1, [r0, #0x2e]
    mov r1, #0x0
    strh r1, [r0, #0x30]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_ov000_021c73e0
_LIT1: .word 0x60db9391
_LIT2: .word 0x000028be
