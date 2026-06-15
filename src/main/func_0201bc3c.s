; func_0201bc3c — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern GetSystemWork
        .extern __sinit_ov007_021b2f64
        .extern data_020c5cf4
        .extern data_020c5d08
        .extern data_020c5d20
        .extern data_020c5d38
        .extern data_020c5d4c
        .extern data_020c5d60
        .extern data_020c5d78
        .global func_0201bc3c
        .arm
func_0201bc3c:
    stmdb sp!, {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r1
    bl GetSystemWork
    mov r4, r0
    tst r6, #0x4000
    beq .L_a0
    ldr r0, _LIT0
    bl __sinit_ov007_021b2f64
    str r0, [r4, #0x810]
    b .L_144
.L_a0:
    tst r6, #0x8000
    beq .L_d4
    cmp r5, #0x0
    beq .L_bc
    ldr r0, _LIT1
    bl __sinit_ov007_021b2f64
    b .L_c4
.L_bc:
    ldr r0, _LIT2
    bl __sinit_ov007_021b2f64
.L_c4:
    str r0, [r4, #0x810]
    mov r0, #0x4
    str r0, [r4, #0x918]
    b .L_144
.L_d4:
    tst r6, #0x10000
    beq .L_108
    cmp r5, #0x0
    beq .L_f0
    ldr r0, _LIT3
    bl __sinit_ov007_021b2f64
    b .L_f8
.L_f0:
    ldr r0, _LIT4
    bl __sinit_ov007_021b2f64
.L_f8:
    str r0, [r4, #0x810]
    mov r0, #0x3
    str r0, [r4, #0x918]
    b .L_144
.L_108:
    tst r6, #0x20000
    beq .L_144
    cmp r5, #0x0
    beq .L_130
    ldr r0, _LIT5
    bl __sinit_ov007_021b2f64
    str r0, [r4, #0x810]
    mov r0, #0x3
    str r0, [r4, #0x918]
    b .L_144
.L_130:
    ldr r0, _LIT6
    bl __sinit_ov007_021b2f64
    str r0, [r4, #0x810]
    mov r0, #0x4
    str r0, [r4, #0x918]
.L_144:
    mov r0, #0x1
    ldmia sp!, {r4, r5, r6, pc}
_LIT0: .word data_020c5cf4
_LIT1: .word data_020c5d08
_LIT2: .word data_020c5d20
_LIT3: .word data_020c5d38
_LIT4: .word data_020c5d4c
_LIT5: .word data_020c5d60
_LIT6: .word data_020c5d78
