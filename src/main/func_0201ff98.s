; func_0201ff98 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c6530
        .extern data_020c675c
        .extern data_020c6784
        .extern data_02191f40
        .extern data_02192b00
        .extern func_0201f138
        .extern func_0201f19c
        .extern func_020200d8
        .extern func_02020b84
        .extern func_02020ba0
        .extern func_020a037c
        .global func_0201ff98
        .arm
func_0201ff98:
    stmdb sp!, {r3, lr}
    mov r1, r0
    ldrh r0, [r1, #0x2]
    cmp r0, #0x0
    beq .L_2a4
    cmp r0, #0xf
    cmpne r0, #0x9
    cmpne r0, #0xd
    ldmeqia sp!, {r3, pc}
    bl func_0201f19c
    bl func_02020b84
    ldmia sp!, {r3, pc}
.L_2a4:
    ldrh r0, [r1, #0x4]
    sub r0, r0, #0xa
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_380
    b .L_2c8
    b .L_380
    ldmia sp!, {r3, pc}
    ldmia sp!, {r3, pc}
.L_2c8:
    ldr r0, _LIT0
    ldr r1, [r0, #0x40]
    cmp r1, #0x3
    bne .L_318
    ldr r0, [r0, #0x30]
    cmp r0, #0x6
    ldmeqia sp!, {r3, pc}
    cmp r0, #0x4
    bne .L_374
    bl func_020200d8
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r0, _LIT0
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    beq .L_310
    ldr r0, _LIT1
    blx r1
.L_310:
    bl func_02020ba0
    ldmia sp!, {r3, pc}
.L_318:
    cmp r1, #0x5
    bne .L_374
    ldr r0, _LIT2
    mov ip, #0x1
    mov r2, #0x3
    mov r1, #0xd
    mov r3, #0x10
    str ip, [sp]
    bl func_020a037c
    cmp r0, #0x0
    beq .L_350
    bl func_0201f19c
    bl func_02020ba0
    ldmia sp!, {r3, pc}
.L_350:
    ldr r0, _LIT0
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    beq .L_368
    ldr r0, _LIT3
    blx r1
.L_368:
    mov r0, #0x5
    bl func_0201f138
    ldmia sp!, {r3, pc}
.L_374:
    mov r0, #0x4
    bl func_0201f138
    ldmia sp!, {r3, pc}
.L_380:
    ldr r0, _LIT0
    ldr r2, [r0, #0x38]
    cmp r2, #0x0
    ldmeqia sp!, {r3, pc}
    ldrh r1, [r1, #0x4]
    ldr r0, _LIT4
    blx r2
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191f40
_LIT1: .word data_020c675c
_LIT2: .word data_02192b00
_LIT3: .word data_020c6784
_LIT4: .word data_020c6530
