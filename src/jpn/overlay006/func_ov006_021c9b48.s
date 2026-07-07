; func_ov006_021c9b48 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e6c
        .extern data_ov006_021ce530
        .global func_ov006_021c9b48
        .arm
func_ov006_021c9b48:
    stmdb sp!, {r3, r4, r5, lr}
    ldr r3, _LIT0
    ldr r4, [r0, #0x74]
    ldr r3, [r3, #0x4]
    mov r3, r3, lsl #0x1d
    movs r3, r3, lsr #0x1d
    ldreq ip, _LIT1
    mov r3, #0x14
    ldrne ip, _LIT2
    mla r5, r4, r3, ip
    ldr r4, [r5, #0xc]
    cmp r4, #0x0
    mvneq r0, #0x0
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr ip, [r0, #0x78]
    ldrb r3, [r5, #0x6]
    mla lr, ip, r2, r1
    ldrb r1, [r5, #0x7]
    smulbb r2, r3, r1
    cmp lr, r2
    blt .L_94
    ldr r1, [r0, #0x5c]
    cmp r1, #0x0
    beq .L_80
    cmp lr, r2
    moveq r0, #0x5
    ldmeqia sp!, {r3, r4, r5, pc}
    ldr r0, [r0, #0x60]
    cmp r0, #0x0
    movne r0, #0x6
    moveq r0, #0x7
    ldmia sp!, {r3, r4, r5, pc}
.L_80:
    ldr r0, [r0, #0x60]
    cmp r0, #0x0
    movne r0, #0x6
    moveq r0, #0x7
    ldmia sp!, {r3, r4, r5, pc}
.L_94:
    mov r0, lr, lsl #0x1
    ldrsh r0, [r4, r0]
    ldmia sp!, {r3, r4, r5, pc}
_LIT0: .word data_02104e6c
_LIT1: .word data_ov006_021ce530
_LIT2: .word data_ov006_021ce530+0x258
