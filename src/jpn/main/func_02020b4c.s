; func_02020b4c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020c6760
        .extern data_020c677c
        .extern data_02191e60
        .extern func_0201f0e4
        .extern func_0201f66c
        .extern func_0201f6d0
        .extern func_020200dc
        .extern func_02020134
        .extern func_02020b30
        .global func_02020b4c
        .arm
func_02020b4c:
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
    bl func_0201f0e4
    bl func_02020b30
    ldmia sp!, {r3, pc}
.L_68:
    bl func_0201f0e4
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
    bl func_020200dc
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    bl func_02020b30
    ldmia sp!, {r3, pc}
.L_ac:
    bl func_02020134
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    bl func_02020b30
    ldmia sp!, {r3, pc}
.L_c0:
    bl func_0201f66c
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    bl func_02020b30
    ldmia sp!, {r3, pc}
.L_d4:
    bl func_0201f6d0
    cmp r0, #0x0
    ldmneia sp!, {r3, pc}
    bl func_02020b30
    ldmia sp!, {r3, pc}
_LIT0: .word data_02191e60
_LIT1: .word data_020c6760
_LIT2: .word data_020c677c
