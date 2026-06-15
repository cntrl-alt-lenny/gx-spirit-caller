; func_02020ba0 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c6840
        .extern data_020c685c
        .extern data_02191f40
        .extern func_0201f138
        .extern func_0201f6c0
        .extern func_0201f724
        .extern func_02020130
        .extern func_02020188
        .extern func_02020b84
        .global func_02020ba0
        .arm
func_02020ba0:
    stmdb sp!, {r3, lr}
    ldr r0, _LIT0
    ldr r1, [r0, #0x30]
    cmp r1, #0x1
    bne .L_2c
    ldr r1, [r0, #0x38]
    cmp r1, #0x0
    ldmeqia sp!, {r3, pc}
    ldr r0, _LIT1
    blx r1
    ldmia sp!, {r3, pc}
.L_2c:
    ldr r2, [r0, #0x38]
    cmp r2, #0x0
    beq .L_40
    ldr r0, _LIT2
    blx r2
.L_40:
    ldr r0, _LIT0
    ldr r0, [r0, #0x30]
    cmp r0, #0x6
    cmpne r0, #0x5
    cmpne r0, #0x4
    mov r0, #0x3
    beq .L_68
    bl func_0201f138
    bl func_02020b84
    ldmia sp!, {r3, pc}
.L_68:
    bl func_0201f138
    ldr r0, _LIT0
    ldr r0, [r0, #0x40]
    cmp r0, #0x5
    addls pc, pc, r0, lsl #0x2
    ldmia sp!, {r3, pc}
    b .L_d4
    b .L_ac
    b .L_c0
    b .L_98
    b .L_d4
    b .L_ac
.L_98:
    bl func_02020130
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    bl func_02020b84
    ldmia sp!, {r3, pc}
.L_ac:
    bl func_02020188
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    bl func_02020b84
    ldmia sp!, {r3, pc}
.L_c0:
    bl func_0201f6c0
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    bl func_02020b84
    ldmia sp!, {r3, pc}
.L_d4:
    bl func_0201f724
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    bl func_02020b84
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191f40
_LIT1: .word data_020c6840
_LIT2: .word data_020c685c
