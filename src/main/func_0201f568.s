; func_0201f568 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c6530
        .extern data_020c6550
        .extern data_02191f40
        .extern data_02192b00
        .extern func_0201f138
        .extern func_0201f19c
        .extern func_0201f68c
        .extern func_020a037c
        .global func_0201f568
        .arm
func_0201f568:
    stmdb sp!, {r3, lr}
    mov r1, r0
    ldrh r0, [r1, #0x2]
    cmp r0, #0x0
    beq .L_240
    bl func_0201f19c
    mov r0, #0x9
    bl func_0201f138
    ldmia sp!, {r3, pc}
.L_240:
    ldrh r0, [r1, #0x4]
    sub r0, r0, #0xa
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_310
    b .L_264
    ldmia sp!, {r3, pc}
    b .L_310
    b .L_310
.L_264:
    ldr r0, _LIT0
    ldr r1, [r0, #0x40]
    cmp r1, #0x2
    bne .L_2bc
    ldr r0, [r0, #0x30]
    cmp r0, #0x4
    bne .L_2b0
    bl func_0201f68c
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r0, _LIT0
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    beq .L_2a4
    ldr r0, _LIT1
    blx r1
.L_2a4:
    mov r0, #0x9
    bl func_0201f138
    ldmia sp!, {r3, pc}
.L_2b0:
    cmp r0, #0x6
    bne .L_304
    ldmia sp!, {r3, pc}
.L_2bc:
    cmp r1, #0x4
    bne .L_304
    ldr r0, _LIT2
    mov ip, #0x1
    mov r2, #0x3
    mov r1, #0xd
    mov r3, #0x10
    str ip, [sp]
    bl func_020a037c
    cmp r0, #0x0
    beq .L_2f8
    bl func_0201f19c
    mov r0, #0x9
    bl func_0201f138
    ldmia sp!, {r3, pc}
.L_2f8:
    mov r0, #0x5
    bl func_0201f138
    ldmia sp!, {r3, pc}
.L_304:
    mov r0, #0x4
    bl func_0201f138
    ldmia sp!, {r3, pc}
.L_310:
    ldr r0, _LIT0
    ldr r2, [r0, #0x38]
    cmp r2, #0x0
    ldmeqia sp!, {r3, pc}
    ldrh r1, [r1, #0x4]
    ldr r0, _LIT3
    blx r2
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191f40
_LIT1: .word data_020c6550
_LIT2: .word data_02192b00
_LIT3: .word data_020c6530
