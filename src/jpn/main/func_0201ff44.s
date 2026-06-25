; func_0201ff44 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c6450
        .extern data_020c667c
        .extern data_020c66a4
        .extern data_02191e60
        .extern data_02192a20
        .extern func_0201f0e4
        .extern func_0201f148
        .extern func_02020084
        .extern func_02020b30
        .extern func_02020b4c
        .extern func_020a0288
        .global func_0201ff44
        .arm
func_0201ff44:
    stmdb sp!, {r3, lr}
    mov r1, r0
    ldrh r0, [r1, #0x2]
    cmp r0, #0x0
    beq .L_30
    cmp r0, #0xf
    cmpne r0, #0x9
    cmpne r0, #0xd
    ldmeqia sp!, {r3, pc}
    bl func_0201f148
    bl func_02020b30
    ldmia sp!, {r3, pc}
.L_30:
    ldrh r0, [r1, #0x4]
    sub r0, r0, #0xa
    cmp r0, #0x3
    addls pc, pc, r0, lsl #0x2
    b .L_10c
    b .L_54
    b .L_10c
    ldmia sp!, {r3, pc}
    ldmia sp!, {r3, pc}
.L_54:
    ldr r0, _LIT0
    ldr r1, [r0, #0x40]
    cmp r1, #0x3
    bne .L_a4
    ldr r0, [r0, #0x30]
    cmp r0, #0x6
    ldmeqia sp!, {r3, pc}
    cmp r0, #0x4
    bne .L_100
    bl func_02020084
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    ldr r0, _LIT0
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    beq .L_9c
    ldr r0, _LIT1
    blx r1
.L_9c:
    bl func_02020b4c
    ldmia sp!, {r3, pc}
.L_a4:
    cmp r1, #0x5
    bne .L_100
    ldr r0, _LIT2
    mov ip, #0x1
    mov r2, #0x3
    mov r1, #0xd
    mov r3, #0x10
    str ip, [sp]
    bl func_020a0288
    cmp r0, #0x0
    beq .L_dc
    bl func_0201f148
    bl func_02020b4c
    ldmia sp!, {r3, pc}
.L_dc:
    ldr r0, _LIT0
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    beq .L_f4
    ldr r0, _LIT3
    blx r1
.L_f4:
    mov r0, #0x5
    bl func_0201f0e4
    ldmia sp!, {r3, pc}
.L_100:
    mov r0, #0x4
    bl func_0201f0e4
    ldmia sp!, {r3, pc}
.L_10c:
    ldr r0, _LIT0
    ldr r2, [r0, #0x38]
    cmp r2, #0x0
    ldmeqia sp!, {r3, pc}
    ldrh r1, [r1, #0x4]
    ldr r0, _LIT4
    blx r2
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191e60
_LIT1: .word data_020c667c
_LIT2: .word data_02192a20
_LIT3: .word data_020c66a4
_LIT4: .word data_020c6450
