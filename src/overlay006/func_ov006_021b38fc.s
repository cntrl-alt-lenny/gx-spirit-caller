; func_ov006_021b38fc — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_ov006_0224f1fc
        .extern data_ov006_0225c4dc
        .extern data_ov006_0225cb5c
        .extern data_ov006_0225de70
        .extern data_ov006_0225df3c
        .extern data_ov006_0225e068
        .extern data_ov006_0225e100
        .extern data_ov006_0225e138
        .extern func_ov006_021b37bc
        .extern func_ov006_021ba090
        .extern func_ov006_021c159c
        .extern func_ov006_021c6990
        .extern func_ov006_021c757c
        .extern func_ov006_021c9ef4
        .extern func_ov006_021cac30
        .extern func_ov006_021cb0a0
        .global func_ov006_021b38fc
        .arm
func_ov006_021b38fc:
    stmdb sp!, {r4, lr}
    ldr r1, _LIT0
    ldr r0, _LIT1
    ldr r4, [r1, #0x44]
    bl func_ov006_021cb0a0
    ldr r0, _LIT2
    bl func_ov006_021cac30
    ldr r0, _LIT3
    bl func_ov006_021c9ef4
    ldr r0, _LIT4
    bl func_ov006_021c757c
    ldr r0, _LIT5
    bl func_ov006_021c6990
    ldr r0, _LIT6
    bl func_ov006_021c159c
    ldr r0, _LIT0
    bl func_ov006_021ba090
    bl func_ov006_021b37bc
    cmp r4, #0x0
    beq .L_70
    cmp r4, #0x3
    bne .L_70
    ldr r0, _LIT7
    mov r1, #0x0
    str r1, [r0, #0xc]
    mov r1, #0x1
    str r1, [r0]
    b .L_80
.L_70:
    ldr r0, _LIT7
    mov r1, #0x1
    str r1, [r0, #0xc]
    str r1, [r0]
.L_80:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov006_0225c4dc
_LIT1: .word data_ov006_0225e138
_LIT2: .word data_ov006_0225e100
_LIT3: .word data_ov006_0225e068
_LIT4: .word data_ov006_0225df3c
_LIT5: .word data_ov006_0225de70
_LIT6: .word data_ov006_0225cb5c
_LIT7: .word data_ov006_0224f1fc
