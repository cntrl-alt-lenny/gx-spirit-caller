; func_020097d4 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104e5c
        .extern data_0210585c
        .extern func_0201a3b8
        .extern func_0201a464
        .global func_020097d4
        .arm
func_020097d4:
    stmdb sp!, {r4, lr}
    mov r4, #0x0
    mov r1, r4
    mov r0, #0x1
.L_10:
    orr r4, r4, r0, lsl r1
    add r1, r1, #0x1
    cmp r1, #0x4
    blt .L_10
    ldr r0, _LIT0
    ldrh r2, [r0, #0x62]
    cmp r2, #0x1c
    movgt r2, #0x1c
    mov r1, r2, lsr #0x1f
    rsb r0, r1, r2, lsl #0x1f
    adds r0, r1, r0, ror #0x1f
    subne r2, r2, #0x1
    cmp r2, #0x1c
    addls pc, pc, r2, lsl #0x2
    b .L_f8
    b .L_f8
    b .L_f8
    b .L_f4
    b .L_f8
    b .L_f0
    b .L_f8
    b .L_ec
    b .L_f8
    b .L_e8
    b .L_f8
    b .L_e4
    b .L_f8
    b .L_e0
    b .L_f8
    b .L_dc
    b .L_f8
    b .L_d8
    b .L_f8
    b .L_d4
    b .L_f8
    b .L_d0
    b .L_f8
    b .L_cc
    b .L_f8
    b .L_c8
    b .L_f8
    b .L_c4
    b .L_f8
    b .L_c0
.L_c0:
    orr r4, r4, #0x2000000
.L_c4:
    orr r4, r4, #0x1000000
.L_c8:
    orr r4, r4, #0x800000
.L_cc:
    orr r4, r4, #0x400000
.L_d0:
    orr r4, r4, #0x200000
.L_d4:
    orr r4, r4, #0x80000
.L_d8:
    orr r4, r4, #0x20000
.L_dc:
    orr r4, r4, #0x4000
.L_e0:
    orr r4, r4, #0x1000
.L_e4:
    orr r4, r4, #0x400
.L_e8:
    orr r4, r4, #0x200
.L_ec:
    orr r4, r4, #0x100
.L_f0:
    orr r4, r4, #0x40
.L_f4:
    orr r4, r4, #0x10
.L_f8:
    ldr r0, _LIT1
    ldr r0, [r0, #0x938]
    cmp r0, #0x7
    orrcs r4, r4, #0x80
    cmp r0, #0x18
    orrcs r4, r4, #0x800
    cmp r0, #0x28
    orrcs r4, r4, #0x40000
    cmp r0, #0x2d
    orrcs r4, r4, #0x100000
    bl func_0201a3b8
    cmp r0, #0x0
    beq .L_144
    ldr r0, _LIT1
    ldr r0, [r0, #0x938]
    cmp r0, #0xb
    orrcs r4, r4, #0x20
    cmp r0, #0x12
    orrcs r4, r4, #0x8000
.L_144:
    bl func_0201a464
    cmp r0, #0x0
    beq .L_168
    ldr r0, _LIT1
    ldr r0, [r0, #0x938]
    cmp r0, #0xb
    orrcs r4, r4, #0x2000
    cmp r0, #0x12
    orrcs r4, r4, #0x10000
.L_168:
    mov r0, r4
    ldmia sp!, {r4, pc}
_LIT0: .word data_0210585c
_LIT1: .word data_02104e5c
