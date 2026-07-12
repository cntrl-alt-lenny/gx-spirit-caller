; func_ov008_021ad984 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b267c
        .extern data_ov008_021b2680
        .extern data_ov008_021b2684
        .extern data_ov008_021b2ca0
        .extern data_ov008_021b2ca8
        .extern data_ov008_021b2cae
        .extern func_02094410
        .global func_ov008_021ad984
        .arm
func_ov008_021ad984:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    ldr r3, _LIT0
    mov r5, r0
    ldr r1, _LIT1
    ldr r4, [r3, #0x18]
    mov r0, #0x0
    mov r2, #0x1c
    bl func_02094410
    cmp r5, #0x0
    ldmneia sp!, {r3, r4, r5, r6, r7, pc}
    ldr r0, _LIT2
    ldr r7, _LIT0
    ldrh r1, [r0, #0x6]
    ldrh r3, [r7, #0x6]
    mov r0, #0x34
    mov r1, r1, lsl #0x18
    mov r1, r1, lsr #0x18
    mul r2, r1, r0
    ldr r0, _LIT3
    ldr r6, _LIT4
    ldrh r1, [r0, r2]
    mov lr, #0x5
    bic r0, r3, #0xff
    mov r5, r1, lsr #0x1f
    smull r3, ip, r6, r1
    add ip, r5, ip, asr #0x1
    smull ip, r3, lr, ip
    smull r3, lr, r6, r1
    add lr, r5, lr, asr #0x1
    mov r3, lr, lsl #0x10
    mov r3, r3, lsr #0x10
    and r3, r3, #0xff
    orr r0, r0, r3
    strh r0, [r7, #0x6]
    subs ip, r1, ip
    beq .L_bc
    ldr r5, _LIT5
    ldrh r3, [r5]
    mov r0, r3, lsl #0x18
    mov r0, r0, lsr #0x18
    add r0, r0, #0x1
    mov r0, r0, lsl #0x10
    mov r0, r0, lsr #0x10
    bic r3, r3, #0xff
    and r0, r0, #0xff
    orr r0, r3, r0
    strh r0, [r5]
.L_bc:
    ldr r0, _LIT0
    ldr r5, _LIT6
    ldrh r6, [r0, #0x6]
    ldr r3, _LIT7
    mov r1, r1, lsl #0x18
    bic r6, r6, #0xff00
    orr r1, r6, r1, lsr #0x10
    ldr r5, [r5, r2]
    strh r1, [r0, #0x6]
    ldr r1, [r3, r2]
    str r5, [r0, #0xc]
    str r1, [r0, #0x10]
    str r4, [r0, #0x18]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_ov008_021b2ca8
_LIT1: .word data_ov008_021b2ca8
_LIT2: .word data_ov008_021b2ca0
_LIT3: .word data_ov008_021b267c
_LIT4: .word 0x66666667
_LIT5: .word data_ov008_021b2cae
_LIT6: .word data_ov008_021b2680
_LIT7: .word data_ov008_021b2684
