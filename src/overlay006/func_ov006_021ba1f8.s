; func_ov006_021ba1f8 — whole-function ship-as-.s (GLOBAL_ASM endgame, brief 302):
; the original disassembly emitted verbatim as a byte-exact mwasm TU.
; For reg-alloc-walled functions with no C match (brief 294 endgame).

        .text
        .extern data_020f8c60
        .extern data_021040ac
        .extern func_020211c8
        .extern func_0202147c
        .extern func_0202227c
        .extern func_ov006_021bbdc0
        .extern func_ov006_021bbe7c
        .extern func_ov006_021bc0cc
        .extern func_ov006_021bc45c
        .extern func_ov006_021bcb94
        .extern func_ov006_021bcedc
        .extern func_ov006_021be6f4
        .extern func_ov006_021bee68
        .extern func_ov006_021beec4
        .extern func_ov006_021bef6c
        .extern func_ov006_021bf01c
        .extern func_ov006_021bf2a4
        .extern func_ov006_021bf454
        .extern func_ov006_021bf4fc
        .extern func_ov006_021bf5e4
        .extern func_ov006_021bf844
        .extern func_ov006_021c0c14
        .extern func_ov006_021c0dc8
        .extern func_ov006_021c11c8
        .global func_ov006_021ba1f8
        .arm
func_ov006_021ba1f8:
    stmdb sp!, {r3, r4, r5, r6, r7, lr}
    mov r7, r0
    ldr r0, _LIT0
    bl func_020211c8
    str r0, [r7]
    bl func_0202147c
    mov r0, #0x0
    add r1, r7, #0x154
    strb r0, [r7, #0x154]
    bl func_0202227c
    mov r5, #0x0
    add r6, r7, #0x174
    mov r4, r5
.L_34:
    mov r1, r6
    add r0, r5, #0x1
    strb r4, [r6], #0x20
    bl func_0202227c
    add r5, r5, #0x1
    cmp r5, #0x28
    blt .L_34
    mov r0, r7
    bl func_ov006_021bbdc0
    mov r0, r7
    bl func_ov006_021bbe7c
    mov r0, r7
    bl func_ov006_021bc0cc
    mov r0, r7
    bl func_ov006_021be6f4
    mov r1, #0x1
    str r1, [sp]
    mov r0, r7
    mov r2, r1
    mov r3, r1
    bl func_ov006_021bc45c
    ldr r0, [r7, #0x40]
    cmp r0, #0x1
    bne .L_a4
    mov r1, #0x1
    mov r0, r7
    mov r2, r1
    bl func_ov006_021bcb94
.L_a4:
    mov r1, #0x1
    mov r0, r7
    mov r2, r1
    bl func_ov006_021bcedc
    mov r0, r7
    bl func_ov006_021beec4
    ldr r0, [r7, #0x40]
    cmp r0, #0x6
    addls pc, pc, r0, lsl #0x2
    b .L_120
    b .L_120
    b .L_e8
    b .L_f4
    b .L_120
    b .L_120
    b .L_100
    b .L_10c
.L_e8:
    mov r0, r7
    bl func_ov006_021bf01c
    b .L_128
.L_f4:
    mov r0, r7
    bl func_ov006_021bf2a4
    b .L_128
.L_100:
    mov r0, r7
    bl func_ov006_021bf454
    b .L_128
.L_10c:
    mov r0, r7
    bl func_ov006_021bf4fc
    mov r0, r7
    bl func_ov006_021bf5e4
    b .L_128
.L_120:
    mov r0, r7
    bl func_ov006_021bef6c
.L_128:
    mov r0, r7
    bl func_ov006_021bf844
    mov r0, r7
    bl func_ov006_021c0c14
    mov r0, r7
    bl func_ov006_021c0dc8
    mov r0, r7
    mov r1, #0x1
    bl func_ov006_021bee68
    mov r0, r7
    bl func_ov006_021c11c8
    ldr r1, _LIT1
    mov r0, #0x1
    str r0, [r1, #0x1c]
    ldmia sp!, {r3, r4, r5, r6, r7, pc}
_LIT0: .word data_020f8c60
_LIT1: .word data_021040ac
