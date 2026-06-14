; func_ov006_021b81dc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_0224f3e0
        .extern data_ov006_0224f400
        .extern func_ov006_021b9a00
        .global func_ov006_021b81dc
        .arm
func_ov006_021b81dc:
    stmdb sp!, {r4, r5, r6, r7, r8, r9, sl, lr}
    mov r6, r1
    mov r7, r0
    cmp r6, #0x4
    addls pc, pc, r6, lsl #0x2
    b .L_56c
    b .L_50c
    b .L_520
    b .L_534
    b .L_548
    b .L_55c
.L_50c:
    add r0, r7, #0x1d8
    add r1, r7, #0x2a0
    add r5, r0, #0x8000
    add r4, r1, #0x6000
    b .L_56c
.L_520:
    add r0, r7, #0x158
    add r1, r7, #0xa60
    add r5, r0, #0xb000
    add r4, r1, #0x7000
    b .L_56c
.L_534:
    add r0, r7, #0x358
    add r1, r7, #0xc60
    add r5, r0, #0xb400
    add r4, r1, #0x7000
    b .L_56c
.L_548:
    add r0, r7, #0x158
    add r1, r7, #0xe60
    add r5, r0, #0xbc00
    add r4, r1, #0x7000
    b .L_56c
.L_55c:
    add r0, r7, #0x358
    add r1, r7, #0x60
    add r5, r0, #0xc000
    add r4, r1, #0x8000
.L_56c:
    ldr r2, _LIT0
    mov r0, #0xe
    add r1, r7, r6, lsl #0x1
    mla r0, r6, r0, r2
    add r1, r1, #0x8100
    ldrh r8, [r1, #0x60]
    ldr r1, _LIT1
    mov r9, #0x0
    strh r9, [r1, #0x2]
    mov r2, #0x1
.L_594:
    mov r3, r9, lsl #0x1
    ldrsh r3, [r0, r3]
    cmp r3, #0x0
    ldrgeh r3, [r1, #0x2]
    orrge r3, r3, r2, lsl r9
    add r9, r9, #0x1
    strgeh r3, [r1, #0x2]
    cmp r9, #0x7
    blt .L_594
    mov r9, #0x0
    mov sl, r9
    cmp r8, #0x0
    ble .L_604
.L_5c8:
    ldrh r1, [r4]
    mov r0, r6
    bl func_ov006_021b9a00
    cmp r0, #0x0
    beq .L_5f4
    ldrh r0, [r4]
    add r9, r9, #0x1
    strh r0, [r5]
    ldrb r0, [r4, #0x2]
    strb r0, [r5, #0x2]
    add r5, r5, #0x4
.L_5f4:
    add sl, sl, #0x1
    cmp sl, r8
    add r4, r4, #0x4
    blt .L_5c8
.L_604:
    add r0, r7, r6, lsl #0x1
    add r0, r0, #0xc600
    strh r9, [r0, #0x58]
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, r7, r8, r9, sl, pc}
_LIT0: .word data_ov006_0224f400
_LIT1: .word data_ov006_0224f3e0
