; func_ov008_021ad8e8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2670
        .extern data_ov008_021b2ca0
        .extern data_ov008_021b2ca8
        .extern func_ov008_021aa3c0
        .global func_ov008_021ad8e8
        .arm
func_ov008_021ad8e8:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r5, #0x0
    ldr r7, _LIT0
    ldr r8, _LIT1
    ldr r9, _LIT2
    mov r4, r5
.L_1410:
    ldrh r0, [r9, #0x6]
    ldrh r6, [r7, #0x8]
    mov r0, r0, lsl #0x18
    cmp r4, r0, lsr #0x18
    bne .L_143c
    ldr r0, [r8, #0xc]
    bl func_ov008_021aa3c0
    mov sl, r0
    ldr r0, [r8, #0x10]
    bl func_ov008_021aa3c0
    b .L_1450
.L_143c:
    ldr r0, [r7, #0x10]
    bl func_ov008_021aa3c0
    mov sl, r0
    ldr r0, [r7, #0x14]
    bl func_ov008_021aa3c0
.L_1450:
    add r0, sl, r0
    mla r5, r0, r6, r5
    add r4, r4, #0x1
    cmp r4, #0x1a
    add r7, r7, #0x34
    blt .L_1410
    mov r0, r5
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov008_021b2670
_LIT1: .word data_ov008_021b2ca8
_LIT2: .word data_ov008_021b2ca0
