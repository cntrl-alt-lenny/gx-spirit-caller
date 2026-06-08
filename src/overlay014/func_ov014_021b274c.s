; func_ov014_021b274c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_02104f4c
        .extern data_02105989
        .extern data_ov014_021b5040
        .extern data_ov014_02235094
        .extern func_02094504
        .extern func_020aadf8
        .extern func_ov005_021ad018
        .extern func_ov014_021b2fb8
        .global func_ov014_021b274c
        .arm
func_ov014_021b274c:
    stmdb sp!, {r4, lr}
    mov r4, r0
    ldr r0, [r4, #0x2c]
    cmp r0, #0x0
    bne .L_64
    ldr r1, _LIT0
    mov r0, #0x0
    mov r2, #0x4c
    bl func_02094504
    ldr r0, _LIT1
    ldr r1, [r0, #0x4]
    ldrb r0, [r0, #0xa3c]
    mov r1, r1, lsl #0x1d
    mov r1, r1, lsr #0x1d
    mov r0, r0, lsl #0x1d
    cmp r1, r0, lsr #0x1d
    bne .L_54
    ldr r1, _LIT2
    add r0, r4, #0xc
    bl func_020aadf8
    b .L_64
.L_54:
    add r1, r4, #0xc
    mov r0, #0x0
    mov r2, #0x20
    bl func_02094504
.L_64:
    mov r1, #0x0
    str r1, [r4, #0x2c]
    str r1, [r4, #0x8]
    str r1, [r4]
    ldr r0, _LIT3
    str r1, [r4, #0x4]
    ldr r0, [r0, #0x44]
    cmp r0, #0x0
    beq .L_a0
    mov r2, #0x1
    add r0, r4, #0xc
    mov r1, #0x3
    str r2, [r4, #0x2c]
    bl func_ov005_021ad018
    b .L_a8
.L_a0:
    mov r0, r4
    bl func_ov014_021b2fb8
.L_a8:
    mov r0, #0x1
    ldmia sp!, {r4, pc}
_LIT0: .word data_ov014_02235094
_LIT1: .word data_02104f4c
_LIT2: .word data_02105989
_LIT3: .word data_ov014_021b5040
