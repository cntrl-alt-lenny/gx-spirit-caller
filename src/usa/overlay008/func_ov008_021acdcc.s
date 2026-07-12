; func_ov008_021acdcc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2660
        .extern data_ov008_021b267c
        .extern data_ov008_021b2680
        .extern data_ov008_021b2684
        .extern data_ov008_021b2ca0
        .extern data_ov008_021b2ca8
        .extern func_ov008_021ad96c
        .global func_ov008_021acdcc
        .arm
func_ov008_021acdcc:
    stmdb sp!, {r4, r5, r6, lr}
    ldr r0, _LIT0
    mov r1, #0x0
    str r1, [r0, #0x10]
    ldr r2, _LIT1
    str r1, [r0, #0xc]
    ldrh r5, [r2, #0x4]
    mov r2, #0x34
    ldr r4, _LIT2
    mov r3, r5, lsl #0x18
    mov r5, r5, lsl #0x10
    mov r3, r3, lsr #0x18
    add r5, r3, r5, lsr #0x18
    mul r3, r5, r2
    ldrh r2, [r4, r3]
    cmp r2, #0x0
    ble .L_8d0
    mov r4, #0x1
.L_89c:
    mov ip, r1, asr #0x4
    add ip, r1, ip, lsr #0x1b
    mov r5, ip, asr #0x5
    add r6, r0, r5, lsl #0x2
    mov lr, r1, lsr #0x1f
    rsb ip, lr, r1, lsl #0x1b
    ldr r5, [r6, #0xc]
    add ip, lr, ip, ror #0x1b
    orr r5, r5, r4, lsl ip
    add r1, r1, #0x1
    str r5, [r6, #0xc]
    cmp r1, r2
    blt .L_89c
.L_8d0:
    ldr r0, _LIT0
    ldr r2, _LIT3
    ldr ip, [r0, #0xc]
    ldr r1, _LIT4
    str ip, [r2, r3]
    ldr r0, [r0, #0x10]
    str r0, [r1, r3]
    bl func_ov008_021ad96c
    ldr r0, _LIT5
    ldr r1, [r0, #0x638]
    cmp r1, #0x0
    addeq r1, r1, #0x1
    streq r1, [r0, #0x638]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov008_021b2ca8
_LIT1: .word data_ov008_021b2ca0
_LIT2: .word data_ov008_021b267c
_LIT3: .word data_ov008_021b2680
_LIT4: .word data_ov008_021b2684
_LIT5: .word data_ov008_021b2660
