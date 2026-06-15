; func_ov008_021aceac — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov008_021b2780
        .extern data_ov008_021b279c
        .extern data_ov008_021b27a0
        .extern data_ov008_021b27a4
        .extern data_ov008_021b2dc0
        .extern data_ov008_021b2dc8
        .extern func_ov008_021ada90
        .global func_ov008_021aceac
        .arm
func_ov008_021aceac:
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
    add r3, r3, r5, lsr #0x18
    mul r2, r3, r2
    ldrh r2, [r4, r2]
    cmp r2, #0x0
    ble .L_958
    mov r4, #0x1
.L_924:
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
    blt .L_924
.L_958:
    mov r0, #0x34
    mul lr, r3, r0
    ldr r0, _LIT0
    ldr r1, _LIT3
    ldr ip, [r0, #0xc]
    ldr r2, _LIT4
    str ip, [r1, lr]
    ldr ip, [r0, #0x10]
    mov r0, r3, lsl #0x10
    mov r1, r0, lsr #0x10
    ldr r0, _LIT1
    str ip, [r2, lr]
    ldrh r2, [r0, #0x6]
    and r1, r1, #0xff
    bic r2, r2, #0xff
    orr r1, r2, r1
    strh r1, [r0, #0x6]
    bl func_ov008_021ada90
    ldr r0, _LIT5
    ldr r1, [r0, #0x638]
    cmp r1, #0x0
    addeq r1, r1, #0x1
    streq r1, [r0, #0x638]
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_ov008_021b2dc8
_LIT1: .word data_ov008_021b2dc0
_LIT2: .word data_ov008_021b279c
_LIT3: .word data_ov008_021b27a0
_LIT4: .word data_ov008_021b27a4
_LIT5: .word data_ov008_021b2780
